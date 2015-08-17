from django.db import models

from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailadmin.edit_handlers import FieldPanel
from wagtail.wagtailcore.models import Page

class Gallery(Page):
    image1 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image1_caption = models.CharField(max_length=255, blank=True)

    image2 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image2_caption = models.CharField(max_length=255, blank=True)

    image3 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image3_caption = models.CharField(max_length=255, blank=True)

    image4 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image4_caption = models.CharField(max_length=255, blank=True)

    image5 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image5_caption = models.CharField(max_length=255, blank=True)

    image6 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image6_caption = models.CharField(max_length=255, blank=True)

    content_panels = Page.content_panels + [
       ImageChooserPanel('image1'),
       FieldPanel('image1_caption'),
       ImageChooserPanel('image2'),
       FieldPanel('image2_caption'),
       ImageChooserPanel('image3'),
       FieldPanel('image3_caption'),
       ImageChooserPanel('image4'),
       FieldPanel('image4_caption'),
       ImageChooserPanel('image5'),
       FieldPanel('image5_caption'),
       ImageChooserPanel('image6'),
       FieldPanel('image6_caption'),
    ]