from django.conf.urls import patterns, include, url
from .views import LogoUpload

urlpatterns = [
    url(r'^$', LogoUpload, name='LogoUpload'),
    #url(r'^list/$', LogoUpload, name='LogoUpload'),
]