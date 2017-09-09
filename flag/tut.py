import urllib2


for i in range(0,1000):
    url = "http://192.168.50.6:30816?index1.php?id=%d" % i
    print "Output id: %d len: %d" % (i, len(urllib2.urlopen(url).read()))

