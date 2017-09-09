import urllib2
import requests
i="3"
url = "http://192.168.50.6:30816/ijustdidmyfirstsqlinjection.php"
r = requests.post(url, data = {'id':i})
print r.content

