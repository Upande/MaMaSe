import json

from django.db.models import Avg,Max,Min,Sum,Count
from django.http import JsonResponse
from django.db import connection

from apps.utils.models import Channel,Feed
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
        ch_data = aggregateFeedData(item)
        print ch_data[0] 
        print "\n"
            
        daily_avg.append({item.id:list(ch_data[0])})
        daily_sum.append({item.id:list(ch_data[1])})
        daily_cnt.append({item.id:list(ch_data[2])})
        daily_min.append({item.id:list(ch_data[3])})
        daily_max.append({item.id:list(ch_data[4])})
        month_avg.append({item.id:list(ch_data[5])})
        month_sum.append({item.id:list(ch_data[6])})
        month_cnt.append({item.id:list(ch_data[7])})
        month_min.append({item.id:list(ch_data[8])})
        month_max.append({item.id:list(ch_data[9])})
        

    data = {}
    data['daily'] = ({'average':daily_avg,'min':daily_min, 'max':daily_max, 'count':daily_cnt, 'sum':daily_sum})
    data['monthly'] = ({'average':month_avg,'min':month_min, 'max':month_max, 'count':month_cnt, 'sum':month_sum})
    return JsonResponse(data)

def aggregateFeedData(ch):
    month_filter = connection.ops.date_trunc_sql('month', 'added')
    kwargs = {}
    kwargs['channel'] = ch

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
    
    
    return d_avg,d_sum,d_count,d_min,d_max,m_avg,m_sum,m_count,m_min,m_max
    #Maybe ignore the loop for now (Approach 3). Will take up alot of precious time designing the logic and most probably it will be slower
    
    #So the above works great. Like a charm. But it is not sorted by channels. I might have to do a loop on all channels and get data for that specific channel and return that as a dictionary
    #A loop might be unavoidable but it shall not be more than 10. (Number of channels) and that is acceptable by my books.


    
    #Have this as two processes. Calculate and store result as JSON string. Do a query and get latest json string
    
