from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db import models

from wagtail.wagtailsearch import index
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailcore.models import Page, Orderable
from wagtail.wagtailadmin.edit_handlers import (FieldPanel,
                                                InlinePanel,
                                                MultiFieldPanel,
                                                PageChooserPanel)

from modelcluster.contrib.taggit import ClusterTaggableManager
from modelcluster.fields import ParentalKey

from apps.news.models import RelatedLink,CategoryPage

from taggit.models import Tag, TaggedItemBase


class EmbeddedVideoIndexRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('EmbeddedVideoIndexPage', related_name='video_related_links')

#Allow a listing of embedded videos as well as adding multiple vides
class EmbeddedVideoIndexPage(Page):
    intro = RichTextField(blank=True)
    
    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
        InlinePanel('video_related_links', label="Related links"),
    ]

    @property
    def categories(self):
        # Get list of live news pages that are descendants of this page
        categories = CategoryPage.objects.live()
        
        return categories
        
    @property
    def videos(self):
        # Get list of live news pages that are descendants of this page
        videos = EmbeddedVideoPage.objects.live().descendant_of(self) 
        return videos

    @property
    def tags(self):
        #Get all unique tags that belong to the children                                                                                                                                        
        vtags = EmbeddedVideoPage.objects.live().descendant_of(self).order_by('tags__name').distinct('tags__name').values_list('tags__name',flat=True)
        return vtags

    def get_context(self, request):
        # Get news items
        videos = self.videos

        # Filter by tag
        tag = request.GET.get('tag')
        category = request.GET.get('category')

        if tag:
            videos = videos.filter(tags__name=tag).live().descendant_of(self)

        if category:
            videos = EmbeddedVideoPage.objects.filter(category__name=category).live().descendant_of(self)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(videos, 10)  # Show 10 news per page
        try:
            videos = paginator.page(page)
        except PageNotAnInteger:
            videos = paginator.page(1)
        except EmptyPage:
            videos = paginator.page(paginator.num_pages)

        # Update template context
        context = super(EmbeddedVideoIndexPage, self).get_context(request)
        context['videos'] = videos
        context['tags'] = self.tags
        return context


class EmbeddedVideoPageTag(TaggedItemBase):
    content_object = ParentalKey('video.EmbeddedVideoPage', related_name='tagged_items')

#View for a single embedded video.
class EmbeddedVideoPage(Page):
    video_link = models.URLField("Video link", blank=True)
    description = RichTextField(blank=True)

    tags = ClusterTaggableManager(through=EmbeddedVideoPageTag, blank=True)
    category = models.ForeignKey('news.CategoryPage', null=True, blank=True ,related_name='+',on_delete=models.SET_NULL )

    search_fields = Page.search_fields + (
        index.SearchField('category'),
        index.SearchField('video_link'),
        index.SearchField('description'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('video_link'),
        PageChooserPanel('category'),
        FieldPanel('description', classname="full"),
    ]
    
    @property
    def categories(self):
        # Get list of live news pages that are descendants of this page
        categories = CategoryPage.objects.live()
        
        return categories
            
    @property
    def videos(self):
        # Get list of live videos that are descendants of this page  Order by date and get the five latest ones
        videos = EmbeddedVideoPage.objects.live().descendant_of(self.get_parent()).order_by('-latest_revision_created_at')[:5]
        return videos

    @property
    def video_tags(self):
        #Get all unique tags that belong to the children         
        tags = EmbeddedVideoPage.objects.live().descendant_of(self.get_parent()).order_by('tags__name').distinct('tags__name').values_list('tags__name',flat=True)
        return tags

    def get_context(self, request):
        # Update template context                                                                                                                                                               
        context = super(EmbeddedVideoPage, self).get_context(request)
        context['videos'] = self.videos
        context['tags'] = self.video_tags
        return context



EmbeddedVideoPage.promote_panels = Page.promote_panels +[
    FieldPanel('tags'),
]
