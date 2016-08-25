import requests
import json
import csv
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mamase.settings.dev")

import django
django.setup()


def getChannels():
    r = requests.get('http://api.thingspeak.com/channels/public.json?tag=mamase')
    channels = json.loads(r.text)['channels']

    channeldata = []
    for channel in channels:
        channelid = channel['id']

        cr = requests.get('https://thingspeak.com/channels/'+str(channelid)+'/feed.json')
        cr = json.loads(cr.text)['channel']
        count = 0
        rowdata = [str(channelid), channel['name']]

        print "Now checking channel " + channel['name']
        while count < 9:
            count += 1
            rowdata.append(cr.get('field'+str(count), ''))
        channeldata.append(rowdata)
    createCSV(channeldata)


def createCSV(channeldata):
    with open('channeldata.csv', 'wb') as csvfile:
        channelwriter = csv.writer(csvfile)
        channelwriter.writerows(channeldata)

if __name__ == "__main__":
    getChannels()
