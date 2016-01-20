from django.conf.urls import patterns, include, url

from apps.utils.views import IndexView,ContactView,AboutView,ChartView,MeView,ProjectManView,start,getAudio,getImage,trySubmission
urlpatterns = patterns(
    '',
    url(r'^contact/start/(?P<howMany>[0-9]+)$', start),
    url(r'^contact/audio/?$', getAudio ),
    url(r'^contact/audio/(?P<audioType>\w+)$', getAudio),
    url(r'^contact/image/(?P<index>[0-9]+)$', getImage),
    url(r'^contact/try$', trySubmission, name='try'),

    url(r'^ts/$', 'apps.utils.views.logThingspeakData', name='visual-ts'),
    url(r'^live$', IndexView.as_view(), name='visual'),
    url(r'^chart$', ChartView.as_view(), name='chart'),
    url(r'^me$', MeView.as_view(), name='me'),
    url(r'^about$', AboutView.as_view(), name='about'),
    url(r'^project$', ProjectManView.as_view(), name='projectman'),
    url(r'^contact/$', ContactView.as_view(), name='contact-us'),
    url(r'^email/$','apps.utils.views.email', name='email'),
    url(r'^knowledge/$','apps.utils.views.knowledge', name='knowledge'),
    url(r'^channel/$','apps.utils.thingspeak.returnChannelData', name='channel_data'),
    url(r'^feed/$','apps.utils.thingspeak.returnFeedData', name='feed_data'),
    url(r'^classic/$','apps.utils.thingspeak.addClassicData', name='classic'),
    url(r'^api/feed/$','apps.utils.api.getFeeds', name='api_feed'),
    url(r'^api/all/$','apps.utils.api.getAllData', name='api_all'),
)
