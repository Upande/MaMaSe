import json

from django.http import JsonResponse

from apps.utils.models import Channel,Feed

def getFeeds(request):
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
        
    feed = Feed.objects.filter(**kwargs).values('entry_id','channel_id','added','field1','field2','field3','field4','field5','field6','field7','field8','id')    
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
