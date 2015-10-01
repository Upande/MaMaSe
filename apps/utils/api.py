import json

from django.db.models import Avg,Max,Min,Sum,Count
from django.http import JsonResponse
from django.db import connection

from apps.utils.models import Channel,Feed

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

def getAllData(request):
    """
    This API request will return a very complicate data structure. It has 5 levels namely Top Leval, Time Leval, Aggregation leval, Location leval then the data points    
    """
    
    month_filter = connection.ops.date_trunc_sql('month', 'added')

    feed = Feed.objects.all().annotate(av_field1=Avg('field1'),av_field2=Avg('field2'),av_field3=Avg('field3'),av_field4=Avg('field4')).extra({'month':month_filter}).exclude(field2__lte = 0,field3__lte = 0,field4__lte = 0,field5__lte = 0,field6__lte = 0,field7__lte = 0,field8__lte = 0)

    #I will writing random scripts
    d = Feed.objects.exclude(channel__field2="",channel__field3="",channel__field4="",channel__field5="",channel__field6="",channel__field7="",channel__field8="").extra({'date':'date(added)'}).extra(select={'added':"to_char(added, 'YYYY-MM-DD')"}).values('channel__name','added').annotate(
        Avg('field1'),Max('field1'),Min('field1'),Sum('field1'),Count('field1'),
        Avg('field2'),Max('field2'),Min('field2'),Sum('field2'),Count('field2'),
        Avg('field3'),Max('field3'),Min('field3'),Sum('field3'),Count('field3'),
        Avg('field4'),Max('field4'),Min('field4'),Sum('field4'),Count('field4'),
        Avg('field5'),Max('field5'),Min('field5'),Sum('field5'),Count('field5'),
        Avg('field6'),Max('field6'),Min('field6'),Sum('field6'),Count('field6'),
        Avg('field7'),Max('field7'),Min('field7'),Sum('field7'),Count('field7'),
        Avg('field8'),Max('field8'),Min('field8'),Sum('field8'),Count('field8'),
    )

    m = Feed.objects.all().extra({'date':month_filter}).extra(select={'added':"to_char(added, 'YYYY-MM')"}).values('channel__name','added').annotate(
        Avg('field1'),Max('field1'),Min('field1'),Sum('field1'),Count('field1'),
        Avg('field2'),Max('field2'),Min('field2'),Sum('field2'),Count('field2'),
        Avg('field3'),Max('field3'),Min('field3'),Sum('field3'),Count('field3'),
        Avg('field4'),Max('field4'),Min('field4'),Sum('field4'),Count('field4'),
        Avg('field5'),Max('field5'),Min('field5'),Sum('field5'),Count('field5'),
        Avg('field6'),Max('field6'),Min('field6'),Sum('field6'),Count('field6'),
        Avg('field7'),Max('field7'),Min('field7'),Sum('field7'),Count('field7'),
        Avg('field8'),Max('field8'),Min('field8'),Sum('field8'),Count('field8'),
    )
    
    data = {}
    data['daily'] = list(d)
    data['monthly'] = list(m)
    
    return JsonResponse(data)
