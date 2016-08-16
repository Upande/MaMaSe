import json

from django.shortcuts import (render,
                              render_to_response,
                              RequestContext,
                              redirect)
from django.http import JsonResponse, HttpResponseRedirect, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.generic.base import TemplateView
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.core.urlresolvers import reverse
from django.contrib.messages import error, info
from django.conf import settings


from .models import LoggerData, Channel, Feed, EmailRecipient, Email
from .emailSender import send_email
from . import thingspeak

from rest_framework.renderers import JSONRenderer
from visualcaptcha import Captcha, Session


def logThingspeakData(request):
    data = thingspeak.parseAPIContent()

    l = LoggerData(raw_data=data)

    results = json.loads(data.text)
    dct = results['channel']
    feeds = results['feeds']

    c, created = Channel.objects.get_or_create(
        data_id=dct.get('id'),

        defaults=dict(name=dct.get('name'),
                      description=dct['description'],
                      longitude=float(dct['longitude']),
                      latitide=float(dct['latitude']),
                      created_at=dct['created_at'],
                      updated_at=dct['updated_at'],
                      elevation=dct['elevation'],
                      last_entry_id=dct['last_entry_id'],
                      )
    )

    l.save()

    #Need to find a scalable way to do this
    if not c:
        return

    for item in dct:
        if "field" in item:
            cf = ChannelField(tag=item, field=dct[item], channel=c)
            cf.save()

    for item in feeds:
        f = Feed.objects.get_or_create(
            entry_id=item.get('entry_id'),
            defaults=dict(
                created_at=item.get('created_at'),
                channel=c,
            )
        )

    return JsonResponse(results)


class IndexView(TemplateView):
    template_name = "visual.html"


class ChartView(TemplateView):
    template_name = "chart.html"


class MapView(TemplateView):
    template_name = "map_test.html"


class AboutView(TemplateView):
    template_name = "about.html"


class ProjectManView(TemplateView):
    template_name = "projectman.html"


class ContactView(TemplateView):
    template_name = "contact.html"


class RainTempView(TemplateView):
    template_name = "chartRT.html"
        

def error_view(request):
    return render(request, "500.html")


def page_not_found_view(request):
    return render(request, "404.html")


def email(request):
    if request.method == "POST":
        name = request.POST.get('name', None)
        email = request.POST.get('email', None)
        subject = request.POST.get('subject', None)
        message = request.POST.get('message', None)

        status = False
        html_message = ""

        try:
            validate_email(email)
        except ValidationError:
            error(request, "Email address not valid!")
            return HttpResponseRedirect(reverse('contact-us'))
        if message is not None and name is not None:
            #Check who the email is intended for
            sent_email = Email(sender=name, email=email, subject=subject,
                               message=message)
            sent_email.save()

            er = EmailRecipient.objects.all()

            to_list = er.values_list('email', flat=True)

            html_message = create_email_message(email, message, name)

            #Create the html message to be sent via email
            status = send_email(html_message, settings.EMAIL_HOST_USER,
                                to_list, subject)

        if status:
            info(request, "Success! We have received your email and will respond ASAP.")
        else:
            error(request, "An error occurned. Please try again.")

        return HttpResponseRedirect(reverse('contact-us'))
    else:
        return HttpResponseRedirect(reverse('contact-us'))


def create_email_message(email, message, name):
    html_content = "Hello, \n\n"
    html_content = html_content + "You have received mail from the website.\n\n"
    html_content = html_content + "From: "+email
    html_content = html_content + "\nName: "+name
    html_content = html_content + "\nMessage: " + message
    html_content = html_content + '\n\n'
    html_content = html_content + 'Yours truly,\n\n'
    html_content = html_content + 'The Upande Team.'

    return html_content


def knowledge(request):
    return render_to_response('knowledge_platform.html', locals(),
                              context_instance=RequestContext(request))


def start(request, howMany):
    visualCaptcha = Captcha(Session(request.session))

    visualCaptcha.generate(howMany)
    jsonFrontendData = JSONRenderer().render(visualCaptcha.getFrontendData())
    response = HttpResponse(content=jsonFrontendData)
    response['Access-Control-Allow-Origin'] = '*'

    return response


def getImage(request, index):
    visualCaptcha = Captcha(Session(request.session))

    headers = {}
    result = visualCaptcha.streamImage(
        headers, index, request.GET.get('retina'))

    if result is False:
        return HttpResponse(result, headers, 404)

    return HttpResponse(result, headers)


def getAudio(request, audioType='mp3'):
    visualCaptcha = Captcha(Session(request.session))

    headers = {}
    result = visualCaptcha.streamAudio(headers, audioType)

    if result is False:
        return HttpResponse(result, headers, 404)

    return HttpResponse(result, headers)


@csrf_exempt
def trySubmission(request):
    visualCaptcha = Captcha(Session(request.session))

    frontendData = visualCaptcha.getFrontendData()

    # If an image field name was submitted, try to validate it
    if request.POST.get(frontendData['imageFieldName'], None) is not None:
        if visualCaptcha.validateImage(request.POST[frontendData['imageFieldName']]):

            name = request.POST.get('name', None)
            email = request.POST.get('email', None)
            subject = request.POST.get('subject', None)
            message = request.POST.get('message', None)

            status = False
            html_message = ""

            try:
                validate_email(email)
            except ValidationError:
                error(request, "Email address not valid!")
                return HttpResponseRedirect(reverse('contact-us'))
            if message is not None and name is not None:
            #Check who the email is intended for
                sent_email = Email(sender=name, email=email,
                                   subject=subject, message=message)
                sent_email.save()

                er = EmailRecipient.objects.all()

                to_list = er.values_list('email', flat=True)

                html_message = create_email_message(email, message, name)

            #Create the html message to be sent via email
                status = send_email(html_message, settings.EMAIL_HOST_USER,
                                    to_list, subject)

                if status:
                    info(request, "Success! We have received your email and will respond ASAP.")
                else:
                    error(request, "An error occurned. Please try again.")

                return HttpResponseRedirect(reverse('contact-us'))
            else:
                error(request, 'Please fill in all the fields')
                return HttpResponseRedirect(reverse('contact-us'))

            #response = HttpResponse(status=200)
            #return redirect('/mamase/contact/?status=validImage')
        else:
            response = HttpResponse(status=403)
            return redirect('/mamase/contact/?status=failedImage')
    elif request.POST.get(frontendData['audioFieldName'], None) is not None:
        # We set lowercase to allow case-insensitivity , but it's
        # actually optional
        if visualCaptcha.validateAudio(request.POST[frontendData['audioFieldName']].lower()):
            name = request.POST.get('name', None)
            email = request.POST.get('email', None)
            subject = request.POST.get('subject', None)
            message = request.POST.get('message', None)

            status = False
            html_message = ""

            try:
                validate_email(email)
            except ValidationError:
                error(request, "Email address not valid!")
                return HttpResponseRedirect(reverse('contact-us'))
            if message is not None and name is not None:
            #Check who the email is intended for
                sent_email = Email(sender=name, email=email, subject=subject,
                                   message=message)
                sent_email.save()

                er = EmailRecipient.objects.all()

                to_list = er.values_list('email', flat=True)

                html_message = create_email_message(email, message, name)

                #Create the html message to be sent via email
                status = send_email(html_message, settings.EMAIL_HOST_USER,
                                    to_list, subject)

                if status:
                    info(request, "Success! We have received your email and will respond ASAP.")
                else:
                    error(request, "An error occurned. Please try again.")

                return HttpResponseRedirect(reverse('contact-us'))
            else:
                error(request, 'Please fill in all the fields')
                return HttpResponseRedirect(reverse('contact-us'))

            #response = HttpResponse(status=200)
            #return redirect('/mamase/contact/?status=validAudio')
        else:
            response = HttpResponse(status=403)
            return redirect('/mamase/contact/?status=failedAudio')
    else:
        response = HttpResponse(status=500)
        return redirect('/mamase/contact/?status=failedPost')

    return response
