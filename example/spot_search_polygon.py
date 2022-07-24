import pymongo
from pprint import pprint

client = pymongo.MongoClient()
db = client.turist

cursor = db.spot.find({ 
    'Geometry': {
        '$geoWithin': { 
            '$polygon': [
				[
				  121.71890258789062,
				  24.80169495167004
				],
				[
				  121.68663024902344,
				  24.737477121581474
				],
				[
				  121.7449951171875,
				  24.749325626697196
				],
				[
				  121.76971435546874,
				  24.70753902792815
				],
				[
				  121.81022644042969,
				  24.748702049318666
				],
				[
				  121.71890258789062,
				  24.80169495167004
				]
          	]
        } 
    }
}, {'Name': 1, 'Add': 1, '_id': 0})

pprint(list(cursor))
