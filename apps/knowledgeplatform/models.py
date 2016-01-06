from django.db import models

from wagtail.wagtailadmin.edit_handlers import FieldPanel, StreamFieldPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel
from wagtail.wagtaildocs.blocks import DocumentChooserBlock
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailembeds.blocks import EmbedBlock
from wagtail.wagtailcore.fields import StreamField
from wagtail.wagtailcore.models import Page
from wagtail.wagtailcore import blocks

# Create your models here.
class CoursePage(Page):
    course_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )

    author = models.CharField(max_length=255)
    date = models.DateField("Post date")
    
    description = RichTextField("Description", blank=True)
    forwhom = RichTextField("For Whom?", blank=True)
    objectives = RichTextField("Learning Objectives", blank=True)
    software= RichTextField("Software", blank=True)
    books = RichTextField("Books", blank=True)
    lecturer = RichTextField("Lecturer", blank=True)
    acknowledgements = RichTextField("Acknowledgements", blank=True)
    shortcourses = RichTextField("Short Courses", blank=True)
    schedule = RichTextField("Schedule", blank=True)
    document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        related_name='+',
        on_delete=models.SET_NULL,
    )
    slides = RichTextField("Books", blank=True)
    thanks = RichTextField("Thanks", blank=True)
    training = RichTextField("Tailor Made Trainings", blank=True)
    
    body = StreamField([
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
        FieldPanel('description', classname="full"),
        FieldPanel('forwhom', classname="full"),
        FieldPanel('objectives', classname="full"),
        FieldPanel('software', classname="full"),
        FieldPanel('books', classname="full"),
        FieldPanel('lecturer', classname="full"),
        FieldPanel('shortcourses', classname="full"),
        FieldPanel('books', classname="full"),
        DocumentChooserPanel('document'),
        FieldPanel('slides', classname="full"),
        FieldPanel('thanks', classname="full"),
        FieldPanel('training', classname="full"),
    ]

class CourseIndexPage(Page):
    intro = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
    ]

    @property
    def pages(self):
        # Get list of live news pages that are descendants of this page                             
        pages = CoursePage.objects.live().descendant_of(self.get_parent())
        # Order by most recent date first. Limit to 5 for the sidebar            
        pages = pages.order_by('-date')[:5]
        return pages
