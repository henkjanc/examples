import urllib2
import requests
i="3"
url = "http://192.168.50.6:30114/admin.php"
r = requests.post(url, data = {'username':'admin', 'password': 'admin', 'submit': 1})
print r.content

