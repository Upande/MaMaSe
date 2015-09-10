from apps.utils.models import Channel,Feeds

import requests

def getAPIData(url):
    r = requests.get(url)
    data = json.dumps(r.text)
    if r.status_code == 200:
            return data
    else:
            return False

def getChannel():
    url = "http://api.thingspeak.com/channels/public.json?tag=mamase"
    
    data  = getAPIData(url)
    
    if not data:
        return
        
    channels = data['channels']
    
    
    for item in channels:
        c = Channel.objects.get_or_create(        
            c.data_id = item['id'],
            defaults={dict(c.username = item['username'],
                           c.elevation = item['elevation'],
                           c.description = item['description'],
                           c.name = item['name'],
                           c.longitude = item['longitude'],
                           c.latitude = item['latitude'],
                           c.created_at = item['created_at'],
                           c.last_entry_id = item['last_entry_id'],
                       )}
        }
        
            
def parseAPIContent():
    data_ids = Channel.objects.all().values_list('data_id',flat=True)
    
    for item in data_ids:
        getFeedData(item)

def getFeedData(data_id):
    url = "https://thingspeak.com/channels/"+data_id+"/feed.json"
    data = getAPIData(url)
    
    if not data:
        return
                
    ch = data['channel']
    feeds = data['feeds']
    
    channel = Channel.object.get(data_id=data_id)
    #Gotta find more efficient way of doing this
    channel.field1 = ch.get("field1","")
    channel.field2 = ch.get("field2","")
    channel.field3 = ch.get("field3","")
    channel.field4 = ch.get("field4","")
    channel.field5 = ch.get("field5","")
    channel.field6 = ch.get("field6","")
    channel.field7 = ch.get("field7","")
    channel.field8 = ch.get("field8","")
    channel.save()
    
    for item in feeds:
        f = Feed.objects.get_or_create(        
            f.entry_id = item['entry_id'],
            defaults={dict(f.channel = channel,
                           f.field1 = item.get('field1',None),
                           f.field2 = item.get('field2',None),
                           f.field3 = item.get('field3',None),
                           f.field4 = item.get('field4',None),
                           f.field5 = item.get('field5',None),
                           f.field6 = item.get('field6',None),
                           f.field7 = item.get('field7',None),
                           f.field8 = item.get('field8',None),
                       )}
        }
        
        
