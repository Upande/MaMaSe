import datetime
import random
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()

channel = 30
range_ = [10,100]


from apps.utils.models import Feed,Channel,ChannelField

def populate(e_id,date):
    chf = ChannelField.objects.filter(channel_id=channel)
    for item in chf:
        print item
        f = Feed(entry_id = e_id,
                 channelfield = item,
                 reading = random.randint(range_[0],range_[1]),
                 timestamp = date,
             )
        f.save()
    
       
if  __name__ == "__main__":
    e_id = 11
    date = datetime.datetime.now()

    for x in  range(1,10):
        populate(e_id,date)
        e_id +=1
        date = date + datetime.timedelta(hours=1)
     
