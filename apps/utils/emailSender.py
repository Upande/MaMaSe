from django.core.mail import EmailMessage

def send_email(html_content,from_email,to,subject):
#try:
    email = EmailMessage(subject, html_content,from_email,to=to)
    email.send(fail_silently=False)
    return True
    #except:
    #    return False
