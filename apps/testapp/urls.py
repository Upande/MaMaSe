from django.conf.urls import patterns, include, url

urlpatterns = patterns('apps.testapp.views',
    url(r'^$', 'GetImages', name='GetImages'),
    url(r'^carousel/$', 'GetImages', name='GetImages'),
   
)