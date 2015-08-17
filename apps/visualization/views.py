from django.shortcuts import render,render_to_response
from django.views.generic.base import TemplateView
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


class IndexView(TemplateView):
    template_name = "visual.html"

class ContactView(TemplateView):
    template_name = "contact.html"
    
    def get_context_data(self, **kwargs):
        context = super(ContactView, self).get_context_data(**kwargs)
        context['success'] = "Success! We have received your email and will respond ASAP."
        return context

def page_not_found_view(request):
    args = {}
    args['url'] = '/'
    return render("404.html", args)
    
def page_not_found_view(request):
    args = {}
    args['url'] = '/'
    return render("500.html", args)
    
