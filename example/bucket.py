import pymongo
from pprint import pprint

DATABASE = 'opendata'
COLLECTION = 'AQI'

client = pymongo.MongoClient()
db = client[DATABASE]

pipeline = [
    {
        '$addFields': {
            'iAQI': {
                '$toInt': '$AQI'
            }
        }
    }, {
        '$bucket': {
            'groupBy': '$iAQI', 
            'boundaries': [
                0, 5, 10, 15, 20, 22, 25, 30, 1000
            ], 
            'default': 'error', 
            'output': {
                'count': {
                    '$sum': 1
                }, 
                'location': {
                    '$push': {
                        'County': '$County', 
                        'SiteName': '$SiteName', 
                        'AQI': '$AQI'
                    }
                }
            }
        }
    }, {
        '$match': {
            '_id': 20
        }
    }, {
        '$unwind': '$location'
    }, {
        '$replaceWith': '$location'
    }
]

docs = db[COLLECTION].aggregate(pipeline)
pprint(list(docs))

