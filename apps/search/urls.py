from django.conf.urls import patterns, include, url

from apps.search.views import AdvancedSearchView,ResultsView

urlpatterns = patterns(
    '',
    url(r'^basic/$', 'apps.search.views.search', name='basicsearch'),
    url(r'^advanced/$', AdvancedSearchView.as_view(), name='advancedsearch'),
    url(r'^results/$', ResultsView.as_view(), name='results'),
)
