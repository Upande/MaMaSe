from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailadmin.edit_handlers import (FieldPanel,
                                                InlinePanel,
                                                MultiFieldPanel,
                                                PageChooserPanel)
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel

from modelcluster.contrib.taggit import ClusterTaggableManager
from modelcluster.fields import ParentalKey

from django.db import models

class LinkFields(models.Model):
    embedded_link = models.URLField("Embedded link", blank=True)
    image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    @property
    def link(self):
        if self.image:
            return self.image.file.url
        else:
            return self.embedded_link

    panels = [
        ImageChooserPanel('image'),
        FieldPanel('embedded_link'),
    ]

    class Meta:
        abstract = True

#Media links or item          
class MediaLink(LinkFields):
    title = models.CharField(max_length=255, help_text="Link title")
    caption = models.CharField(max_length=255, null=True,help_text="Image Caption")

    panels = [
        FieldPanel('title'),        
        FieldPanel('caption'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True

class MediaPageRelatedLink(Orderable, MediaLink):
    page = ParentalKey('MediaPage', related_name='media_items')

class MediaPage(Page):
    description = RichTextField(blank=True)
    author = models.CharField(max_length=255)
    date_created = models.DateField(auto_now_add=True)
    #name = models.CharField(max_length=255)

    content_panels = Page.content_panels + [
        #FieldPanel('name', classname="full"),
        FieldPanel('author', classname="full"),
        FieldPanel('description', classname="full"),
        InlinePanel('media_items', label="Media Item"),
    ]

class MediaIndexPage(Page):
    description = RichTextField(blank=True)
    date_created = models.DateField(auto_now_add=True)
    #name = models.CharField(max_length=255)

    @property
    def albums(self):
        # Get list of live news pages that are descendants of this page
        a = MediaPage.objects.live().descendant_of(self)
        return a

    content_panels = Page.content_panels + [
        #FieldPanel('name', classname="full"),
        FieldPanel('description', classname="full"),
    ]
