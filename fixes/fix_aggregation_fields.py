import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()

from apps.utils.models import Field, Channel, ChannelField
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

    channels = Channel.objects.all()

    for item in fields:
        #Do a loop for each channel
        for channel in channels:
            #Get all channel fields for this channel
            cfs = ChannelField.objects.filter(channel=channel, field=item)
            print cfs
            for channelfield in cfs:
                #Too many nested loops
                kwargs['channelfield__in'] = cfs
                ddata = aggregateDailyFeedData(station_type, kwargs, complexargs, excludeargs)
                mdata = aggregateMonthlyFeedData(station_type, kwargs, complexargs, excludeargs)

                createAggregateDailyData(ddata, channelfield)
                createAggregateMonthlyData(mdata, channelfield)

        print "done with channel " + channel.name
    print "all done"

if __name__ == "__main__":
    for item in search_fields:
        print "Now fixing " + item
        fix(item)
