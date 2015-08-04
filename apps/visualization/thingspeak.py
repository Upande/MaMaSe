import requests

def getAPIData(url):
    r = requests.get(url)
    return r

def parseAPIContent():
    url = "https://thingspeak.com/channels/28006/feed.json"
    js = getAPIData(url)
    

    if js.status_code == 200:
        # means the request was successful
        print js.text
    else:
        js.status_code
        js.text
        
    return js
