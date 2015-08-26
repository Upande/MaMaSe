from apps.news.models import NewsPage

def baseurl(request):
    """
    Return a BASE_URL template context for the current request.
    """
    if request.is_secure():
        scheme = 'https://'
    else:
        scheme = 'http://'
        
    return {'BASE_URL': scheme + request.get_host(),}

def news_items(request):
    '''mamase needed to have the news items available from the home page. Given they are not passed by default,
    I, Magondu, created this hack to pass them to the template. It passes the first three news ites'''
    

    np = NewsPage.objects.all().order_by('-date')[:3]
    
    return {'news_items': np}
