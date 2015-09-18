import json

from django.http import JsonResponse

from apps.utils.models import Channel,Feed

def getFeeds(request):
    channel = request.GET.get('channel',None)
    start = request.GET.get('start',None)
    end = request.GET.get('end',None)
    limit = request.GET.get('limit',None)

    kwargs = {}
    
    if channel:
        kwargs[ 'channel_id' ] = channel
    if start:
        kwargs[ 'added__gte' ] = start
    if end:
        kwargs[ 'added__lte' ] = end
        
    feed = Feed.objects.filter(**kwargs).values('entry_id','channel_id','added','field1','field2','field3','field4','field5','field6','field7','field8','id')    
    
    if limit:
        try:
            limit = int(limit)
            feed = feed[:limit]
        except:
            pass

    feed = list(feed)
    feed_without_null = []

    for item in feed:
        feed_without_null.append(dict((k,v) for (k,v) in item.items() if v is not None))
        
    return JsonResponse(dict(data=feed_without_null))
