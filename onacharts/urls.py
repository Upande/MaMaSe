from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns(
    '',
    # Examples:
    url(r'^$', 'onacharts.views.home', name='home'),
    url(r'^chart/$', 'onacharts.views.chart', name='chart'),
    url(r'^ts/', include('apps.thingspeak.urls')),
    # url(r'^blog/', include('blog.urls')),
    
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
)
