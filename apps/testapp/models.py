from django.db import models

from wagtail.wagtailcore.models import Page
from wagtail.wagtailcore.fields import StreamField
from wagtail.wagtailcore import blocks
from wagtail.wagtailadmin.edit_handlers import FieldPanel, StreamFieldPanel
from wagtail.wagtailimages.blocks import ImageChooserBlock

from templatetags.torchbox_tags import *

class ImageCarouselBlock(blocks.StructBlock):
    image = ImageChooserBlock()
    caption = blocks.TextBlock(required=False)
 
    class Meta:
        template = "testapp/t_page.html"
        icon = 'image'

class TPage(Page):
    author = models.CharField(max_length=255)
    date_created = models.DateField(auto_now_add=True)
    date_modified = models.DateField(auto_now=True)
    body = StreamField([
        ('image', ImageChooserBlock(icon="image")),
        ('image_carousel', blocks.ListBlock(ImageCarouselBlock(), template="testapp/t_page.html", icon="image")),
    ])
    content_panels =  Page.content_panels +[
        FieldPanel('author'),
        StreamFieldPanel('body'),
    ]

@register.assignment_tag(takes_context=False)
def timestamp():
    dt = datetime.now()
    ts = dt.microsecond
    return str(ts)
