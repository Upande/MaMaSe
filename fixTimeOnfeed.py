import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()

from apps.utils.thingspeak import parseAPIContent
from apps.utils.models import Feed,Channel

def fix():
    Feed.objects.all().delete()
    print "Deleted Feeds. Moving on to channel"
    Channel.objects.all().delete()
    print "Channel deletion done. Now reading data"
        
    parseAPIContent()

if  __name__ == "__main__":
    fix()
