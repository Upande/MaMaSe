from celery import task
import requests
import datetime
import string
import json
import time

from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse,HttpResponse
from django.core import serializers

from rest_framework.renderers import JSONRenderer

from apps.utils.models import Channel,Feed,AggregateMonthlyFeed,AggregateDailyFeed,Field,ChannelField
from apps.utils.api import aggregateMonthlyFeedData,aggregateDailyFeedData
from apps.utils.serializers import ChannelSerializer,FeedSerializer

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
    #Gotta find more efficient way of doing this. Search for field elements. Check size of returned list?
    #No solution from thingspeak. Gotta do a try and error. At least do this when populating the channel data and just use the stored datat to pull feeds
    
    i = 1
    fields = []
    while i <= 8:
        field = "field" + str(i)
        f = ch.get(field)
        if f:
           f,created = Field.objects.get_or_create(name=f)
           c = ChannelField(channel=channel,field=f,name=field)
           c.save()
           fields.append(c)
        i+= 1

    for item in feeds:
        for i in fields:
            f,created = Feed.objects.get_or_create(        
                entry_id = item['entry_id'],
                channelfield = i,
                defaults={'reading':item.get(i.name,None),
                      'timestamp':item.get('created_at',None),
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

def addClassicData(request):
        
    results = request.GET.get('records',None)
    start = request.GET.get('start',None)
    
    if not results and not start:
        results = 8000
        start = ""

    ch = Channel.objects.all()
    
    for c in ch:
        url = "https://thingspeak.com/channels/"+str(c.data_id)+"/feed.json?results="+str(results)+"&start="+str(start)
        data = getAPIData(url)
        
        print url
        #print data

        if not data:
            print "No data found"
            continue

        feeds = data['feeds']
        
        for item in feeds:
            #Some weird values show up. Like 101.0=270
            #So I need to strip that out.

            field1 = item.get('field1',None)
            if field1:
                field1 = clean(field1)

            field2 = item.get('field2',None)
            if field2:
                field2 = clean(field2)

            field3 = item.get('field3',None)
            if field3:
                field3 = clean(field3)

            field4 = item.get('field4',None)
            if field4:
                field4 = clean(field4)

            field5 = item.get('field5',None)
            if field5:
                field5 = clean(field5)

            field6 = item.get('field6',None)
            if field6:
                field6 = clean(field6)

            field7 = item.get('field7',None)
            if field7:
                field7 = clean(field7)

            field8 = item.get('field8',None)
            if field8:
                field8 = clean(field8)

            f,created = Feed.objects.get_or_create(        
                entry_id = item['entry_id'],
                channel = c,

                defaults={'field1':field1,
                          'field2':field2,
                          'field3':field3,
                          'field4':field4,
                          'field5':field5,
                          'field6':field6,
                          'field7':field7,
                          'field8':field8,
                          'timestamp':item.get('created_at',None),
                          'entry_id':item.get('entry_id',None),
                      }
            )
            
        #Start aggregating the data
        ddata = aggregateDailyFeedData({'channel':c})
        mdata = aggregateMonthlyFeedData({'channel':c})
            
        daily_avg = list(ddata[0])
        daily_sum = list(ddata[1])
        daily_cnt = list(ddata[2])
        daily_min = list(ddata[3])
        daily_max = list(ddata[4])
        
        month_avg = list(mdata[0])
        month_sum = list(mdata[1])
        month_cnt = list(mdata[2])
        month_min = list(mdata[3])
        month_max = list(mdata[4])
        
        
        print daily_avg
        print daily_sum
        print daily_cnt
        print daily_min
        print daily_max

        if daily_avg:
            for item in daily_avg:
                da,created = AggregateDailyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation ='AVG',channel=c,defaults={'data':item, })
                
        if daily_sum:
            for item in daily_sum:
                ds,created = AggregateDailyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='SUM',channel=c,defaults={'data':item,})

        if daily_cnt:
            for item in daily_cnt:
                dc,created = AggregateDailyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='COUNT',channel=c, defaults={'data':item,})

        if daily_min:
            for item in daily_min:
                dmi,created = AggregateDailyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='MIN',channel=c,defaults={'data':item,})

        if daily_max:
            for item in daily_max:
                dma,created = AggregateDailyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='MAX',channel=c,defaults={'data':item,})

        if month_avg:
            for item in month_avg:
                ma,created = AggregateMonthlyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='AVG',channel=c,defaults={'data':item,})
                
        if month_sum:
            for item in month_sum:
                ms,created = AggregateMonthlyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='SUM',channel=c,defaults={'data':item,})

        if month_cnt:
            for item in month_cnt:
                mc,created = AggregateMonthlyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='COUNT',channel=c,defaults={'data':item,})

        if month_min:
            for item in month_min:
                mmi,created = AggregateMonthlyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='MIN',channel=c,defaults={'data':item,})
            
        if month_max:
            for item in month_max:
                mma,created = AggregateMonthlyFeed.objects.get_or_create(timestamp = item['timestamp'],aggregation='MAX',channel=c,defaults={'data':item,})

    return HttpResponse("Done")

def clean(text):
    text = filter(lambda x: x in string.printable, text)
    text = text.split("=")[0]
    text = text.split("t/")[0]
    
    #So it seems some values are dates. We might need to convert to milliseconds to store as float
    try:
        float(text)
    except:
        for fmt in ('%Y/%m/%d','%Y:%m:%d','%H:%M:%S'):
            try:
                #Assume this to be a date
                dt = datetime.datetime.strptime(text, fmt) 
                text = time.mktime(dt.timetuple()) + (dt.microsecond / 1000000.0)
                return text
            except ValueError:
                pass
    return text
