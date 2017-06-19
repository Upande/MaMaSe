from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db import models

from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtaildocs.blocks import DocumentChooserBlock
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtailadmin.edit_handlers import FieldPanel
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailembeds.blocks import EmbedBlock
from wagtail.wagtailcore.fields import StreamField
from wagtail.wagtailcore.models import Page
from wagtail.wagtailsearch import index
from wagtail.wagtailcore import blocks


class CourseCategoryPage(Page):
    description = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('description'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('description', classname="full"),
    ]


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
    software = RichTextField("Software", blank=True)
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
    slides = RichTextField("Slides of Lectures", blank=True)
    thanks = RichTextField("Thanks", blank=True)
    training = RichTextField("Tailor Made Trainings", blank=True)

    category = models.ForeignKey('knowledgeplatform.CourseCategoryPage',
                                 null=True, blank=True,
                                 related_name='+', on_delete=models.SET_NULL)

    body = StreamField([
        ('paragraph', blocks.RichTextBlock()),
        ('urls', blocks.URLBlock()),
        ('image', ImageChooserBlock()),
        ('document', DocumentChooserBlock()),
        ('embed', EmbedBlock()),
    ])

    @property
    def categories(self):
        # Get list of live news pages that are descendants of this page
        categories = CourseCategoryPage.objects.live()
        return categories

    def get_context(self, request):
        courses = CoursePage.objects.live().descendant_of(self.get_parent())

        category = request.GET.get('category')
        page = request.GET.get('page')

        if category:
            filtered_courses = get_courses_by_category(category, courses, page)
        else:
            filtered_courses = courses
        context = super(CoursePage, self).get_context(request)
        context['courses'] = filtered_courses
        return context

    content_panels = Page.content_panels + [
        FieldPanel('author'),
        FieldPanel('date'),
        ImageChooserPanel('course_image'),
        FieldPanel('description', classname="full"),
        FieldPanel('forwhom', classname="full"),
        FieldPanel('objectives', classname="full"),
        FieldPanel('software', classname="full"),
        FieldPanel('books', classname="full"),
        FieldPanel('lecturer', classname="full"),
        FieldPanel('acknowledgements', classname="full"),
        FieldPanel('shortcourses', classname="full"),
        FieldPanel('slides', classname="full"),
        FieldPanel('thanks', classname="full"),
        FieldPanel('training', classname="full"),
        FieldPanel('category'),
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
        pages = pages.order_by('-date')
        return pages

    @property
    def categories(self):
        # Get list of live news pages that are descendants of this page
        categories = CourseCategoryPage.objects.live()
        return categories

    def get_context(self, request):
        course = self.pages

        category = request.GET.get('category')
        page = request.GET.get('page')

        if category:
            filtered_courses = get_courses_by_category(category, course, page)
        else:
            # Return all
            filtered_courses = course
        context = super(CourseIndexPage, self).get_context(request)
        context['courses'] = filtered_courses
        return context


def get_courses_by_category(category, courses, page):
        if category:
            filtered_courses = courses.filter(category__title=category)
        # Pagination
        paginator = Paginator(filtered_courses, 10)  # Show 10 newss per page
        try:
            filtered_courses = paginator.page(page)
        except PageNotAnInteger:
            filtered_courses = paginator.page(1)
        except EmptyPage:
            filtered_courses = paginator.page(paginator.num_pages)

        return filtered_courses


class CIWABIndexPage(Page):
    intro = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
    ]

    @property
    def pages(self):
        # Get list of live news pages that are descendants of this page
        pages = CIWABPage.objects.live().descendant_of(self.get_parent())
        # Order by most recent date first. Limit to 5 for the sidebar
        pages = pages.order_by('-date')
        return pages

    def get_context(self, request):
        context = super(CIWABIndexPage, self).get_context(request)
        context['ciwab_pages'] = self.pages
        return context


class CIWABPage(Page):
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
    document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        related_name='+',
        on_delete=models.SET_NULL,
    )
    body = RichTextField("Body", blank=True)

    category = models.ForeignKey('knowledgeplatform.CourseCategoryPage',
                                 null=True, blank=True,
                                 related_name='+', on_delete=models.SET_NULL)

    @property
    def categories(self):
        # Get list of live news pages that are descendants of this page
        categories = CourseCategoryPage.objects.live()
        return categories

    def get_context(self, request):
        courses = CoursePage.objects.live().descendant_of(self.get_parent())

        category = request.GET.get('category')
        page = request.GET.get('page')

        if category:
            filtered_courses = get_courses_by_category(category, courses, page)
        else:
            filtered_courses = courses
        context = super(CIWABPage, self).get_context(request)
        context['courses'] = filtered_courses
        return context

    content_panels = Page.content_panels + [
        FieldPanel('author'),
        FieldPanel('date'),
        # ImageChooserPanel('course_image'),
        FieldPanel('description', classname="full"),
        FieldPanel('body', classname="full"),
        #FieldPanel('category'),
    ]
