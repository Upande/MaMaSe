from django.core.mail import send_mail
from django.conf import settings

#from utils.models import Email


def send_email(html_content, from_email, to, subject):
    send_mail(subject, html_content, from_email, to, fail_silently=False)
    return True


def test():
    subject = "Thanks you for testing"
    message = "Thank you for your email which confirms it works"
    email = settings.EMAIL_HOST_USER
    to_list = ['samuel@upande.com']

    send_mail(subject, message, email, to_list, fail_silently=False)

if __name__ == "__main__":
    # execute only if run as a script
    import os
    import django

    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mamase.settings')
    django.setup()

    test()
