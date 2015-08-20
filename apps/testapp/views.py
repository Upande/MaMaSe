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
'''
class TView(TemplateView):
    template_name = "gallery/gallery2.html"

# Create your views here.
'''



def GetImages(request):
    # Load images for the list page
    
    src = []
    images = TPage.objects.all()
    
    for item in images:
        for y in item.body:
            for i in y.value:
                #print i.get('image').file.url
                src.append(i.get('image').file.url)  
                
    

    body_cont = []
    albums = []
    values = [] 
    d_list = []
    srcd = []
    srcd2 = []
    captions = []
    
    items = TPage.objects.all()
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
        print body_value['value']



                
    # Render list page with the documents and the form
    return render_to_response(
        'testapp/t_page.html',
        {'srcd':srcd, 'albums':albums, 'captions':captions, 'body_content':sorted(body_content.iteritems()), 'body': body},
        context_instance=RequestContext(request)
    )
	