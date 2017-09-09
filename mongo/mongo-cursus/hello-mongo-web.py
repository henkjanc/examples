import bottle
import pymongo
from pymongo import MongoClient


@bottle.route('/')
def index():
	person = db.person
	item = person.find_one()
	return '<b>Hello %s!</b>' % item['name']

@bottle.route('/test')
def test():
	return 'This is a test'



connection = MongoClient( 'localhost',27017 )
db = connection.test
bottle.run(host='localhost',port=8082)
