import pymongo
from pprint import pprint

DATABASE = ''
COLLECTION = ''

client = pymongo.MongoClient()
db = client[DATABASE]

pipeline = []

docs = db[COLLECTION].aggregate(pipeline)
pprint(list(docs))
