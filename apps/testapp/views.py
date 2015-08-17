from django.shortcuts import render
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse

from .models import TPage
# Create your views here.
from django.views.generic import TemplateView
'''
class TView(TemplateView):
    template_name = "gallery/gallery2.html"

# Create your views here.
'''

def GetImages(request):
    # Load images for the list page
    images = TPage.objects.all()
    #print images

    # Render list page with the documents and the form
    return render_to_response(
        'testapp/t_page.html',
        {'images': images,},
        context_instance=RequestContext(request)
    )
