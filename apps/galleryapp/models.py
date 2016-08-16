from django.db import models

from django.db import models
from django.template.defaultfilters import slugify

from filer.fields.image import FilerImageField

from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailadmin.edit_handlers import (FieldPanel,
                                                InlinePanel,
                                                MultiFieldPanel,
                                                PageChooserPanel)
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel

#import thumbs


class GalleryApp(Page):
    #gallery_slug = models.SlugField(max_length=50)
    name = models.CharField(max_length=55)
    description = models.TextField(blank=True)
#    date_created = models.DateTimeField(auto_now_add=True)
#    date_modified = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['name']
        verbose_name_plural = "galleries"

    def __unicode__(self):
        return(self.name)

def save(self, *args, **kwargs):
        self.gallery_slug = slugify(self.name)
        super(GalleryApp, self).save(*args, **kwargs) # Call the "real" save() method.

GalleryApp.content_panels = Page.content_panels + [
       FieldPanel('name'),
       FieldPanel('description'),
    ]


class ImageApp(Page):
#    image_slug = models.SlugField(max_length=50)
    name =  models.CharField(max_length=50)
    image = models.ImageField(upload_to='MaMaSeGalleries',blank=True,null=True)
    description = models.TextField(blank=True)
#    date_created = models.DateTimeField(auto_now_add=True)
#    date_modified = models.DateTimeField(auto_now=True)
    gallery = models.ForeignKey(GalleryApp, on_delete=models.SET_NULL, null=True)

    class Meta:
        ordering = ['name']

    def __unicode__(self):
        return(self.name)

    def save(self, *args, **kwargs):
        self.image_slug = slugify(self.name)
        super(Image, self).save(*args, **kwargs) # Call the "real" save() method.

ImageApp.content_panels = Page.content_panels + [
       FieldPanel('name'),
       ImageChooserPanel('image'),
       FieldPanel('description'),
    ]



