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
    intro = RichTextField(max_length=200)
    body = RichTextField(blank=True)
    tags = ClusterTaggableManager(through=NewsPageTag, blank=True)
    
    category = models.ForeignKey('news.CategoryPage', null=True, blank=True ,related_name='+',on_delete=models.SET_NULL )

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

NewsPage.promote_panels = Page.promote_panels +[
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
        # Get list of live news pages that are descendants of this page
        news_item = NewsPage.objects.live().descendant_of(self) 
        # Order by most recent date first
        news_item = news_item.order_by('-date')

        return news_item

    def get_context(self, request):
        # Get news_item
        news_item = self.news_item

        # Filter by tag
        tag = request.GET.get('tag')
        category = request.GET.get('category')

        if tag:
            news_items = news.filter(tags__name=tag).live().descendant_of(self)

        if category:
            news_items = NewsPage.objects.filter(category__name=category).live().descendant_of(self)
   
        # Pagination
        page = request.GET.get('page')
        paginator = Paginator(news_item, 10)  # Show 10 newss per page
        try:
            news_items = paginator.page(page)
        except PageNotAnInteger:
            news_items = paginator.page(1)
        except EmptyPage:
            news_items = paginator.page(paginator.num_pages)

        # Update template context
        context = super(NewsIndexPage, self).get_context(request)
        context['news'] = news_items
        return context

    @property
    def blogs(self):
        # Get list of live blog pages that are descendants of this page
        #This returns null. Not sure why. Will need to fix
        blogs = BlogPage.objects.live()#.descendant_of(self) #Commented out this part since no descendants were being found
        # Order by most recent date first
        blogs = blogs.order_by('-date')

        return blogs
        

    def serve(self, request):
        # Get blogs
        blogs = self.blogs
        
        # Filter by tag
        tag = request.GET.get('tag')
        if tag:
            blogs = blogs.filter(tags__name=tag)
            print blogs
            return render(request, self.template, {
                'self': self,
                'blogs': blogs,
            })
            
        else:
            # Display event page as usual
            return super(BlogIndexPage, self).serve(request)

class Gallery(Page):
    image1 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='image1'
    )
    image2 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='image2'
    )
    image3 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='image3'
    )
    image4 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='image4'
    )
    image5 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='image5'
    )
    image6 = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='image6'
    )
   

    content_panels = Page.content_panels + [
       ImageChooserPanel('image1'),
       ImageChooserPanel('image2'),
       ImageChooserPanel('image3'),
       ImageChooserPanel('image4'),
       ImageChooserPanel('image5'),
       ImageChooserPanel('image6'),
       
    ]
    

