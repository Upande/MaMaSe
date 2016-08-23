import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()

from apps.utils.models import Feed
from apps.utils.thingspeak import checkIfFloat


def fix():
    feeds = Feed.objects.exclude(sreading__isnull=True)
    print "Found all feeds with sreading"

    for item in feeds:
        reading = checkIfFloat(item.sreading)
        if reading:
            print reading
            item.reading = reading
            item.save()
    print "all done"

if __name__ == "__main__":
    fix()
