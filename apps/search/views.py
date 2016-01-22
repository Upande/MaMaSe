from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.models import User
from django.shortcuts import render

from wagtail.wagtailcore.models import Page
from wagtail.wagtailsearch.models import Query
from wagtail.contrib.wagtailsearchpromotions.models import SearchPromotion

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
    page = request.GET.get('page', 1)

    if user:
        sysuser = User.objects.filter(username = user)
        if sysuser:
            search_results = Page.objects.live().filter(owner=sysuser[0])
        else:
            search_results = Page.objects.live()
    else:
        search_results = Page.objects.live()
        
    #Cascaded search will not work. I shall need to create one query that does a comprehensive search. Use kwargs?
    
    if any_:
        search_results = search_results.search(any_,operator="or")
        query = Query.get(any_)

        # Record hit
        query.add_hit()

        # Get search picks
        search_picks = query.editors_picks.all()

    if all_:
        search_results = search_results.search(all_,operator="and")
        query = Query.get(all_)

        # Record hit
        query.add_hit()
    
    if type_:
        if type_.lower() == "documents":
            search
    
    if not all_ or not any_:
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

class AdvancedSearchView(TemplateView):
    template_name = "search/advanced_search.html"

class ResultsView(TemplateView):
    template_name = "search/results.html"
