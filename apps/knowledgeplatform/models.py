from django.db import models

from wagtail.wagtailadmin.edit_handlers import FieldPanel, StreamFieldPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtaildocs.blocks import DocumentChooserBlock
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailembeds.blocks import EmbedBlock
from wagtail.wagtailcore.fields import StreamField
from wagtail.wagtailcore.models import Page
from wagtail.wagtailcore import blocks

# Create your models here.
class KnowledgePage(Page):
    course_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    author = models.CharField(max_length=255)
    date = models.DateField("Post date")
    body = StreamField([
        ('heading', blocks.CharBlock(classname="full title")),
        ('paragraph', blocks.RichTextBlock()),
        ('urls', blocks.URLBlock()),
        ('image', ImageChooserBlock()),
        ('document', DocumentChooserBlock()),
        ('embed', EmbedBlock()),
    ])
    content_panels = Page.content_panels +[
    FieldPanel('author'),
    FieldPanel('date'),
    ImageChooserPanel('course_image'),
    StreamFieldPanel('body'),
]

class KnowledgeIndexPage(Page):
    intro = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
    ]

    @property
    def pages(self):
        # Get list of live news pages that are descendants of this page                                                                                                
        pages = KnowledgePage.objects.live().descendant_of(self.get_parent())
        # Order by most recent date first. Limit to 5 for the sidebar                                                                                                  
        pages = pages.order_by('-date')[:5]

        return pages
