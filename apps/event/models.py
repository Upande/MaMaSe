import datetime

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.models import User
from django.shortcuts import render
from django.db import models

from wagtail.wagtailadmin.edit_handlers import (FieldPanel,InlinePanel,MultiFieldPanel,PageChooserPanel)
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailsearch import index

from modelcluster.contrib.taggit import ClusterTaggableManager
from modelcluster.fields import ParentalKey

from taggit.models import Tag, TaggedItemBase

from apps.news.models import RelatedLink,CategoryPage


class EventPageTag(TaggedItemBase):
    content_object = ParentalKey('event.EventPage', related_name='tagged_items')

class EventPage(Page):
    date = models.DateField("Event date", default=datetime.datetime.now)
    venue = RichTextField(blank=True)
    abstract = RichTextField(blank=True)
    report = RichTextField(blank=True)
    category = models.ForeignKey('news.CategoryPage', null=True, blank=True ,related_name='+',on_delete=models.SET_NULL )
    tags = ClusterTaggableManager(through=EventPageTag, blank=True)

    document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        related_name='+',
        on_delete=models.SET_NULL,
    )

    main_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        related_name='+',
        on_delete=models.SET_NULL,
    )

    @property
    def categories(self):
        # Get list of live news pages that are descendants of this page                                                                                                                        
        categories = CategoryPage.objects.live()
        return categories

    @property
    def event_item(self):
        # Get list of live news pages that are descendants of this page                                                                                                                        
        event_item = EventPage.objects.live().descendant_of(self.get_parent())
        # Order by most recent date first                                                                                                                
        event_item = event_item.order_by('-date')[:5]

        return event_item

    def get_context(self, request):
        context = super(EventPage, self).get_context(request)
        context['events'] = self.event_item
        return context

    search_fields = Page.search_fields + (
        index.SearchField('venue'),
        index.SearchField('abstract'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('date'),
        PageChooserPanel('category'),
        FieldPanel('venue',classname="full" ),
        FieldPanel('abstract', classname="full"),
        FieldPanel('report', classname="full"),
        DocumentChooserPanel('document'),
        ImageChooserPanel('main_image'),
    ]

EventPage.promote_panels = Page.promote_panels +[
    FieldPanel('tags'),
]

class EventIndexRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('EventIndexPage', related_name='related_links', blank=True,null=True)

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

#class Attendee(models.Model):
#    event = models.ForeignKey(EventPage)
#    user = models.ForeignKey(User)
#    tickets = models.IntegerField(default=1)
#    date = models.DateTimeField(auto_now_add = True)

#class watchlist(models.Model):
#    event = models.ForeignKey(EventPage)
#    user = models.ForeignKey(User)
#    date = models.DateTimeField(auto_now_add = True)
