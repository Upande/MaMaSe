from django.conf.urls import patterns, include, url

urlpatterns = patterns(
    '',
    # Examples:
    url(r'^$', 'apps.thingspeak.views.logData', name='data'),
)
