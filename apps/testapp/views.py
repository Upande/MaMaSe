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