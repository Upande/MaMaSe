from django.shortcuts import render_to_response

def home(request):
    args = {}
    args['isLoggedIn'] = False
    return render_to_response("index.html", args)

def chart(request):
    args = {}
    args['isLoggedIn'] = False
    return render_to_response("chart.html", args)
