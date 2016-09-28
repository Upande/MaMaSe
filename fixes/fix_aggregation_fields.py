import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()

from apps.utils.models import Field
from apps.utils.api import (aggregateDailyFeedData, aggregateMonthlyFeedData,
                            createAggregateDailyData, createAggregateMonthlyData)

search_fields = ['rain', 'pressure', 'wind speed', 'wind direction',
                 'moisture', 'humidity']  # Ignore temp for now. The keys words used to search

station_type = ''
complexargs = {}
excludeargs = {}
kwargs = {}


#Aggregate on all and store on all. Makes it easier despite the value checked
def fix(field):
    fields = Field.objects.filter(name__icontains=field)
    print "Found all similar fields for " + field

    for item in fields:
        kwargs['channelfield__field_id'] = fields.values_list('id', flat=True)
        print kwargs
        mdata = aggregateMonthlyFeedData(station_type, kwargs, complexargs, excludeargs)
        ddata = aggregateDailyFeedData(station_type, kwargs, complexargs, excludeargs)

        createAggregateDailyData(ddata, item)
        createAggregateMonthlyData(mdata, item)

    print "all done"

if __name__ == "__main__":
    for item in search_fields:
        print "Now fixing " + item
        fix(item)
