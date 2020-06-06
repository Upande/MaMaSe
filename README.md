# MaMaSe

## Installation for Dev. For production we are using third party paid apps
Run the following commands
 - `sudo bash util/elastic.sh`
 - `sudo bash util/rabbit.sh`
 - `pip install -r requirements.txt`

## For use of the API
     To pull the data via the API, you can use the following url and it shall return a json string

     {{DOMAIN_NAME e.g mamase.org,localhost}}/mamase/api/feed/
     		    
     GET Parameters:		
        - channel (ID of specific channel)		
     	- start (Start date when filtering) 		
     	- end (end date when filtering)
     	- limit (Limit number of records returned by API)
	- data (Type of data. Either raw, daily or monthly

