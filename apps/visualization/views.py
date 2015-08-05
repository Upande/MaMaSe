from django.shortcuts import render,render_to_response
from django.http import JsonResponse

from . import thingspeak 
from .models import LoggerData,Channel,ChannelField,Feed

import json

def logThingspeakData(request):
    data = thingspeak.parseAPIContent()
    
    
    l = LoggerData(raw_data = data)
    
    results = json.loads(data.text)
    dct = results['channel']
    feeds = results['feeds']
    
    c,created = Channel.objects.get_or_create(
        data_id = dct.get('id'),

        defaults=dict(name = dct.get('name'),
                      description = dct['description'],
                      longitude = float(dct['longitude']),
                      latitide = float(dct['latitude']),
                      created_at= dct['created_at'],
                      updated_at = dct['updated_at'],
                      elevation = dct['elevation'],
                      last_entry_id = dct['last_entry_id'],
                  )
    )
    
    l.save()
    
    #Need to find a scalable way to do this
    if not c:
        return

    for item in dct:
        if "field" in item:
            cf = ChannelField(tag = item,field = dct[item],channel = c)
            cf.save()
            
    for item in feeds:
        f = Feed.objects.get_or_create(
            entry_id = item.get('entry_id'),
            defaults = dict(
                created_at = item.get('created_at'),
                channel = c,
            )
        )
    
    return JsonResponse(results)


def index(request):
    args = {}
    args['isLoggedIn'] = False
    return render_to_response("index.html", args)

def chart(request):
    args = {}
    args['isLoggedIn'] = False
    return render_to_response("chart.html", args)

def page_not_found_view(request):
    args = {}
    args['url'] = '/'
    return render_to_response("404.html", args)
    
def page_not_found_view(request):
    args = {}
    args['url'] = '/'
    return render_to_response("500.html", args)
    
