from django.shortcuts import render

from . import getJSONData as gjd
from .models import LoggerData as ld
# Create your views here.

def logData():
    data = gjd.parseJson()
    l = LoggerData(raw_data = data)
    l.save()
