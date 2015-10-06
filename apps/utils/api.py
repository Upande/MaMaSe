import datetime
import json

from django.db.models import Avg,Max,Min,Sum,Count
from django.http import JsonResponse
from django.db import connection

from apps.utils.models import Channel,Feed,AggregateMonthlyFeed,AggregateDailyFeed
from util.scripts.timing_decorator import time_usage

def getFeeds(request):
    """
    To use this API, you can filter based on four parameters. You can filter by channel, start time or end time. These three could be used indivually or together.
    The fourth parameter is the limit on number of results returned. The filtering is a GET request.
    
    An example would be  /mamase/api/feed/?channel=1&start='2015-09-09'&end='2015-09-10'&limit=10
    
    This API request will return a very complicate data structure. It has 5 levels namely Top Leval, Time Leval, Aggregation leval, Location leval then the data points
    """
    channel = request.GET.get('channel',None)
    start = request.GET.get('start',None)
    end = request.GET.get('end',None)
    limit = request.GET.get('limit',None)

    kwargs = {}
    args = {}

    if channel:
        kwargs[ 'channel_id' ] = channel
        args['id'] = channel
        
    if start:
        kwargs[ 'added__gte' ] = start

    if end:
        kwargs[ 'added__lte' ] = end
        
    feed = Feed.objects.filter(**kwargs).extra(select={'added_formatted':"to_char(added, 'YYYY-MM-DD HH24:MI:SS')"}).values('entry_id','channel_id','added_formatted','field1','field2','field3','field4','field5','field6','field7','field8','id')    
    ch = Channel.objects.filter(**args).values('id','name','description','latitude','longitude','field1','field2','field3','field4','field5','field6','field7','field8')

    if limit:
        try:
            limit = int(limit)
            feed = feed[:limit]
        except:
            pass

    feed = list(feed)
    feed_without_null = []
    channel_without_null = []

    for item in ch:
        channel_without_null.append(dict((k,v) for (k,v) in item.items() if v != ""))
        
    for item in feed:
        feed_without_null.append(dict((k,v) for (k,v) in item.items() if v is not None))
        
    return JsonResponse(dict(channel=channel_without_null,feed=feed_without_null))

@time_usage
def getAllData(request):
    """
    This API request will return a very complicate data structure. It has 5 levels namely Top Leval, Time Leval, Aggregation leval, Location leval then the data points    
    """
    
    '''
    I shall test out two approaches. 
          - Get all this data from the database and use django aggregators to do the math and ordering for me
          - Get all data and do the ordering via a loop in code
    '''
    
    # For raw data can we use /mamase/api/feed/?channel=1&start='2015-09-09'&end='2015-09-10'&limit=10? The get parameters are just an example

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

    for item in ch:
        chd_data = aggregateDailyFeedData({"channel":item})
        chm_data = aggregateMonthlyFeedData({"channel":item})
            
        daily_avg.append({item.id:list(chd_data[0])})
        daily_sum.append({item.id:list(chd_data[1])})
        daily_cnt.append({item.id:list(chd_data[2])})
        daily_min.append({item.id:list(chd_data[3])})
        daily_max.append({item.id:list(chd_data[4])})
        month_avg.append({item.id:list(chm_data[0])})
        month_sum.append({item.id:list(chm_data[1])})
        month_cnt.append({item.id:list(chm_data[2])})
        month_min.append({item.id:list(chm_data[3])})
        month_max.append({item.id:list(chm_data[4])})
        
    data = {}
    data['daily'] = ({'average':daily_avg,'min':daily_min, 'max':daily_max, 'count':daily_cnt, 'sum':daily_sum})
    data['monthly'] = ({'average':month_avg,'min':month_min, 'max':month_max, 'count':month_cnt, 'sum':month_sum})
    return JsonResponse(data)

def aggregateDailyFeedData(kwargs):
    d_avg = Feed.objects.filter(**kwargs).extra(select={'added':"to_char(added, 'YYYY-MM-DD 12:00:00')"}).values('channel__name','added').annotate(
        Avg('field1'),
        Avg('field2'),
        Avg('field3'),
        Avg('field4'),
        Avg('field5'),
        Avg('field6'),
        Avg('field7'),
        Avg('field8'),
    )

    d_sum = Feed.objects.filter(**kwargs).extra(select={'added':"to_char(added, 'YYYY-MM-DD 12:00:00')"}).values('channel__name','added').annotate(
        Sum('field1'),
        Sum('field2'),
        Sum('field3'),
        Sum('field4'),
        Sum('field5'),
        Sum('field6'),
        Sum('field7'),
        Sum('field8'),
    )
    
    d_min = Feed.objects.filter(**kwargs).extra(select={'added':"to_char(added, 'YYYY-MM-DD 12:00:00')"}).values('channel__name','added').annotate(
        Min('field1'),
        Min('field2'),
        Min('field3'),
        Min('field4'),
        Min('field5'),
        Min('field6'),
        Min('field7'),
        Min('field8'),
    )

    d_max = Feed.objects.filter(**kwargs).extra(select={'added':"to_char(added, 'YYYY-MM-DD 12:00:00')"}).values('channel__name','added').annotate(
        Max('field1'),
        Max('field2'),
        Max('field3'),
        Max('field4'),
        Max('field5'),
        Max('field6'),
        Max('field7'),
        Max('field8'),
    )
    d_count = Feed.objects.filter(**kwargs).extra(select={'added':"to_char(added, 'YYYY-MM-DD 12:00:00')"}).values('channel__name','added').annotate(
        Count('field1'),
        Count('field2'),
        Count('field3'),
        Count('field4'),
        Count('field5'),
        Count('field6'),
        Count('field7'),
        Count('field8'),
    )
    return d_avg,d_sum,d_count,d_min,d_max

def aggregateMonthlyFeedData(kwargs): 
    month_filter = connection.ops.date_trunc_sql('month', 'added')   
    #Let aggregate Monthly data
    
    m_avg = Feed.objects.filter(**kwargs).extra({'date':month_filter}).extra(select={'added':"to_char(added, 'YYYY-MM-15 00:00:00')"}).values('channel__name','added').annotate(
        Avg('field1'),
        Avg('field2'),
        Avg('field3'),
        Avg('field4'),
        Avg('field5'),
        Avg('field6'),
        Avg('field7'),
        Avg('field8'),
    )
    
    m_max = Feed.objects.filter(**kwargs).extra({'date':month_filter}).extra(select={'added':"to_char(added, 'YYYY-MM-15 00:00:00')"}).values('channel__name','added').annotate(
        Max('field1'),
        Max('field2'),
        Max('field3'),
        Max('field4'),
        Max('field5'),
        Max('field6'),
        Max('field7'),
        Max('field8'),
    )
    
    m_min = Feed.objects.filter(**kwargs).extra({'date':month_filter}).extra(select={'added':"to_char(added, 'YYYY-MM-15 00:00:00')"}).values('channel__name','added').annotate(
        Min('field1'),
        Min('field2'),
        Min('field3'),
        Min('field4'),
        Min('field5'),
        Min('field6'),
        Min('field7'),
        Min('field8'),
    )
    
    m_sum = Feed.objects.filter(**kwargs).extra({'date':month_filter}).extra(select={'added':"to_char(added, 'YYYY-MM-15 00:00:00')"}).values('channel__name','added').annotate(
        Sum('field1'),
        Sum('field2'),
        Sum('field3'),
        Sum('field4'),
        Sum('field5'),
        Sum('field6'),
        Sum('field7'),
        Sum('field8'),
    )
    
    m_count = Feed.objects.filter(**kwargs).extra({'date':month_filter}).extra(select={'added':"to_char(added, 'YYYY-MM-15 00:00:00')"}).values('channel__name','added').annotate(
        Count('field1'),
        Count('field2'),
        Count('field3'),
        Count('field4'),
        Count('field5'),
        Count('field6'),
        Count('field7'),
        Count('field8'),
    )
    
    
    return m_avg,m_sum,m_count,m_min,m_max
    #Maybe ignore the loop for now (Approach 3). Will take up alot of precious time designing the logic and most probably it will be slower
    
    #So the above works great. Like a charm. But it is not sorted by channels. I might have to do a loop on all channels and get data for that specific channel and return that as a dictionary
    #A loop might be unavoidable but it shall not be more than 10. (Number of channels) and that is acceptable by my books.


    
    #Have this as two processes. Calculate and store result as JSON string. Do a query and get latest json string
    
def storeAggregatedData():
    '''
    - Get most recent data(Monthly and repeat for daily)
    - If no recent data, add all data till now
    - else continue
    - Check if it should be updated
    - If no, add new entry
    - If yes, overwrite with new content
    - Save
    '''

    currentmonthly = AggregateMonthlyFeed.objects.all().order_by('-id').first()
    currentdaily = AggregateDailyFeed.objects.all().order_by('-id').first()
    
    ch = Channel.objects.all()

    print currentdaily
    print currentmonthly

    if not currentmonthly: 
        for item in ch:
            mdata = aggregateMonthlyFeedData({'channel':item})

            month_avg = list(mdata[0])
            month_sum = list(mdata[1])
            month_cnt = list(mdata[2])
            month_min = list(mdata[3])
            month_max = list(mdata[4])        
            
            for ma in month_avg:
                x = AggregateMonthlyFeed(data = ma,channel = item,aggregation = 'Avg',timestamp = ma['added'])
                x.save()
            
            for ms in month_sum:
                x = AggregateMonthlyFeed(data = ms,channel = item,aggregation = 'Sum',timestamp = ms['added'])
                x.save()
            
            for mc in month_cnt:
                x = AggregateMonthlyFeed(data = mc,channel = item,aggregation = 'Count',timestamp = mc['added'])
                x.save()

            for mmi in month_min:
                x = AggregateMonthlyFeed(data = mmi,channel = item,aggregation = 'Min',timestamp = mmi['added'])
                x.save()

            for mma in month_max:
                x = AggregateMonthlyFeed(data = mma,channel = item,aggregation = 'Max',timestamp = mma['added'])
                x.save()            

    elif not currentdaily:
        for item in ch:
            ddata = aggregateDailyFeedData({'channel':item})
            
            daily_avg = list(ddata[0])
            daily_sum = list(ddata[1])
            daily_cnt = list(ddata[2])
            daily_min = list(ddata[3])
            daily_max = list(ddata[4])

            for da in daily_avg:
                x = AggregateDailyFeed(data = da,channel = item,aggregation = 'Avg',timestamp = da['added'])
                x.save()
            
            for ds in daily_sum:
                x = AggregateDailyFeed(data = ds,channel = item,aggregation = 'Sum',timestamp = ds['added'])
                x.save()

            for dc in daily_cnt:
                x = AggregateDailyFeed(data = dc,channel = item,aggregation = 'Count',timestamp = dc['added'])
                x.save()
            
            for dmi in daily_min:
                x = AggregateDailyFeed(data = dmi,channel = item,aggregation = 'Min',timestamp = dmi['added'])
                x.save()
            
            for dma in daily_max:
                x = AggregateDailyFeed(data = dma,channel = item,aggregation = 'Max',timestamp = dma['added'])
                x.save()
                        
    else:
        m = datetime.datetime.now().month
        d = datetime.datetime.now().day
        
        thismonth = datetime.datetime.now().replace(day=1,hour=0,minute=0,second=0,microsecond=0)
        today = datetime.datetime.now().replace(hour=0,minute=0,second=0,microsecond=0)

        timestampmonth = currentmonthly.timestamp.month 
        timestampday = currentdaily.timestamp.day
        
        #Get begging and end of the months to limit

        for item in ch:
            if timestampmonth == m:
                data = aggregateMonthlyFeedData({'channel':item,'added__gte':thismonth})
                                                
                mc = AggregateMonthlyFeed.objects.filter(aggregation = "Count").order_by('-id').first()
                ma = AggregateMonthlyFeed.objects.filter(aggregation = "Avg").order_by('-id').first()
                ms = AggregateMonthlyFeed.objects.filter(aggregation = "Sum").order_by('-id').first()
                mma = AggregateMonthlyFeed.objects.filter(aggregation = "Max").order_by('-id').first()
                mmi = AggregateMonthlyFeed.objects.filter(aggregation = "Min").order_by('-id').first()
                
                ma.data = list(data[0])
                ms.data = list(data[1])
                mc.data = list(data[2])
                mma.data = list(data[3])
                mmi.data = list(data[4])
                
                ma.save()
                ms.save()
                mc.save()
                mma.save()
                mmi.save()
                
            else:
                data = aggregateMonthlyFeedData({'channel':item,'added__gte':thismonth})
            
                month_avg = list(data[0])
                month_sum = list(data[1])
                month_cnt = list(data[2])
                month_min = list(data[3])
                month_max = list(data[4])        

                ma = AggregateMonthlyFeed(data = month_avg,channel = item,aggregation = 'Avg',timestamp = thismonth)
                ms = AggregateMonthlyFeed(data = month_sum,channel = item,aggregation = 'Sum',timestamp = thismonth)
                mc = AggregateMonthlyFeed(data = month_cnt,channel = item,aggregation = 'Count',timestamp =thismonth)
                mmi = AggregateMonthlyFeed(data = month_min,channel = item,aggregation = 'Min',timestamp = thismonth)
                mma = AggregateMonthlyFeed(data = month_max,channel = item,aggregation = 'Max',timestamp = thismonth)
                
                ma.save()
                ms.save()
                mc.save()
                mma.save()
                mmi.save()
                                                
            if timestampday == d:
                data = aggregateDailyFeedData({'channel':item,'added__gte':today})
                                              
                dc = AggregateDailyFeed.objects.filter(aggregation = "Count").order_by('-id').first()
                da = AggregateDailyFeed.objects.filter(aggregation = "Avg").order_by('-id').first()
                ds = AggregateDailyFeed.objects.filter(aggregation = "Sum").order_by('-id').first()
                dma = AggregateDailyFeed.objects.filter(aggregation = "Max").order_by('-id').first()
                dmi = AggregateDailyFeed.objects.filter(aggregation = "Min").order_by('-id').first()
                
                da.data = list(data[0])
                ds.data = list(data[1])
                dc.data = list(data[2])
                dma.data = list(data[3])
                dmi.data = list(data[4])
                
                da.save()
                ds.save()
                dc.save()
                dma.save()
                dmi.save()
                
            else:
                data = aggregateDailyFeedData({'channel':item,'added__gte':today})
                                              
                daily_avg = list(data[0])
                daily_sum = list(data[1])
                daily_cnt = list(data[2])
                daily_min = list(data[3])
                daily_max = list(data[4])        
                
                da = AggregateDailyFeed(data = daily_avg,channel = item,aggregation = 'Avg',timestamp = today)
                ds = AggregateDailyFeed(data = daily_sum,channel = item,aggregation = 'Sum',timestamp = today)
                dc = AggregateDailyFeed(data = daily_cnt,channel = item,aggregation = 'Count',timestamp = today)
                dmi = AggregateDailyFeed(data = daily_min,channel = item,aggregation = 'Min',timestamp = today)
                dma = AggregateDailyFeed(data = daily_max,channel = item,aggregation = 'Max',timestamp = today)
                
                da.save()
                ds.save()
                dc.save()
                dma.save()
                dmi.save()
                
def updateAggregatedData():
    pass
