from django.conf.urls import patterns, url

urlpatterns = patterns('apps.galleryapp.views',
    url(r'^(?P<gallery_slug>[-\w]+)/$', 'gallery_page', name='galleryapp_gallery'),
    url(r'^(?P<gallery_slug>[-\w]+)/(?P<image_slug>[-\w]+)/$', 'image_page', name='galleryapp_image')

)