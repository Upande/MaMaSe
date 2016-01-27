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
    search_query = request.GET.get('all', None)
    #any_ = request.GET.get('any', None)
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

    s = get_search_backend()
    
    #if any_:
    #    args.append(any_)
    #    kwargs['operator'] = 'or'
    #if search_query:
    #    args.append(search_query)
    #    kwargs['operator'] = 'and'
    #else:
    #    args.append('')
    #    kwargs['operator'] = 'or'
    
    operator = 'or'
    if type_:
        if type_.lower() == "documents":
            if date:
                search_results = s.search(search_query,Document.objects.filter(first_published_at__gte=date),operator=operator)
            else:
                search_results = s.search(search_query,'or',Document,operator=operator)
        elif type_.lower() == "images":
            if date:
                search_results = s.search(search_query,Images.objects.filter(first_published_at__gte=date),operator=operator)
            else:
                search_results = s.search(search_query,Images,operator=operator)
        elif type_.lower() == "articles":
            if date:
                search_results = s.search(search_query,Page.objects.filter(first_published_at__gte=date),operator=operator)
                query = Query.get(search_query)
                # Record hit
                query.add_hit()

                # Get search picks
                search_picks = query.editors_picks.all()

            else:
                search_results = s.search(search_query,Page,operator=operator)
        else:
            search_results = s.search(search_query,Page,operator=operator)         
        
    print kwargs
    print args

    # Pagination
    paginator = Paginator(search_results, 10)
    try:
        search_results = paginator.page(page)
    except PageNotAnInteger:
        search_results = paginator.page(1)
    except EmptyPage:
        search_results = paginator.page(paginator.num_pages)

    return render(request, 'search/results.html', {
        'search_query': search_query,
        'search_results': search_results,
        #'search_picks': search_picks,
    })

class AdvancedSearchView(TemplateView):
    template_name = "search/advanced_search.html"

class ResultsView(TemplateView):
    template_name = "search/results.html"
