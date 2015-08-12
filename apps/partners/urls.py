from django.conf.urls import patterns, include, url

urlpatterns = patterns('apps.partners.views',
    url(r'^$', 'LogoUpload', name='LogoUpload'),
    url(r'^list/$', 'LogoUpload', name='LogoUpload'),
   
)