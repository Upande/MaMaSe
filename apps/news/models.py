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
from wagtail.wagtaildocs.edit_handlers import DocumentChooserPanel

from modelcluster.contrib.taggit import ClusterTaggableManager
from modelcluster.fields import ParentalKey

from taggit.models import Tag, TaggedItemBase


class NewsPageTag(TaggedItemBase):
    content_object = ParentalKey('news.NewsPage', related_name='tagged_items')


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


class NewsPage(Page):
    main_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    date = models.DateField("Post date")
    intro = RichTextField(blank=True)
    body = RichTextField(blank=True)
    tags = ClusterTaggableManager(through=NewsPageTag, blank=True)

    category = models.ForeignKey('news.CategoryPage', null=True, blank=True, related_name='+',on_delete=models.SET_NULL )

    link_document = models.ForeignKey(
        'wagtaildocs.Document',
        null=True,
        blank=True,
        related_name='+',
        on_delete=models.SET_NULL,
    )

    #@property
    #def categories(self):
    #    # Get list of live news pages that are descendants of this page
    #    categories = CategoryPage.objects.live()
    #    return categories

    @property
    def news_items(self):
        # Get list of live news pages that are descendants of this page
        news_items = NewsPage.objects.live().descendant_of(self.get_parent())
        # Order by most recent date first. Limit to 5 for the sidebar
        news_items = news_items.order_by('-date')[:5]

        return news_items

    @property
    def news_tags(self):
        #Get all unique tags that belong to the children
        news_tags = NewsPage.objects.live().descendant_of(self.get_parent()).order_by('tags__name').distinct('tags__name').values_list('tags__name',flat=True)
        return news_tags

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
        index.SearchField('body'),
    )

    def get_context(self, request):
        # Update template context
        context = super(NewsPage, self).get_context(request)
        context['news'] = self.news_items
        context['tags'] = self.news_tags
        return context

    content_panels = Page.content_panels + [
        FieldPanel('date'),
        ImageChooserPanel('main_image'),
        PageChooserPanel('category'),
        FieldPanel('intro'),
        FieldPanel('body', classname="full"),
        DocumentChooserPanel('link_document'),
    ]

NewsPage.promote_panels = Page.promote_panels + [
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


class NewsIndexRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('NewsIndexPage', related_name='related_links')


class NewsIndexPage(Page):
    intro = RichTextField(blank=True)
    content_panels = Page.content_panels + [
        FieldPanel('intro', classname="full"),
        InlinePanel('related_links', label="Related links"),
    ]

    @property
    def categories(self):
        # Get list of live news pages that are descendants of this page
        categories = CategoryPage.objects.live()

        return categories

    @property
    def news_item(self):
        '''Due to a late change of requirements, this page is used for more than news item. As such it works
        by getting all children unlike before where it got news pages only. Shall need to be redesinged and
        reworked to be clear'''

        # Get list of live news pages that are descendants of this page
        news_item = self.get_children().live()
        # Order by most recent date first
        news_item = news_item.order_by('-id')

        return news_item

    @property
    def tags(self):
        #Get all unique tags that belong to the children
        tags = NewsPage.objects.live().descendant_of(self).order_by('tags__name').distinct('tags__name').values_list('tags__name',flat=True)

        return tags

    def get_context(self, request):
        # Get news_item
        news_item = self.news_item
        tags = self.tags

        # Filter by tag
        tag = request.GET.get('tag')
        category = request.GET.get('category')

        if tag:
            news_item = news_item.filter(tags__name=tag)

        if category:
            news_item = news_item.filter(categorypage__name=category)

        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(news_item, 10)  # Show 10 newss per page
        try:
            news_item = paginator.page(page)
        except PageNotAnInteger:
            news_item = paginator.page(1)
        except EmptyPage:
            news_item = paginator.page(paginator.num_pages)

        # Update template context
        context = super(NewsIndexPage, self).get_context(request)
        context['news'] = news_item
        context['tags'] = tags
        return context


class NoCommentPage(Page):
    date = models.DateField("Post date")
    intro = RichTextField(blank=True)
    body = RichTextField(blank=True)
    category = models.ForeignKey('news.CategoryPage', null=True, blank=True ,related_name='+',on_delete=models.SET_NULL )

    link_document = models.ForeignKey(
        'wagtaildocs.Document',
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
    def news_item(self):
        # Get list of live news pages that are descendants of this page
        news_item = NoCommentPage.objects.live().descendant_of(self.get_parent())
        # Order by most recent date first
        news_item = news_item.order_by('-date')[:5]

        return news_item

    def get_context(self, request):
        context = super(NoCommentPage, self).get_context(request)
        context['news'] = self.news_item
        return context

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
        index.SearchField('body'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('date'),
        PageChooserPanel('category'),
        FieldPanel('intro', classname="full"),
        FieldPanel('body', classname="full"),
        DocumentChooserPanel('link_document'),
    ]


class InformationPage(Page):
    date = models.DateField("Post date")
    body = RichTextField(blank=True)

    search_fields = Page.search_fields + (
        index.SearchField('body'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('date'),
        FieldPanel('body', classname="full"),
    ]
