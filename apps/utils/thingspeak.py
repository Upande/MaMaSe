from celery import task
import requests
import json

from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse,HttpResponse
from django.core import serializers

from rest_framework.renderers import JSONRenderer

from apps.utils.serializers import ChannelSerializer,FeedSerializer
from apps.utils.models import Channel,Feed

def getAPIData(url):
    r = requests.get(url)
    data = json.loads(r.text)
    if r.status_code == 200:
            return data
    else:
            return False

def getChannel():
    url = "http://api.thingspeak.com/channels/public.json?tag=mamase"
    
    data  = getAPIData(url)
    
    if not data:
        return
        
    channels = data['channels']
    
    for item in channels:
        c,created = Channel.objects.get_or_create(data_id = item['id'], defaults={'username':item['username'],
                                                                                  'elevation':item['elevation'],
                                                                                  'description': item['description'],
                                                                                  'name':item['name'],
                                                                                  'longitude':item['longitude'],
                                                                                  'latitude':item['latitude'],
                                                                                  'created_at':item['created_at'],
                                                                                  'last_entry_id':item['last_entry_id'],
                                                                              }
                                              )
        
            
def parseAPIContent():
    getChannel()
    data_ids = Channel.objects.all().values_list('data_id',flat=True)
    
    for item in data_ids:
        getFeedData(str(item))

    return True

def getFeedData(data_id):
    url = "https://thingspeak.com/channels/"+str(data_id)+"/feed.json"
    data = getAPIData(url)
    
    if not data:
        return
                
    ch = data['channel']
    feeds = data['feeds']
    
    channel = Channel.objects.get(data_id=data_id)
    #Gotta find more efficient way of doing this
    channel.field1 = ch.get("field1","")
    channel.field2 = ch.get("field2","")
    channel.field3 = ch.get("field3","")
    channel.field4 = ch.get("field4","")
    channel.field5 = ch.get("field5","")
    channel.field6 = ch.get("field6","")
    channel.field7 = ch.get("field7","")
    channel.field8 = ch.get("field8","")
    channel.save()
    
    for item in feeds:
        f,created = Feed.objects.get_or_create(        
            entry_id = item['entry_id'],
            channel = channel,
            defaults={'field1':item.get('field1',None),
                      'field2':item.get('field2',None),
                      'field3':item.get('field3',None),
                      'field4':item.get('field4',None),
                      'field5':item.get('field5',None),
                      'field6':item.get('field6',None),
                      'field7':item.get('field7',None),
                      'field8':item.get('field8',None),
                      'timestamp':item.get('created_at',None),
                      'entry_id':item.get('entry_id',None),
                  }
        )
        print f
        print created

class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)
        
@csrf_exempt
def returnChannelData(request):
    if request.method == 'GET':
        channels = Channel.objects.all()
        cserializer = ChannelSerializer(channels, many=True)
        return JSONResponse(cserializer.data)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        cserializer = ChannelSerializer(data=data)
        if cserializer.is_valid():
            cserializer.save()
            return JSONResponse(cserializer.data, status=201)
        return JSONResponse(cserializer.errors, status=400)


@csrf_exempt
def returnFeedData(request):
    if request.method == 'GET':
        feeds = Feed.objects.all()
        fserializer = FeedSerializer(feeds, many=True)
        return JSONResponse(fserializer.data)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        fserializer = FeedSerializer(data=data)
        if fserializer.is_valid():
            fserializer.save()
            return JSONResponse(fserializer.data, status=201)
        return JSONResponse(fserializer.errors, status=400)


def returnFeedDataOld(request):
    data = serializers.serialize("json", Feed.objects.all(),use_natural_foreign_keys=True, use_natural_primary_keys=True)
    return JsonResponse(dict(data=json.loads(data)))
