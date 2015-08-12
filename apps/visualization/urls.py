from django.conf.urls import patterns, include, url

from apps.visualization.views import IndexView
urlpatterns = patterns(
    '',
    url(r'^ts/$', 'apps.visualization.views.logThingspeakData', name='visual-ts'),
    url(r'^$', IndexView.as_view(), name='visual'),
)
