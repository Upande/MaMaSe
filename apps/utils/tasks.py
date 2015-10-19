from __future__ import absolute_import

from celery.decorators import periodic_task
from celery.task.schedules import crontab
from celery.utils.log import get_task_logger
from celery import task

from apps.utils.thingspeak import parseAPIContent
from apps.utils.api import storeAggregatedData

logger = get_task_logger(__name__)

#Run the task every 15 mins
@periodic_task(run_every=(crontab(hour="*", minute="*/5", day_of_week="*")))
def refreshThingspeakData():
    logger.info("Start refresh data")
    return parseAPIContent()
    logger.info("Refresh finished")

#Run the task every 15 mins
@periodic_task(run_every=(crontab(hour="*", minute="*/5", day_of_week="*")))
def storecalculatedData():
    logger.info("Start storage of data")    
    return storeAggregatedData()
    logger.info("Storage  finished")
