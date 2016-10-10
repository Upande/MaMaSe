import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()

from apps.utils.models import AggregateMonthlyFeed, AggregateDailyFeed


def fix():
    amf = AggregateMonthlyFeed.objects.all()
    adf = AggregateDailyFeed.objects.all()
    print "Gotten all aggregated feeds both daily and monthly"

    for item in amf:
        print item.data
        if type(item.data) == list:
            try:
                item.data[0]
                item.data = item.data[0]
                item.save()
            except:
                pass

    print "Done cleaning monthly data"

    for item in adf:
        print item.data
        if type(item.data) == list:
            try:
                item.data[0]
                item.data = item.data[0]
                item.save()
            except:
                    pass

    print "Done cleaning. Check data"

if __name__ == "__main__":
    fix()
