from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.models import User
from django.shortcuts import render

from wagtail.contrib.wagtailsearchpromotions.models import SearchPromotion
from wagtail.wagtailsearch.backends import get_search_backend
from wagtail.wagtailsearch.models import Query
from wagtail.wagtailcore.models import Page
from wagtail.wagtailimages.models import Image
from wagtail.wagtaildocs.models import Document

from django.views.generic.base import TemplateView

def search(request):
    search_query = request.GET.get('query', None)
    page = request.GET.get('page', 1)

    # Search
    if search_query:
        search_results = Page.objects.live().search(search_query)
        query = Query.get(search_query)

        # Record hit
        query.add_hit()

        # Get search picks
        search_picks = query.editors_picks.all()
    else:
        search_results = Page.objects.none()
        search_picks = SearchPromotion.objects.none()

    # Pagination
    paginator = Paginator(search_results, 10)
    try:
        search_results = paginator.page(page)
    except PageNotAnInteger:
        search_results = paginator.page(1)
    except EmptyPage:
        search_results = paginator.page(paginator.num_pages)

    return render(request, 'search/search_results.html', {
        'search_query': search_query,
        'search_results': search_results,
        'search_picks': search_picks,
    })

def advancedsearch(request):
    all_ = request.GET.get('all', None)
    any_ = request.GET.get('any', None)
    user = request.GET.get('user', None)
    type_ = request.GET.get('type', None)
    date = request.GET.get('date', None)
    page = request.GET.get('page', 1)

    if user:
        sysuser = User.objects.filter(username = user)
        if sysuser:
            search_results = Page.objects.live().filter(owner=sysuser[0])
        else:
            search_results = Page.objects.live()
    else:
        search_results = Page.objects.live()
            
    args = []
    kwargs = {}

    if any_:
        args.append(any_)
        kwargs['operator'] = 'or'
    elif all_:
        args.append(all_)
        kwargs['operator'] = 'and'
    else:
        args.append('')
        kwargs['operator'] = 'or'

    if type_:
        if type_.lower() == "documents":
            if date:
                args.append(Document.objects.filter(created_at_gte=date))
            else:
                args.append(Document)
        elif type_.lower() == "images":
            if date:
                args.append(Images.objects.filter(created_at_gte=date))
            else:
                args.append(Images)
        elif type_.lower() == "articles":
            if date:
                args.append(Page.objects.filter(created_at_gte=date))
            else:
                args.append(Page)
        else:
            pass
            
        
    print kwargs
    print args

    s = get_search_backend()
    search_results = s.search(*args,**kwargs)
    
    # Pagination
    paginator = Paginator(search_results, 10)
    try:
        search_results = paginator.page(page)
    except PageNotAnInteger:
        search_results = paginator.page(1)
    except EmptyPage:
        search_results = paginator.page(paginator.num_pages)

    return render(request, 'search/search_results.html', {
        'search_query': search_query,
        'search_results': search_results,
        'search_picks': search_picks,
    })

class AdvancedSearchView(TemplateView):
    template_name = "search/advanced_search.html"

class ResultsView(TemplateView):
    template_name = "search/results.html"
