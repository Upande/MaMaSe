import json

from django.http import JsonResponse

from apps.utils.models import Channel,Feed

def getFeeds(request):
    channel = request.GET.get('channel',None)
    
    if channel:
        feed = Feed.objects.filter(channel_id=channel).values('entry_id','channel_id','added','field1','field2','field3','field4','field5','field6','field7','field8','id')    
    else:
        feed = Feed.objects.all().values('entry_id','channel_id','added','field1','field2','field3','field4','field5','field6','field7','field8','id')    

    feed = list(feed)
    feed_without_null = []

    for item in feed:
        feed_without_null.append(dict((k,v) for (k,v) in item.items() if v is not None))
        
    return JsonResponse(dict(data=feed_without_null))
