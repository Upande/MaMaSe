from __future__ import absolute_import

from celery import shared_task

from apps.utils.thingspeak import parseAPIContent

@shared_task
def refreshThingspeakData():
    return parseAPIContent()
