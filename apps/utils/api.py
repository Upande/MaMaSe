from dateutil.relativedelta import relativedelta
import datetime
import json

from django.db.models import Avg, Max, Min, Sum, Count
from django.http import JsonResponse
from django.core.cache import cache
from django.db import connection
from django.db.models import Q

from apps.utils.models import (Channel, River,
                               Feed, AggregateMonthlyFeed,
                               AggregateDailyFeed, ChannelField)

from util.scripts.timing_decorator import time_usage


@time_usage
def getFeeds(request):
    """
    To use this API, you can filter based on four parameters. You can filter by
    channel, start time or end time. These three could be used indivually or
    together. The fourth parameter is the limit on number of results returned.
    The filtering is a GET request.

    An example would be
      /mamase/api/feed/?channel=1&start='2015-09-09'&end='2015-09-10'&limit=10

    This API request will return a very complicate data structure. It has 5
    levels namely Top Leval, Time Leval, Aggregation leval, Location leval then
    the data points
    """

    #Better validation is needed for the pararms below. e.g start and end

    channel = request.GET.get('channel', None)  # Select among list of channels
    start = request.GET.get('start', None)  # Data should be after this data
    end = request.GET.get('end', None)  # Data should be before this date
    limit = request.GET.get('limit', None)  # Maximum number of records
    data = request.GET.get('data', 'raw')  # Raw,Daily or Monthly. Default(raw)
    field = request.GET.get('field', None)  # A specific field e.g temp
    station_type = request.GET.get('stationtype', "WEATHER_STATION")  # Is it a w.station etc
    river = request.GET.get('river', None)  # Get all data points on a river
    tabledata = request.GET.get('tabledata', None)  # include monthlytabledata in request. Only when station is specified

    '''
    These requests need to be cached. Check if the exact requests is in cache.
    If in cache, return the cached data. If not, compile and send.
    Cache should time out after 10 mins.
    '''
    #cache_key = request.get_full_path()  # Use the full path as the cache key
    #result = cache.get(cache_key)

    #if result:
    #    return result

    kwargs = {}
    args = {}
    excludeargs = {}
    complexargs = {}
    fieldargs = {}
    fieldexcludeargs = {}
    monthlyData = {}

    if channel:
        kwargs['channelfield__channel_id'] = channel
        args['id'] = channel

    if field:
        kwargs['channelfield__field_id'] = field

    if start:
        kwargs['timestamp__gte'] = start

    if end:
        kwargs['timestamp__lte'] = end

    if station_type:
        station_type = station_type.upper()
        if station_type == "RAIN_TEMP":
            #Just get rain and temp values. Then get other values.
            #So filter with other variables.
            #Get all rain and temp values
            complexargs = (Q(channelfield__field__name__icontains='temp') |
                           Q(channelfield__field__name__icontains='rain'),)
            excludeargs['channelfield__field__name__icontains'] = 'soil temperature'

            fieldargs = (Q(field__name__icontains='Temperature (C)') |
                         Q(field__name__icontains='Rain (mm'),)

        elif station_type == "RIVER_DEPTH":
            if not channel and river:
                r = River.objects.filter(id=river)
                if r:
                    river = r[0]
                    kwargs['channelfield__channel_id'] = river.rivers.last().id  # Get data for just this station
                    args['type'] = station_type
        else:
            args['type'] = station_type

    if river:
        kwargs['channelfield__channel__river_id'] = river
        args['river_id'] = river

    feed = {}
    feed_without_null = []
    if data.lower() == "raw":
        feed_without_null = aggregateRawData(station_type, kwargs, complexargs, excludeargs)

    elif data.lower() == "daily":
        data = getAggregateDailyFeedData(station_type, kwargs, complexargs, excludeargs)
        feed['daily'] = ({'avg': list(data[0]),
                          'min': list(data[3]),
                          'max': list(data[4]),
                          'count': list(data[2]),
                          'sum': list(data[1])})

        feed_without_null.append(feed)

    elif data.lower() == "monthly":
        data = getAggregateMonthlyFeedData(station_type, kwargs, complexargs, excludeargs)
        feed['monthly'] = ({'avg': list(data[0]),
                            'min': list(data[3]),
                            'max': list(data[4]),
                            'count': list(data[2]),
                            'sum': list(data[1])})
        feed_without_null.append(feed)

    if tabledata:
        #Meaning that we should include the table data in the request
        startOfYear = getStartOfYear(start)
        endOfYear = getEndOfYear(end)

        if channel:
            channelfields = ChannelField.objects.filter(channel_id=channel, field=field)
        elif river:
            channelfields = ChannelField.objects.filter(channel__river_id=river, field=field)
        else:
            channelfields = []

        for item in channelfields:
            monthly_data_args = {}
            monthly_data_args['channelfield__field_id'] = item.field.id
            monthly_data_args['timestamp__gte'] = startOfYear
            monthly_data_args['timestamp__lte'] = endOfYear
            data = getAggregateMonthlyFeedData(station_type, monthly_data_args, complexargs, excludeargs)

            monthlyData[item.field.id] = ({'avg': list(data[0]),
                                          'min': list(data[3]),
                                          'max': list(data[4]),
                                          'count': list(data[2]),
                                          'sum': list(data[1])})


    ch = Channel.objects.filter(**args).order_by('-id')
    channels = []
    for i in ch:
        values = (i.channelfields.filter(*fieldargs)
                   .values('field__name', 'name',
                           'id', 'field__id').distinct()
                  )
        valuesdict = {'id': i.id, 'name': i.name,
                      'desciption': i.description,
                      'latitude': i.latitude,
                      'longitude': i.longitude,
                      'data_id': i.data_id}
        if i.river:
            valuesdict['river'] = i.river.id
        valuesdict['fields'] = list(values)
        channels.append(valuesdict)

    rivers = River.objects.all()
    riverdata = []
    for i in rivers:
        riverdata.append({'name': i.name, 'id': i.id})

    if limit:
        try:
            limit = int(limit)
            feed = feed[:limit]
        except:
            pass

    channel_without_null = channels  # removeEmptyString(ch)

    result = JsonResponse(dict(channel=channel_without_null,
                               feed=feed_without_null,
                               river=riverdata,
                               monthlydata=monthlyData))
    #cache.set(cache_key, result)
    return result


@time_usage
def getAllData(request):
    """
    This API request will return a very complicate data structure. It has 5
    levels namely Top Leval, Time Leval, Aggregation leval, Location leval
    then the data points
    """

    '''
    I shall test out two approaches.
          - Get all this data from the database and use django aggregators to
          do the math and ordering for me
          - Get all data and do the ordering via a loop in code
    '''

    # For raw data can we use
    #  /mamase/api/feed/?channel=1&start='2015-09-09'&end='2015-09-10'&limit=10
    # The get parameters are just an example

    ch = Channel.objects.all()

    daily_avg = []
    daily_sum = []
    daily_cnt = []
    daily_min = []
    daily_max = []

    month_avg = []
    month_sum = []
    month_cnt = []
    month_min = []
    month_max = []
    excludeargs = {}
    complexargs = {}

    for item in ch:
        chd_data = aggregateDailyFeedData(item.channel.type, {"channelfield__channel": item}, complexargs, excludeargs)
        chm_data = aggregateMonthlyFeedData(item.channel.type, {"channelfield__channel": item}, complexargs, excludeargs)

        daily_avg.append({item.id: list(chd_data[0])})
        daily_sum.append({item.id: list(chd_data[1])})
        daily_cnt.append({item.id: list(chd_data[2])})
        daily_min.append({item.id: list(chd_data[3])})
        daily_max.append({item.id: list(chd_data[4])})
        month_avg.append({item.id: list(chm_data[0])})
        month_sum.append({item.id: list(chm_data[1])})
        month_cnt.append({item.id: list(chm_data[2])})
        month_min.append({item.id: list(chm_data[3])})
        month_max.append({item.id: list(chm_data[4])})

    data = {}
    data['daily'] = ({'avg': daily_avg, 'min': daily_min, 'max': daily_max,
                      'count': daily_cnt, 'sum': daily_sum})
    data['monthly'] = ({'avg': month_avg, 'min': month_min, 'max': month_max,
                        'count': month_cnt, 'sum': month_sum})
    return JsonResponse(data)


def aggregateRawData(station_type, kwargs, complexargs, excludeargs):
    '''
    Initially I would just pass the raw query to the API. But that does not
    suffice since we separated channel and field as items we can filter by.
    Now we shall have to group the data and bundle elements of the same
    entryid together.
    '''
    if station_type == "RIVER_DEPTH":
        reading = 'reading'
    else:
        reading = 'reading'

    feed = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
            .extra(select={'timestamp_formatted': "to_char(timestamp, 'YYYY-MM-DD HH24:MI:SS')"})
            .values('entry_id', 'channelfield__channel_id',
                    'channelfield__name', 'timestamp_formatted',
                    reading, 'id').order_by('entry_id'))

    feed = list(feed)

    '''
    Could call the removeNullValue method but would rather just clean up
    everything in one loop. But there will be no nulls per se. Given we now
    only store data on known fields. Create tracker variable and group by
    entry id
    '''
    entryid_tracker = None
    data = []
    field_readings = {}

    for item in feed:
        if item['entry_id'] == entryid_tracker:  # We already have a record for this entry. Append the field data
            field_readings[item['channelfield__name']] = item[reading]
        else:
            '''
            At this point, we have moved from one entry_id to another.
            During the loop we have been bundling all data of one entry id into
            the field readings dict. We now need to appen that to the field
            readings dict and empty it for the next entry id. As such we remove
            the unneeded fields but backup reading and channel name since they
            are needed to create the dict. We then add the dict as is into the
            data list and start the loop again.
            '''
            r = item[reading]
            cfn = item['channelfield__name']
            item.pop(reading)  # Remove unneded fields
            item.pop('id')
            item.pop('channelfield__name')

            item['fields'] = field_readings
            data.append(item)

            field_readings = {}
            field_readings[cfn] = r

            entryid_tracker = item['entry_id']
        try:
            data[-1]['fields'] = field_readings
        except:
            print "No data found during that time"
    return data


def aggregateDailyFeedData(station_type, kwargs, complexargs, excludeargs):
    if station_type == "RIVER_DEPTH":
        reading = 'reading'
    else:
        reading = 'reading'

    d_avg = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-DD 12:00:00')"})
             .values('channelfield__channel', 'channelfield__field',
                     'channelfield__name', 'timestamp')
             .annotate(Avg(reading)))

    d_sum = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-DD 12:00:00')"})
             .values('channelfield__channel', 'channelfield__field',
                     'channelfield__name', 'timestamp')
             .annotate(Sum(reading),))

    d_min = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-DD 12:00:00')"})
             .values('channelfield__channel', 'channelfield__field',
                     'channelfield__name', 'timestamp')
             .annotate(Min(reading),))

    d_max = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-DD 12:00:00')"})
             .values('channelfield__channel', 'channelfield__field',
                     'channelfield__name', 'timestamp')
             .annotate(Max(reading),))

    d_count = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
               .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-DD 12:00:00')"})
               .values('channelfield__channel', 'channelfield__field',
                       'channelfield__name', 'timestamp')
               .annotate(Count(reading),))

    d_count = removeZeroValue(d_count)
    d_avg = removeNullValue(d_avg)
    d_max = removeNullValue(d_max)
    d_min = removeNullValue(d_min)
    d_sum = removeNullValue(d_sum)

    return d_avg, d_sum, d_count, d_min, d_max


def aggregateMonthlyFeedData(station_type, kwargs, complexargs, excludeargs):
    reading = 'reading'

    month_filter = connection.ops.date_trunc_sql('month', 'timestamp')
    #Let aggregate Monthly data
    m_avg = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra({'date': month_filter})
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-15 00:00:00')"})
             .values('channelfield__field', 'channelfield__channel__name',
                     'channelfield__name', 'timestamp')
             .annotate(Avg(reading),)
             .order_by('timestamp', 'channelfield__field')
             )

    m_max = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra({'date': month_filter})
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-15 00:00:00')"})
             .values('channelfield__field', 'channelfield__channel__name',
                     'channelfield__name', 'timestamp')
             .annotate(Max(reading),)
             .order_by('timestamp', 'channelfield__field')
             )

    m_min = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra({'date': month_filter})
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-15 00:00:00')"})
             .values('channelfield__field', 'channelfield__channel__name',
                     'channelfield__name', 'timestamp')
             .annotate(Min(reading),)
             .order_by('timestamp', 'channelfield__field')
             )

    m_sum = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
             .extra({'date': month_filter})
             .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-15 00:00:00')"})
             .values('channelfield__field', 'channelfield__channel__name',
                     'channelfield__name', 'timestamp')
             .annotate(Sum(reading),)
             .order_by('timestamp', 'channelfield__field')
             )

    m_count = (Feed.objects.filter(*complexargs).filter(**kwargs).exclude(**excludeargs)
               .extra({'date': month_filter})
               .extra(select={'timestamp': "to_char(timestamp, 'YYYY-MM-15 00:00:00')"})
               .values('channelfield__field', 'channelfield__channel__name',
                       'channelfield__name', 'timestamp')
               .annotate(Count(reading),)
               .order_by('timestamp', 'channelfield__field')
               )

    m_count = removeZeroValue(m_count)
    m_avg = removeNullValue(m_avg)
    m_max = removeNullValue(m_max)
    m_min = removeNullValue(m_min)
    m_sum = removeNullValue(m_sum)

    return m_avg, m_sum, m_count, m_min, m_max
    '''
    Maybe ignore the loop for now (Approach 3). Will take up alot of precious
    time designing the logic and most probably it will be slower. So the above
    works great. Like a charm. But it is not sorted by channels. I might have
    to do a loop on all channels and get data for that specific channel and
    return that as a dictionary. A loop might be unavoidable but it shall not
    be more than 10. (Number of channels) and that is acceptable by my books.
    Have this as two processes. Calculate and store result as JSON string. Do
    a query and get latest json string
    '''


def getAggregateMonthlyFeedData(station_type, kwargs, complexargs, excludeargs):
    m_avg = AggregateMonthlyFeed.objects.filter(aggregation='AVG').filter(**kwargs).values_list('data', flat=True)
    m_count = AggregateMonthlyFeed.objects.filter(aggregation='COUNT').filter(**kwargs).values_list('data', flat=True)
    m_sum = AggregateMonthlyFeed.objects.filter(aggregation='SUM').filter(**kwargs).values_list('data', flat=True)
    m_max = AggregateMonthlyFeed.objects.filter(aggregation='MAX').filter(**kwargs).values_list('data', flat=True)
    m_min = AggregateMonthlyFeed.objects.filter(aggregation='MIN').filter(**kwargs).values_list('data', flat=True)

    average = []
    count = []
    minimum = []
    maximum = []
    sumation = []

    for item in m_avg:
        average.append(json.loads(item))

    for item in m_count:
        count.append(json.loads(item))

    for item in m_min:
        minimum.append(json.loads(item))

    for item in m_max:
        maximum.append(json.loads(item))

    for item in m_sum:
        sumation.append(json.loads(item))

    return average, sumation, count, minimum, maximum


def getAggregateDailyFeedData(station_type, kwargs, complexargs, excludeargs):
    d_avg = AggregateDailyFeed.objects.filter(aggregation='AVG').filter(**kwargs).values_list('data', flat=True)
    d_count = AggregateDailyFeed.objects.filter(aggregation='COUNT').filter(**kwargs).values_list('data', flat=True)
    d_sum = AggregateDailyFeed.objects.filter(aggregation='SUM').filter(**kwargs).values_list('data', flat=True)
    d_max = AggregateDailyFeed.objects.filter(aggregation='MAX').filter(**kwargs).values_list('data', flat=True)
    d_min = AggregateDailyFeed.objects.filter(aggregation='MIN').filter(**kwargs).values_list('data', flat=True)

    average = []
    count = []
    minimum = []
    maximum = []
    sumation = []

    for item in d_avg:
        average.append(json.loads(item))

    for item in d_count:
        count.append(json.loads(item))

    for item in d_min:
        minimum.append(json.loads(item))

    for item in d_max:
        maximum.append(json.loads(item))

    for item in d_sum:
        sumation.append(json.loads(item))

    return average, sumation, count, minimum, maximum


def storeAggregatedData(channel=None, start=None, end=None):
    '''
    - Get most recent data(Monthly and repeat for daily)
    - If no recent data, add all data till now
    - else continue
    - Check if it should be updated
    - If no, add new entry
    - If yes, overwrite with new content
    - Save
    #Need to remove the None/null's from the data
    '''

    #I am tired. Forgive my poorly arranged code. I pray I come back and fix all this later.

    #Add Kwargs
    kwargs = {}

    if channel:
        kwargs['channel_id'] = channel

    chf = ChannelField.objects.filter(**kwargs)

    if not start:
        aggregateLatestMonthData(chf,)
        aggregateLatestDailyData(chf)
    else:
        aggregateMultipleMonthlyData(chf, start, end)
        aggregateMultipleDailyData(chf, start, end)


def aggregateMultipleMonthlyData(channelfields, start, end):
    excludeargs = {}
    complexargs = {}
    if not end:
        end = datetime.datetime.now()

    for item in channelfields:
        data = aggregateMonthlyFeedData(item.channel.type, {'channelfield': item,
                                        'timestamp__gte': start,
                                        'timestamp__lte': end}, complexargs,
                                        excludeargs)

        createAggregateMonthlyData(data, item)


def aggregateMultipleDailyData(channelfields, start, end):
    excludeargs = {}
    complexargs = {}
    if not end:
        end = datetime.datetime.now()

    for item in channelfields:
        data = aggregateDailyFeedData(item.channel.type, {'channelfield': item,
                                      'timestamp__gte': start,
                                      'timestamp__lte': end},
                                      complexargs, excludeargs)
        createAggregateDailyData(data, item)


def aggregateLatestMonthData(channelfields):
    excludeargs = {}
    complexargs = {}

    for item in channelfields:
        currentmonthly = (AggregateMonthlyFeed.objects.filter(channelfield=item)
                          .order_by('-timestamp').first())

        if currentmonthly:
            m = datetime.datetime.now().month
            thismonth = datetime.datetime.now().replace(day=1, hour=0,
                                                        minute=0,
                                                        second=0,
                                                        microsecond=0)

            nextmonth = thismonth + relativedelta(months=1)
            midmonth = datetime.datetime.now().replace(day=15,
                                                       hour=0,
                                                       minute=0,
                                                       second=0,
                                                       microsecond=0)
            timestampmonth = currentmonthly.timestamp.month

            if timestampmonth == m:
                data = aggregateMonthlyFeedData(item.channel.type, {'channelfield': item,
                                                'timestamp__gte': thismonth,
                                                'timestamp__lte': nextmonth},
                                                complexargs, excludeargs)

                updateAggregateMonthlyData(data, item)
            else:
                data = aggregateMonthlyFeedData(item.channel.type, {'channelfield': item,
                                                'timestamp__gte': thismonth,
                                                'timestamp__lte': nextmonth},
                                                complexargs, excludeargs)
                newAggregateMonthlyData(data, item, midmonth)

        else:
            '''No record exisits. Probably a new database'''
            mdata = aggregateMonthlyFeedData(item.channel.type, {'channelfield': item},
                                             complexargs, excludeargs)
            createAggregateMonthlyData(mdata, item)


def createAggregateMonthlyData(mdata, item):
    '''Called the first time we create a database. Initial setup only'''
    month_avg = list(mdata[0])
    month_sum = list(mdata[1])
    month_cnt = list(mdata[2])
    month_min = list(mdata[3])
    month_max = list(mdata[4])

    for ma in month_avg:
        x = AggregateMonthlyFeed.objects.get_or_create(data=ma,
                                                       channel=item.channel,
                                                       channelfield=item,
                                                       aggregation='AVG',
                                                       timestamp=ma['timestamp'])

    for ms in month_sum:
        x = AggregateMonthlyFeed.objects.get_or_create(data=ms,
                                                       channel=item.channel,
                                                       channelfield=item,
                                                       aggregation='SUM',
                                                       timestamp=ms['timestamp'])

    for mc in month_cnt:
        x = AggregateMonthlyFeed.objects.get_or_create(data=mc,
                                                       channel=item.channel,
                                                       channelfield=item,
                                                       aggregation='COUNT',
                                                       timestamp=mc['timestamp'])

    for mmi in month_min:
        x = AggregateMonthlyFeed.objects.get_or_create(data=mmi,
                                                       channel=item.channel,
                                                       channelfield=item,
                                                       aggregation='MIN',
                                                       timestamp=mmi['timestamp'])

    for mma in month_max:
        x = AggregateMonthlyFeed.objects.get_or_create(data=mma,
                                                       channel=item.channel,
                                                       channelfield=item, aggregation='MAX',
                                                       timestamp=mma['timestamp'])


def updateAggregateMonthlyData(data, item):
    '''Update an exisiting monthly record'''
    mc = (AggregateMonthlyFeed.objects.filter(aggregation="COUNT",
                                              channel=item.channel,
                                              channelfield=item)
          .order_by('-timestamp').first()
          )
    ma = (AggregateMonthlyFeed.objects.filter(aggregation="AVG",
                                              channel=item.channel,
                                              channelfield=item)
          .order_by('-timestamp').first())

    ms = (AggregateMonthlyFeed.objects.filter(aggregation="SUM",
                                              channel=item.channel,
                                              channelfield=item)
          .order_by('-timestamp').first()
          )
    mma = (AggregateMonthlyFeed.objects.filter(aggregation="MAX",
                                               channel=item.channel,
                                               channelfield=item)
           .order_by('-timestamp').first()
           )
    mmi = (AggregateMonthlyFeed.objects.filter(aggregation="MIN",
                                               channel=item.channel,
                                               channelfield=item)
           .order_by('-timestamp').first()
           )
    try:
        ma.data = list(data[0])[0]
        ma.lastupdate = datetime.datetime.now()
        ma.save()
    except:
        pass

    try:
        ms.data = list(data[1])[0]
        ms.lastupdate = datetime.datetime.now()
        ms.save()
    except:
        pass

    try:
        mc.data = list(data[2])[0]
        mc.lastupdate = datetime.datetime.now()
        mc.save()
    except:
        pass

    try:
        mmi.data = list(data[3])[0]
        mmi.lastupdate = datetime.datetime.now()
        mmi.save()
    except:
        pass

    try:
        mma.data = list(data[4])[0]
        mma.lastupdate = datetime.datetime.now()
        mma.save()
    except:
        pass


def newAggregateMonthlyData(data, item, midmonth):
    '''Create data for a new month. Called when we spill over to a new month.'''
    month_avg = list(data[0])
    month_sum = list(data[1])
    month_cnt = list(data[2])
    month_min = list(data[3])
    month_max = list(data[4])

    if month_avg:
        ma = AggregateMonthlyFeed(data=month_avg,
                                  channel=item.channel,
                                  channelfield=item,
                                  aggregation='AVG',
                                  timestamp=midmonth)
        ma.save()

    if month_sum:
        ms = AggregateMonthlyFeed(data=month_sum,
                                  channel=item.channel,
                                  channelfield=item,
                                  aggregation='SUM',
                                  timestamp=midmonth)
        ms.save()

    if month_cnt:
        mc = AggregateMonthlyFeed(data=month_cnt,
                                  channel=item.channel,
                                  channelfield=item,
                                  aggregation='COUNT',
                                  timestamp=midmonth)
        mc.save()

    if month_min:
        mmi = AggregateMonthlyFeed(data=month_min,
                                   channel=item.channel,
                                   channelfield=item,
                                   aggregation='MIN',
                                   timestamp=midmonth)
        mmi.save()

    if month_max:
        mma = AggregateMonthlyFeed(data=month_max,
                                   channel=item.channel,
                                   channelfield=item,
                                   aggregation='MAX',
                                   timestamp=midmonth)
        mma.save()


def aggregateLatestDailyData(channelfields):
    excludeargs = {}
    complexargs = {}

    for item in channelfields:
        currentdaily = (AggregateDailyFeed.objects.filter(channelfield=item)
                        .order_by('-timestamp').first())
        today = datetime.datetime.now().replace(hour=0, minute=0, second=0,
                                                microsecond=0)
        if currentdaily:
            d = datetime.datetime.now().day

            timestampday = currentdaily.timestamp.day

            if timestampday == d:
                data = aggregateDailyFeedData(item.channel.type, {'channelfield': item,
                                              'timestamp__gte': today},
                                              complexargs, excludeargs
                                              )
                updateAggregateDailyData(data, item, today)

            else:
                data = aggregateDailyFeedData(item.channel.type, {'channelfield': item,
                                              'timestamp__gte': today},
                                              complexargs, excludeargs)
                newAggregateDailyData(data, item, today)

        else:
            ddata = aggregateDailyFeedData(item.channel.type, {'channelfield': item},
                                           complexargs, excludeargs)
            createAggregateDailyData(ddata, item)


def createAggregateDailyData(ddata, item):
    '''Called the first time we create a database. Initial setup only'''
    daily_avg = list(ddata[0])
    daily_sum = list(ddata[1])
    daily_cnt = list(ddata[2])
    daily_min = list(ddata[3])
    daily_max = list(ddata[4])

    for da in daily_avg:
        x = AggregateDailyFeed.objects.get_or_create(data=da,
                                                     channel=item.channel,
                                                     channelfield=item,
                                                     aggregation='AVG',
                                                     timestamp=da['timestamp'])

    for ds in daily_sum:
        x = AggregateDailyFeed.objects.get_or_create(data=ds,
                                                     channel=item.channel,
                                                     channelfield=item,
                                                     aggregation='SUM',
                                                     timestamp=ds['timestamp'])

    for dc in daily_cnt:
        x = AggregateDailyFeed.objects.get_or_create(data=dc,
                                                     channel=item.channel,
                                                     channelfield=item,
                                                     aggregation='COUNT',
                                                     timestamp=dc['timestamp'])

    for dmi in daily_min:
        x = AggregateDailyFeed.objects.get_or_create(data=dmi,
                                                     channel=item.channel,
                                                     channelfield=item,
                                                     aggregation='MIN',
                                                     timestamp=dmi['timestamp'])

    for dma in daily_max:
        x = AggregateDailyFeed.objects.get_or_create(data=dma,
                                                     channel=item.channel,
                                                     channelfield=item,
                                                     aggregation='MAX',
                                                     timestamp=dma['timestamp'])


def updateAggregateDailyData(data, item, today):
    '''Update an exisiting daily record'''
    dc = (AggregateDailyFeed.objects.filter(aggregation="COUNT",
                                            channel=item.channel,
                                            channelfield=item)
          .order_by('-timestamp').first()
          )
    da = (AggregateDailyFeed.objects.filter(aggregation="AVG",
                                            channel=item.channel,
                                            channelfield=item)
          .order_by('-timestamp').first()
          )
    ds = (AggregateDailyFeed.objects.filter(aggregation="SUM",
                                            channel=item.channel,
                                            channelfield=item)
          .order_by('-timestamp').first()
          )
    dma = (AggregateDailyFeed.objects.filter(aggregation="MAX",
                                             channel=item.channel,
                                             channelfield=item)
           .order_by('-timestamp').first()
           )
    dmi = (AggregateDailyFeed.objects.filter(aggregation="MIN",
                                             channel=item.channel,
                                             channelfield=item)
           .order_by('-timestamp').first()
           )
    try:
        da.data = list(data[0])[0]
        da.lastupdate = datetime.datetime.now()
        da.save()
    except:
        pass

    try:
        ds.data = list(data[1])[0]
        ds.lastupdate = datetime.datetime.now()
        ds.save()
    except:
        pass

    try:
        dc.data = list(data[2])[0]
        dc.lastupdate = datetime.datetime.now()
        dc.save()
    except:
        pass

    try:
        dma.data = list(data[3])[0]
        dma.lastupdate = datetime.datetime.now()
        dma.save()
    except:
        pass

    try:
        dmi.data = list(data[4])[0]
        dmi.lastupdate = datetime.datetime.now()
        dmi.save()
    except:
        pass


def newAggregateDailyData(data, item, today):
    '''Create data for a new month. Called when we spill over to a new day.'''
    daily_avg = list(data[0])
    daily_sum = list(data[1])
    daily_cnt = list(data[2])
    daily_min = list(data[3])
    daily_max = list(data[4])

    if daily_avg:
        da = AggregateDailyFeed(data=daily_avg,
                                channel=item.channel,
                                channelfield=item,
                                aggregation='AVG',
                                timestamp=today)
        da.save()

    if daily_sum:
        ds = AggregateDailyFeed(data=daily_sum,
                                channel=item.channel,
                                channelfield=item,
                                aggregation='SUM',
                                timestamp=today)
        ds.save()

    if daily_cnt:
        dc = AggregateDailyFeed(data=daily_cnt,
                                channel=item.channel,
                                channelfield=item,
                                aggregation='COUNT',
                                timestamp=today)
        dc.save()

    if daily_min:
        dmi = AggregateDailyFeed(data=daily_min,
                                 channel=item.channel,
                                 channelfield=item,
                                 aggregation='MIN',
                                 timestamp=today)
        dmi.save()

    if daily_max:
        dma = AggregateDailyFeed(data=daily_max,
                                 channel=item.channel,
                                 channelfield=item,
                                 aggregation='MAX',
                                 timestamp=today)
        dma.save()


def removeNullValue(data):
    data_without_null = []
    for item in data:
        data_without_null.append(dict((k, v) for (k, v) in item.items() if v is not None))

    return data_without_null


def removeZeroValue(data):
    #For counts
    data_without_zero = []
    for item in data:
        data_without_zero.append(dict((k, v) for (k, v) in item.items() if v is not 0))

    return data_without_zero


def removeEmptyString(data):
    data_without_empty = []

    for item in data:
        data_without_empty.append(dict((k, v) for (k, v) in item.items() if v != ""))

    return data_without_empty


def getStartOfYear(start):
    #Sort of a hack. But works. Fix later
    year = start[:4]
    return year + '-01-01'


def getEndOfYear(end):
    #Sort of a hack. But works. Fix later
    year = end[:4]
    return year + '-12-31'
