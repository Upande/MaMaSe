from __future__ import absolute_import

from celery.decorators import periodic_task
from celery.task.schedules import crontab
from celery.utils.log import get_task_logger
from celery import task

from django.core.cache import cache
from hashlib import md5

from apps.utils.thingspeak import parseAPIContent
from apps.utils.api import storeAggregatedData

logger = get_task_logger(__name__)

LOCK_EXPIRE = 60 * 4.5  # Lock expires in 5 minutes


#Run the task every 15 mins
@periodic_task(run_every=(crontab(hour="*", minute="*/5", day_of_week="*")))
def refreshThingspeakData():
    #Implementing locking of tasks
    text = 'pulling data from thingspeak'
    task_hexdigest = md5(text).hexdigest()
    lock_id = '{0}-lock-{1}'.format('refreshThingspeakData', task_hexdigest)

    # cache.add fails if the key already exists
    acquire_lock = lambda: cache.add(lock_id, 'true', LOCK_EXPIRE)

    # memcache delete is very slow, but we have to use it to take
    # advantage of using add() for atomic locking
    release_lock = lambda: cache.delete(lock_id)
    if acquire_lock():
        try:
            logger.info("Start refresh data")
            return parseAPIContent()
            logger.info("Refresh finished")
        finally:
            release_lock()
        return

    logger.debug(
        'Api content %s is already being pulled by another worker')


#Run the task every 15 mins
@periodic_task(run_every=(crontab(hour="*", minute="*/5", day_of_week="*")))
def storecalculatedData():
    #Implementing locking of tasks
    text = 'creating aggregated data'
    task_hexdigest = md5(text).hexdigest()
    lock_id = '{0}-lock-{1}'.format('storecalculatedData', task_hexdigest)

    # cache.add fails if the key already exists
    acquire_lock = lambda: cache.add(lock_id, 'true', LOCK_EXPIRE)

    # memcache delete is very slow, but we have to use it to take
    # advantage of using add() for atomic locking
    release_lock = lambda: cache.delete(lock_id)
    if acquire_lock():
        try:
            logger.info("Start storage of data")
            return storeAggregatedData()
            logger.info("Storage  finished")
        finally:
            release_lock()
        return

    logger.debug(
        'Aggregate data %s is already being calculated by another worker')
