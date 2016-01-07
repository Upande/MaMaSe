from django.conf.urls import include, url
from django.conf import settings
from django.contrib import admin
from django.views.generic import RedirectView

from wagtail.wagtailadmin import urls as wagtailadmin_urls
from wagtail.wagtaildocs import urls as wagtaildocs_urls
from wagtail.wagtailcore import urls as wagtail_urls

from apps.news.views import CommView
from apps.utils.views import KwaleHomeView
from apps.utils.views import KwaleMapView
from apps.utils.views import KwaleReportView
#from apps.testapp.views import TView
#from apps import *


handler404 = 'apps.utils.views.page_not_found_view'
handler500 = 'apps.utils.views.error_view'

urlpatterns = [
    url(r'^django-admin/', include(admin.site.urls)),
    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^search/$', 'apps.search.views.search', name='search'),
    url(r'^mamase/', include('apps.utils.urls')),
    url(r'^communications/$', CommView.as_view(), name="communications"),
    url(r'^khome/$', KwaleHomeView.as_view(), name="khome"),
    url(r'^kmap/$', KwaleMapView.as_view(), name="kmap"),
    url(r'^kreport/$', KwaleReportView.as_view(), name="kreport"),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^knowledge/', include('apps.quiz.urls')),
    url(r'^$', include('apps.partners.urls')),
    url(r'^gis/', include('apps.gis.urls')),
    url(r'^tgallery/', include('apps.testapp.urls')),


    url(r'', include(wagtail_urls)),

]

if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    from django.views.generic import TemplateView

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
