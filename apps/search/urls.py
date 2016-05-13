from django.conf.urls import patterns, include, url

from .views import (AdvancedSearchView,ResultsView,
                    search,advancedsearch)

urlpatterns = [
    url(r'^basic/$', search, name='basicsearch'),
    url(r'^advanced/$', AdvancedSearchView.as_view(), name='advancedsearch'),
    url(r'^results/$', ResultsView.as_view(), name='results'),
    url(r'^advancedresults/$', advancedsearch, name='avresults'),
]
