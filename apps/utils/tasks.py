from __future__ import absolute_import

from celery import task

from apps.utils.thingspeak import parseAPIContent
from apps.utils.api import storeAggregatedData

@task
def refreshThingspeakData():
    return parseAPIContent()

@task
def storecalculatedData():
    return storeAggregatedData()
