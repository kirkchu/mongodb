import pymongo
import gridfs

filename = 'FILENAME'

client = pymongo.MongoClient()
db = client.test
fs = gridfs.GridFS(db)

with open(filename, 'rb') as f:
    fs.put(f, filename=filename)
