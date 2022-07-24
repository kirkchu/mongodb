import pymongo
from datetime import datetime

client = pymongo.MongoClient()
db = client.test

db.product.drop()
db.product.insert_one({'price': 100, 'date': datetime(2021,1,5,0,0,0)})
db.product.insert_one({'price': 200, 'date': datetime(2021,2,5,0,0,0)})
db.product.insert_one({'price': 200, 'date': datetime(2021,3,5,0,0,0)})
db.product.insert_one({'price': 600, 'date': datetime(2021,7,5,0,0,0)})
db.product.insert_one({'price': 200, 'date': datetime(2021,9,5,0,0,0)})
db.product.insert_one({'price': 400, 'date': datetime(2021,11,5,0,0,0)})
db.product.insert_one({'price': 500, 'date': datetime(2022,1,5,0,0,0)})
db.product.insert_one({'price': 300, 'date': datetime(2021,2,5,0,0,0)})
db.product.insert_one({'price': 700, 'date': datetime(2022,3,5,0,0,0)})
db.product.insert_one({'price': 300, 'date': datetime(2022,4,5,0,0,0)})
db.product.insert_one({'price': 800, 'date': datetime(2022,5,5,0,0,0)})
db.product.insert_one({'price': 200, 'date': datetime(2022,6,5,0,0,0)})
db.product.insert_one({'price': 900, 'date': datetime(2022,7,5,0,0,0)})
