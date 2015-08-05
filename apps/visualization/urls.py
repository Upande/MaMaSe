from django.conf.urls import patterns, include, url

urlpatterns = patterns(
    '',
    url(r'^ts/$', 'apps.visualization.views.logThingspeakData', name='visual-ts'),
    url(r'^$', 'apps.visualization.views.index', name='visual'),
)
