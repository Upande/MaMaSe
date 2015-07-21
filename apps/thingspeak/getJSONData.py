import requests

def callURL(url):
    r = requests.get(url)
    return r

def parseJSON():
    url = "https://thingspeak.com/channels/28006/feed.json"
    js = callURL(url)
    

    if js.status_code == 200:
        #Success
        print js.text
    else:
        js.status_code
        js.text
        
    return js
