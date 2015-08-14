from django.conf.urls import patterns, include, url

from apps.visualization.views import IndexView,ContactView
urlpatterns = patterns(
    '',
    url(r'^ts/$', 'apps.visualization.views.logThingspeakData', name='visual-ts'),
    url(r'^live$', IndexView.as_view(), name='visual'),
    url(r'^contact/$', ContactView.as_view(), name='contact-us'),
)
