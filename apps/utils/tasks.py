from __future__ import absolute_import

from celery import task

from apps.utils.thingspeak import parseAPIContent

@task
def refreshThingspeakData():
    return parseAPIContent()
