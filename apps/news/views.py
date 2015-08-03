from django.shortcuts import render

from wagtail.wagtailcore.models import Page
from wagtail.wagtailsearch.models import Query


# Create your views here.
from django.views.generic import TemplateView

class CommView(TemplateView):
    template_name = "communications.html"
    
    def get_context_data(self, **kwargs):
        context = super(CommView, self).get_context_data(**kwargs)

        context["news_url"] = '/news/'
        context["video_url"] = '/videos/'
        context["gallery_url"] = '/gallery/'
        context["events_url"] = '/events/' 

        return context

def search(request):
    # Search
    search_query = request.GET.get('query', None)
    if search_query:
        search_results = Page.objects.live().search(search_query)

        # Log the query so Wagtail can suggest promoted results
        Query.get(search_query).add_hit()
    else:
        search_results = Page.objects.none()

    # Render template
    return render(request, 'search/search_results.html', {
        'search_query': search_query,
        'search_results': search_results,
    })
