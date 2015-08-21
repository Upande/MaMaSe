from django.conf.urls import patterns, include, url
from django.conf import settings
from django.views.generic import TemplateView
from wagtail.wagtailadmin import urls as wagtailadmin_urls
from wagtail.wagtaildocs import urls as wagtaildocs_urls
from wagtail.wagtailcore import urls as wagtail_urls


urlpatterns = patterns('',

	url(r'^$', 'apps.intro.views.index', name='knowledge'),

)