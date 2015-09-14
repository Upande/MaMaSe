"""
WSGI config for mamase_site project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise

import requests

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings")

application = get_wsgi_application()
application = DjangoWhiteNoise(application)

proxies = {
"http": os.environ['QUOTAGUARDSTATIC_URL'],
"https": os.environ['QUOTAGUARDSTATIC_URL']
}

res = requests.get("http://ip.quotaguard.com/", proxies=proxies)
print res.text

# Assign QuotaGuard to your environment's http_proxy variable
os.environ['http_proxy'] = os.environ['QUOTAGUARDSTATIC_URL']
