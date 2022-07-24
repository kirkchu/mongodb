import pymongo
from pprint import pprint

client = pymongo.MongoClient()
db = client.turist

cursor = db.spot.find({ 
    'Geometry': {
        '$geoWithin': { 
            '$centerSphere': [
		[121.57058715820312, 23.997544384450748],
		5 / 6378.1
            ]
        } 
    }
}, {'Name': 1, 'Add': 1, '_id': 0})

pprint(list(cursor))
