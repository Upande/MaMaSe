from django.conf.urls import include, url
from django.conf import settings
from django.contrib import admin

from wagtail.wagtailadmin import urls as wagtailadmin_urls
from wagtail.wagtaildocs import urls as wagtaildocs_urls
from wagtail.wagtailcore import urls as wagtail_urls

from apps.news.views import CommView

urlpatterns = [
    url(r'^django-admin/', include(admin.site.urls)),
    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^search/$', 'search.views.search', name='search'),
    url(r'^home/$', 'apps.thingspeak.views.home', name='home'),
    url(r'^chart/$', 'apps.thingspeak.views.chart', name='chart'),
    url(r'^ts/', include('apps.thingspeak.urls')),
    url(r'^communications/$', CommView.as_view(), name="communications"),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^q/', include('apps.quiz.urls')),

    url(r'', include(wagtail_urls)),

]

if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    from django.views.generic import TemplateView

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
