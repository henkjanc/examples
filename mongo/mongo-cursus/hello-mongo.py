import pymongo


from pymongo import MongoClient

connection = MongoClient( 'localhost',27017 )

db = connection.test

person = db.person


item = person.find_one()

print item['name']


