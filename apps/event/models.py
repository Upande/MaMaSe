from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render
from django.db import models

from wagtail.wagtailsearch import index
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailadmin.edit_handlers import (FieldPanel,
                                                InlinePanel,
                                                MultiFieldPanel,
                                                PageChooserPanel)
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel

from modelcluster.contrib.taggit import ClusterTaggableManager
from modelcluster.fields import ParentalKey

from taggit.models import Tag, TaggedItemBase

from apps.news.models import RelatedLink,CategoryPage

class EventPageTag(TaggedItemBase):
    content_object = ParentalKey('event.EventPage', related_name='tagged_items')

class EventPage(Page):
    main_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    start_date = models.DateTimeField("Start date")
    end_date = models.DateTimeField("End date")
    body = RichTextField(blank=True)
    location = RichTextField(max_length=200)
    maps_url = models.URLField("Map Link", blank=True)
    tags = ClusterTaggableManager(through=EventPageTag, blank=True)
    cost = models.IntegerField(default=0)
    category = models.ForeignKey('news.CategoryPage', null=True, blank=True ,related_name='+',on_delete=models.SET_NULL )

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
        index.SearchField('body'),
        index.SearchField('location'),
        index.SearchField('cost'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('start_date'),
        FieldPanel('end_date'),
        ImageChooserPanel('main_image'),
        PageChooserPanel('category'),
        FieldPanel('location'),
        FieldPanel('maps_url'),
        FieldPanel('cost'),
        FieldPanel('body', classname="full")
    ]

EventPage.promote_panels = Page.promote_panels +[
    FieldPanel('tags'),
]

class EventIndexRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('EventIndexPage', related_name='related_links')


class EventIndexPage(Page):
    intro = RichTextField(blank=True)
    
    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
        InlinePanel('related_links', label="Related links"),
    ]

    @property
    def categories(self):
        # Get list of live events pages that are descendants of this page
        categories = CategoryPage.objects.live() 
        
        return categories
        
    
    @property
    def event(self):
        # Get list of live event pages that are descendants of this page
        event = EventPage.objects.live().descendant_of(self) 
        # Order by most recent date first
        event = event.order_by('-start_date')

        return event

    def get_context(self, request):
        # Get event
        event = self.event
        
        # Filter by tag
        tag = request.GET.get('tag')
        category = request.GET.get('category')
        
        if tag:
            events = event.filter(tags__name=tag).live().descendant_of(self)

        if category:
            events = EventPage.objects.filter(category__name=category).live().descendant_of(self)
   
        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(event, 10)  # Show 10 events per page
        try:
            events = paginator.page(page)
        except PageNotAnInteger:
            events = paginator.page(1)
        except EmptyPage:
            events = paginator.page(paginator.num_pages)

        # Update template context
        context = super(EventIndexPage, self).get_context(request)
        context['events'] = events
        return context
