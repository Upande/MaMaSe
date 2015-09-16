from django.conf.urls import patterns, include, url

from apps.utils.views import IndexView,ContactView,AboutView
urlpatterns = patterns(
    '',
    url(r'^ts/$', 'apps.utils.views.logThingspeakData', name='visual-ts'),
    url(r'^live$', IndexView.as_view(), name='visual'),
    url(r'^about$', AboutView.as_view(), name='about'),
    url(r'^contact/$', ContactView.as_view(), name='contact-us'),
    url(r'^email/$','apps.utils.views.email', name='email'),
    url(r'^knowledge/$','apps.utils.views.knowledge', name='knowledge'),
    url(r'^channel/$','apps.utils.thingspeak.returnChannelData', name='channel_data'),
    url(r'^feed/$','apps.utils.thingspeak.returnFeedData', name='feed_data'),
)
