import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()

from apps.utils.models import Channel, River
from apps.utils.thingspeak import checkIfRiver


def fix():
    channels = Channel.objects.all()
    print "Found channels"

    for item in channels:
        river = checkIfRiver(item.name)
        if river:
            print river
            r, created = River.objects.get_or_create(name=river)
            item.river_id = r.id
            item.save()
    print "all done"

if __name__ == "__main__":
    fix()
