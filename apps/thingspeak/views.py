from django.shortcuts import render
from django.http import JsonResponse

from . import getJSONData as gjd
from .models import LoggerData,Channel,Feed

import json

def logData(request):
    data = gjd.parseJSON()
    
    
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
                      field1 = dct.get('field1',""),
                      field2 = dct.get('field2',""),
                      field3 = dct.get('field3',""),
                      field4 = dct.get('field4',""),
                      field5 = dct.get('field5',""),
                      field6 = dct.get('field6',""),
                      field7 = dct.get('field7',""),
                      field8 = dct.get('field8',""),
                      field9 = dct.get('field9',""),
                      field10 = dct.get('field10',""),
                  )
    )
    
    l.save()
    
    
    for item in feeds:
        f = Feed.objects.get_or_create(
            entry_id = item.get('entry_id'),
            defaults = dict(
                field1 = item.get('field1',""),
                field2 = item.get('field2',""),
                field3 = item.get('field3',""),
                field4 = item.get('field4',""),
                field5 = item.get('field5',""),
                field6 = item.get('field6',""),
                field7 = item.get('field7',""),
                field8 = item.get('field8',""),
                field9 = item.get('field9',""),
                field10 = item.get('field10',""),
                created_at = item.get('created_at'),
                channel = c,
            )
        )

    return JsonResponse(results)
