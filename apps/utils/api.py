import json

from django.http import JsonResponse

from apps.utils.models import Channel,Feed

def getFeeds(request):
    """
    To use this API, you can filter based on four parameters. You can filter bu channel, start time or end time. These three could be used indivually or together.
    The fourth parameter is the limit on number of results returned. The filtering is a GET request.
    
    An example would be  /mamase/api/feed/?channel=1&start='2015-09-09'&end='2015-09-10'&limit=10
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
