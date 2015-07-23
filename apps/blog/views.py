from django.shortcuts import render

# Create your views here.
from django.views.generic import TemplateView

class CommView(TemplateView):
    template_name = "communications.html"