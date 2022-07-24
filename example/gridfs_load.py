import pymongo
import gridfs

filename = 'FILENAME'

client = pymongo.MongoClient()
db = client.test

fs = gridfs.GridFS(db)
file = fs.find_one({ 'filename': filename }) 
with open(file.filename, 'wb') as f:
    f.write(file.read())
