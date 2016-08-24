from django.conf.urls import patterns, include, url

from .views import (IndexView, ContactView,
                    AboutView, ChartView,
                    MapView, ProjectManView,
                    start, getAudio,
                    getImage, trySubmission,
                    logThingspeakData,
                    email, knowledge,
                    RainTempView
                    )


from .thingspeak import returnChannelData, returnFeedData, addClassicData
from .api import getFeeds, getAllData

urlpatterns = [
    url(r'^contact/start/(?P<howMany>[0-9]+)$', start),
    url(r'^contact/audio/?$', getAudio),
    url(r'^contact/audio/(?P<audioType>\w+)$', getAudio),
    url(r'^contact/image/(?P<index>[0-9]+)$', getImage),
    url(r'^contact/try$', trySubmission, name='try'),
    url(r'^ts/$', logThingspeakData, name='visual-ts'),
    url(r'^live$', IndexView.as_view(), name='visual'),
    url(r'^chart$', ChartView.as_view(), name='chart'),
    url(r'^chartrt$', RainTempView.as_view(), name='chartrt'),
    url(r'^map$', MapView.as_view(), name='map'),
    url(r'^about$', AboutView.as_view(), name='about'),
    url(r'^project$', ProjectManView.as_view(), name='projectman'),
    url(r'^contact/$', ContactView.as_view(), name='contact-us'),
    url(r'^email/$', email, name='email'),
    url(r'^channel/$', returnChannelData, name='channel_data'),
    url(r'^feed/$', returnFeedData, name='feed_data'),
    url(r'^classic/$', addClassicData, name='classic'),
    url(r'^api/feed/$', getFeeds, name='api_feed'),
    url(r'^api/all/$', getAllData, name='api_all'),
]
