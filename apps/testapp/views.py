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

'''
class TView(TemplateView):
    template_name = "gallery/gallery2.html"

# Create your views here.
'''

def GetImages(request):
    # Load images for the list page
    src = []
    images = TPage.objects.all()
    for y in images.body:
    	for i in y.value:
    		src.append(i.get('image').file.url)
    		


    # Render list page with the documents and the form
    return render_to_response(
        'testapp/t_page.html',
        {'src':src},
        context_instance=RequestContext(request)
    )
