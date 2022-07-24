import pymongo
from pprint import pprint

client = pymongo.MongoClient()
db = client.test

cursor = db.taiwan.find({ 
    'geometry': {
        '$geoIntersects': { 
            '$geometry': {
                'type': 'Polygon',
                'coordinates': [



       		] 
            }
        } 
    }
}, {'County': 1, '_id': 0})

pprint(list(cursor))


