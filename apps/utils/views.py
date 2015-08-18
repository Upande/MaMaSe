from django.shortcuts import render,render_to_response
from django.views.generic.base import TemplateView
from django.http import JsonResponse

from . import thingspeak 
from .emailSender import send_email

from .models import LoggerData,Channel,ChannelField,Feed

import json

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

class ContactView(TemplateView):
    template_name = "contact.html"
        
        
def page_not_found_view(request):
    args = {}
    args['url'] = '/'
    return render("404.html", args)
    
def page_not_found_view(request):
    args = {}
    args['url'] = '/'
    return render("500.html", args)
    
def email(request):
    args = {}
    if request.method == "POST":
        recipient  = request.POST.get('recipient',None)
        name  = request.POST.get('name',None)
        email  = request.POST.get('email',None)
        subject  = request.POST.get('subject',None)
        message  = request.POST.get('message',None)
        
        status = False
        if message != None and name != None:
            #Check who the email is intended for
            if recipient == "All":
                er = EmailRecipeint.objects.all()
                for item in er:
                    html_message = create_email_message(item,email,subject)
            else:
                er = EmailRecipient.objects.filter(role = recipient)
                if er:
                    html_message = create_email_message(er[0],email,subject)
                    
            #Create the html message to be sent via email
            status = send_email(html_message,recipient,email)

        if status:
            args['success_message'] = "Success! We have received your email and will respond ASAP. "
        else:
            args['error_message'] = "Error! An error occured. Please try again. "
            
        return render(request, 'contact.html', args)
    else:
        return HttpResponseRedirect(reverse('visual:email'))

def create_email_message(recipient,email,subject):
    name_upper = recipient.name[0].upper() + recipient.name[1:len(name)]
    subject, from_email = Subject,email
    text_content = 'This is an important message.'
    html_content = "From: MaMaSe Website<website@mamase.org>" 
    html_content = html_content + "\nTo:" + recipient.email
    html_content = html_content + "\nMIME-Version: 1.0"
    html_content = html_content + "\nContent-type: text/html"
    html_content = html_content + "\nSubject: [MaMaSe Website] " + subject
    html_content = html_content + "\n\n"
    html_content = html_content + "Hi " + name_upper + ",<br><br>"
    html_content = html_content + "You have received mail from the website!<br>"
    html_content = html_content + "From: "+email
    html_content = html_content + "<br>Message Content:" + message
    html_content = html_content + '<br><br>'
    html_content = html_content + 'Yours truly,<br>'
    html_content = html_content + 'The Upande Team.'
    
    return html_content
