import datetime

from django.core.urlresolvers import reverse
from django.test import TestCase
from django.test import Client

from .models import *
from .views import *

CHANNEL1 = "channel1"
CHANNEL2 = "channel2"

FIELD1 = "rain"
FIELD2 = "temparature"

CHANNELFIELD1 = "field1"
CHANNELFIELD2 = "field2"
CHANNELFIELD3 = "field3"
CHANNELFIELD4 = "field4"

RIVER1 = "Mara River"
RIVER2 = "Nyangores"


# Testing creation of database tables
class TestDatabase(TestCase):
    def setUp(self):
        self.setupRiver()
        self.setupChannel()
        self.setupField()
        self.setupChannelField()

    def setupRiver(self):
        self.r1 = River.objects.create(name=RIVER1)
        self.r2 = River.objects.create(name=RIVER2)

    def setupChannel(self):
        self.c1 = Channel.objects.create(data_id=1, name=CHANNEL1,
                                         description="channel one",
                                         latitude="1.234",
                                         longitude="36.345",
                                         created_at=datetime.datetime.now(),
                                         elevation=1.2,
                                         river=self.r1)

        self.c2 = Channel.objects.create(data_id=2, name=CHANNEL2,
                                         description="channel two", latitude="1.5234",
                                         longitude="36.1345",
                                         created_at=datetime.datetime.now(),
                                         elevation=2.5,
                                         river=self.r2)

    def setupField(self):
        self.f1 = Field.objects.create(name=FIELD1)
        self.f2 = Field.objects.create(name=FIELD2)

    def setupChannelField(self):
        self.cf1 = ChannelField.objects.create(channel=self.c1, field=self.f1,
                                               name=CHANNELFIELD1)
        self.cf2 = ChannelField.objects.create(channel=self.c1, field=self.f2,
                                               name=CHANNELFIELD2)
        self.cf3 = ChannelField.objects.create(channel=self.c2, field=self.f1,
                                               name=CHANNELFIELD3)
        self.cf4 = ChannelField.objects.create(channel=self.c2, field=self.f2,
                                               name=CHANNELFIELD4)

    def testRiverCreation(self):
        r1 = River.objects.get(name=RIVER1)
        r2 = River.objects.get(name=RIVER2)

        self.assertEqual(r1.name, RIVER1)
        self.assertEqual(r2.name, RIVER2)

    def testChannelCreation(self):
        c1 = Channel.objects.get(name=CHANNEL1)
        c2 = Channel.objects.get(name=CHANNEL2)

        self.assertEqual(c1.description, 'channel one')
        self.assertEqual(c2.description, 'channel two')

    def testFieldCreation(self):
        f1 = Field.objects.get(name=FIELD1)
        f2 = Field.objects.get(name=FIELD2)

        self.assertEqual(f1.name, FIELD1)
        self.assertEqual(f2.name, FIELD2)

    def testChannelFieldCreation(self):
        cf1 = ChannelField.objects.get(name=CHANNELFIELD1)
        cf3 = ChannelField.objects.get(name=CHANNELFIELD3)

        self.assertEqual(cf1.name, CHANNELFIELD1)
        self.assertEqual(cf3.name, CHANNELFIELD3)


class TestURLs(TestCase):
    def setUp(self):
        self.client = Client()

    def testAPI(self):
        response = self.client.get(reverse('api_feed'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('visual'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('chart'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('channel_data'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('api_all'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('contact-us'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('projectman'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('about'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('feed_data'))
        self.assertEqual(response.status_code, 200)

        response = self.client.get(reverse('email'))
        self.assertEqual(response.status_code, 302)

#Test pulling data
#Test aggregation
#Test feeds
#Test URLs
