web: newrelic-admin run-program gunicorn mamase.wsgi
scheduler: python manage.py celery beat -l info
worker: python manage.py celery worker -E --maxtasksperchild=1000