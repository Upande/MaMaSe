import json

from django.http import JsonResponse,HttpResponseRedirect
from django.shortcuts import render,render_to_response
from django.views.generic.base import TemplateView
from django.core.urlresolvers import reverse

from .models import LoggerData,Channel,ChannelField,Feed,EmailRecipient,Email
from .emailSender import send_email
from . import thingspeak 



def logThingspeakData(request):
    data = thingspeak.parseAPIContent()
    
    
    l = LoggerData(raw_data = data)
    
    results = json.loads(data.text)
    dct = results['channel']
    feeds = results['feeds']
    
    c,created = Channel.objects.get_or_create(
        data_id = dct.get('id'),

        defaults=dict(name = dct.get('name'),
                      description = dct['description'],
                      longitude = float(dct['longitude']),
                      latitide = float(dct['latitude']),
                      created_at= dct['created_at'],
                      updated_at = dct['updated_at'],
                      elevation = dct['elevation'],
                      last_entry_id = dct['last_entry_id'],
                  )
    )
    
    l.save()
    
    #Need to find a scalable way to do this
    if not c:
        return

    for item in dct:
        if "field" in item:
            cf = ChannelField(tag = item,field = dct[item],channel = c)
            cf.save()
            
    for item in feeds:
        f = Feed.objects.get_or_create(
            entry_id = item.get('entry_id'),
            defaults = dict(
                created_at = item.get('created_at'),
                channel = c,
            )
        )
    
    return JsonResponse(results)


class IndexView(TemplateView):
    template_name = "visual.html"

class AboutView(TemplateView):
    template_name = "about.html"

class ContactView(TemplateView):
    template_name = "contact.html"
        
        
def error_view(request):
    return render(request,"500.html")
    
def page_not_found_view(request):
    return render(request,"404.html")
    
def email(request):
    args = {}
    if request.method == "POST":
        name  = request.POST.get('name',None)
        email  = request.POST.get('email',None)
        subject  = request.POST.get('subject',None)
        message  = request.POST.get('message',None)
        
        status = False
        html_message = ""

        if message != None and name != None:
            #Check who the email is intended for
            sent_email = Email(sender = name,email=email,subject = subject,message = message)
            sent_email.save()

            er = EmailRecipient.objects.all()

            to_list = er.values_list('email',flat=True)
            
            html_message = create_email_message(email,message,name)
            
                    
            #Create the html message to be sent via email
            status = send_email(html_message,"mamasewebsite@gmail.com",to_list,subject)

        if status:
            args['success_message'] = "Success! We have received your email and will respond ASAP. "
        else:
            args['error_message'] = "Error! An error occured. Please try again. "
            
        return render(request, 'contact.html', args)
    else:
        return HttpResponseRedirect(reverse('contact-us'))

def create_email_message(email,message,name):
    html_content = "Hello, \n\n"
    html_content = html_content + "You have received mail from the website.\n\n"
    html_content = html_content + "From: "+email
    html_content = html_content + "\nName: "+name
    html_content = html_content + "\nMessage: " + message
    html_content = html_content + '\n\n'
    html_content = html_content + 'Yours truly,\n\n'
    html_content = html_content + 'The Upande Team.'
    
    return html_content
