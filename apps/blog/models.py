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


class BlogPageTag(TaggedItemBase):
    content_object = ParentalKey('blog.BlogPage', related_name='tagged_items')

class CategoryPage(Page):
    name = models.CharField(max_length=200)
    description = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('name'),
        index.SearchField('description'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('name'),
        FieldPanel('description', classname="full"),
    ]

class BlogPage(Page):
    main_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    date = models.DateField("Post date")
    intro = RichTextField(max_length=200)
    body = RichTextField(blank=True)
    tags = ClusterTaggableManager(through=BlogPageTag, blank=True)
    
    category = models.ForeignKey('blog.CategoryPage', null=True, blank=True ,related_name='+',on_delete=models.SET_NULL )
    #category = models.ForeignKey('blog.Category',related_name = 'category')

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
        index.SearchField('body'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('date'),
        ImageChooserPanel('main_image'),
        PageChooserPanel('category'),
        FieldPanel('intro',classname="full" ),
        FieldPanel('body', classname="full")
    ]

BlogPage.promote_panels = Page.promote_panels +[
    FieldPanel('tags'),
]

class LinkFields(models.Model):
    link_external = models.URLField("External link", blank=True)
    link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        related_name='+'
    )

    @property
    def link(self):
        if self.link_page:
            return self.link_page.url
        else:
            return self.link_external

    panels = [
        FieldPanel('link_external'),
        PageChooserPanel('link_page'),
    ]

    class Meta:
        abstract = True


# Related links
class RelatedLink(LinkFields):
    title = models.CharField(max_length=255, help_text="Link title")

    panels = [
        FieldPanel('title'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


class BlogIndexRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('BlogIndexPage', related_name='related_links')

class EmbeddedVideoIndexRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('EmbeddedVideoIndexPage', related_name='video_related_links')

class BlogIndexPage(Page):
    intro = RichTextField(blank=True)
    
    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
        InlinePanel('related_links', label="Related links"),
    ]

    @property
    def categories(self):
        # Get list of live blog pages that are descendants of this page
        categories = CategoryPage.objects.live() 
        
        return categories
        
    
    @property
    def blogs(self):
        # Get list of live blog pages that are descendants of this page
        blogs = BlogPage.objects.live().descendant_of(self) 
        # Order by most recent date first
        blogs = blogs.order_by('-date')

        return blogs

    def get_context(self, request):
        # Get blogs
        blogs = self.blogs

        # Filter by tag
        tag = request.GET.get('tag')
        category = request.GET.get('category')

        if tag:
            blogs = blogs.filter(tags__name=tag).live().descendant_of(self)
            #blogs = blogs.filter(tags__name=tag)

        if category:
            blogs = BlogPage.objects.filter(category__name=category).live().descendant_of(self)
            #blogs = blogs.filter(tags__name=tag).live().descendant_of(self)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(blogs, 10)  # Show 10 blogs per page
        try:
            blogs = paginator.page(page)
        except PageNotAnInteger:
            blogs = paginator.page(1)
        except EmptyPage:
            blogs = paginator.page(paginator.num_pages)

        # Update template context
        context = super(BlogIndexPage, self).get_context(request)
        context['blogs'] = blogs
        return context

class Gallery(Page):
    image1 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image2 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image3 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image4 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image5 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    image6 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
   

    content_panels = Page.content_panels + [
       ImageChooserPanel('image1'),
       ImageChooserPanel('image2'),
       ImageChooserPanel('image3'),
       ImageChooserPanel('image4'),
       ImageChooserPanel('image5'),
       ImageChooserPanel('image6'),
    ]

#Allow a listing of embedded videos as well as adding multiple vides
class EmbeddedVideoIndexPage(Page):
    intro = RichTextField(blank=True)
    
    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
        InlinePanel('video_related_links', label="Related links"),
    ]

    @property
    def categories(self):
        # Get list of live blog pages that are descendants of this page
        categories = CategoryPage.objects.live() 
        
        return categories
        
    
    @property
    def videos(self):
        # Get list of live blog pages that are descendants of this page
        videos = EmbeddedVideoPage.objects.live().descendant_of(self) 
        return videos

    def get_context(self, request):
        # Get blogs
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
        paginator = Paginator(videos, 10)  # Show 10 blogs per page
        try:
            videos = paginator.page(page)
        except PageNotAnInteger:
            videos = paginator.page(1)
        except EmptyPage:
            videos = paginator.page(paginator.num_pages)

        # Update template context
        context = super(EmbeddedVideoIndexPage, self).get_context(request)
        context['videos'] = videos
        return context

#View for a single embedded video.
class EmbeddedVideoPage(Page):
    video_link = models.URLField("Video link", blank=True)
    description = RichTextField(blank=True)

    category = models.ForeignKey('blog.CategoryPage', null=True, blank=True ,related_name='+',on_delete=models.SET_NULL )

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
