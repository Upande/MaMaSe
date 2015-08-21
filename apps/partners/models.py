from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailadmin.edit_handlers import (FieldPanel)
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailcore.models import Page

from django.db import models

# Create your models here.
class PartnerLogo(models.Model):
	title = models.CharField(max_length=255, blank=True, null=True)
	partner_logo = models.ImageField(upload_to='partners')

	def __str__(self):
		return self.title
                
class PartnerPage(Page):
        main_image = models.ForeignKey(
                'wagtailimages.Image',
                null=True,
                blank=True,
                on_delete=models.SET_NULL,
                related_name='+'
        )
        bio = RichTextField(blank=True)
	website = models.CharField(max_length=100, blank=True, null=True)
        
        content_panels = Page.content_panels + [
                ImageChooserPanel('main_image'),
                FieldPanel('bio', classname="full"),
                FieldPanel('website'),
        ]
        
        
class PartnerIndexPage(Page):
        intro = RichTextField(blank=True)
        
        @property
        def partners(self):
                # Get list of live partner pages that are descendants of this page
                partners = PartnerPage.objects.live()
                return partners
                
        content_panels = Page.content_panels + [
                FieldPanel('intro', classname="full"),
        ]
