import datetime

from django.test import TestCase
from .models import *
from .views import *

CHANNEL1 = "channel1"
CHANNEL2 = "channel2"
FIELD1 = "rain"
FIELD2 = "temparature"
CHANNELFIELD1= "field1"
CHANNELFIELD2= "field2"
CHANNELFIELD3= "field3"
CHANNELFIELD4= "field4"

class ChannelTestCase(TestCase):
    def setUp(self):
        Channel.objects.create(data_id=1,name=CHANNEL1,
        			description="channel one",latitude = "1.234",
        			longitude="36.345",created_at = datetime.datetime.now(),
        			elevation = 1.2
        			)
        Channel.objects.create(data_id=2,name=CHANNEL2,
        			description="channel two",latitude = "1.5234",
        			longitude="36.1345",created_at = datetime.datetime.now(),
        			elevation = 2.5)

    def test_channel_saved(self):        
        c1 = Channel.objects.get(name=CHANNEL1)
        c2 = Channel.objects.get(name=CHANNEL2)
        self.assertEqual(c1.description, 'channel one')
        self.assertEqual(c2.description, 'channel two')

class FieldTestCase(TestCase):
    def setUp(self):
        Field.objects.create(name=FIELD1)
        Field.objects.create(name=FIELD2)

class ChannelFieldTestCase(TestCase):
	def setUp(self):
		c1 = Channel.objects.get(name=CHANNEL1)
        c2 = Channel.objects.get(name=CHANNEL2)

        f1 = Field.objects.get(name=FIELD1)
        f2 = Field.objects.get(name=FIELD2)

        cf1 = ChannelField.objects.create(channel = c1,field =f1, 
                                          name=CHANNELFIELD1)
        cf2 = ChannelField.objects.create(channel = c1,field =f2, 
                                          name=CHANNELFIELD2)
        cf3 = ChannelField.objects.create(channel = c2,field =f1, 
                                          name=CHANNELFIELD3)
        cf4 = ChannelField.objects.create(channel = c2,field =f2, 
                                          name=CHANNELFIELD4)


#Test pulling data
#Test aggregation
#Test feeds
#Test URLs
