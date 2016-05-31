from django.shortcuts import render
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.utils import timezone

from .models import TPage
# Create your views here.
from django.views.generic import TemplateView

from wagtail.wagtailimages.models import Image
from wagtail.wagtailsearch.backends import get_search_backend
from wagtail.wagtailcore.models import Page

import ast

def GetImages(request):
    
    item_list = []
    images_url_list = []
    get_captions = []
    
    items = TPage.objects.all()
    
    for item in items:
        for s_item in item.body:
            item_list.append(s_item.value)
    
    for s_item_body in item_list:
        get_captions.append([s.get('caption') for s in s_item_body])
        images_url_list.append([s.get('image').file.url for s in s_item_body]) 


    body_cont = []
    albums = []
    values = [] 
    captions = []
    
    
    NumOfAlbums = len(items)

    for i in items.values():
        values.append(i)
    
    
    length = len(values)
    for j in range(0, length):
        body = values[j]['body']
        #album_name = values[j]['title']
        albums.append(values[j]['title'])
        body = ast.literal_eval(body)
        for k in body:
            body_cont.append(k)
    body_content = dict(zip(albums, body_cont))

    for body_key, body_value in body_content.iteritems():
        body_value['value']

    get_captions_dict = dict(zip(albums, get_captions))
    images_url_list_dict = dict(zip(albums, images_url_list))
    images_captions = [images_url_list_dict, get_captions_dict]
    
                
    # Render list page with the documents and the form
    return render_to_response(
        'testapp/t_page.html',
        {'src':sorted(images_url_list_dict.iteritems(), reverse=True), 'albums':albums, 'captions':sorted(get_captions_dict.iteritems()), 'body_content':sorted(body_content.iteritems()), 'body': body, 'images_captions':images_captions},
        context_instance=RequestContext(request)
    )
    
