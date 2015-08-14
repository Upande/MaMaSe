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

import thumbs


class Gallery(Page):
    gallery_slug = models.SlugField(max_length=50, primary_key=True)
    name = models.CharField(max_length=50)
    description = models.TextField(blank=True)

    class Meta:
        ordering = ['name']
        verbose_name_plural = "galleries"

    def __unicode__(self):
        return(self.name)

    def save(self, *args, **kwargs):
        self.gallery_slug = slugify(self.name)
        super(Gallery, self).save(*args, **kwargs) # Call the "real" save() method.

    content_panels = Page.content_panels + [
       FieldPanel('name'),
       FieldPanel('description'),
    ]


class Image(Page):
    image_slug = models.SlugField(max_length=50, primary_key=True)
    name =  models.CharField(max_length=50)
    image = models.ImageField(upload_to='MaMaSeGalleries')
    #image = FilerImageField(on_delete=models.SET_NULL, null=True)
    #image = thumbs.ImageWithThumbsField(upload_to='MaMaSeGalleries', sizes=((370, 229, thumbs.generate_thumb_max_rectangle),))
    description = models.TextField(blank=True)
    date = models.DateField(blank=True)
    gallery = models.ForeignKey(Gallery, on_delete=models.SET_NULL, null=True)

    class Meta:
        ordering = ['name']

    def __unicode__(self):
        return(self.name)

    def save(self, *args, **kwargs):
        self.image_slug = slugify(self.name)
        super(Image, self).save(*args, **kwargs) # Call the "real" save() method.

    content_panels = Page.content_panels + [
       FieldPanel('name'),
       ImageChooserPanel('image'),
       FieldPanel('description'),
       #PageChooserPanel('gallery'),
    ]



