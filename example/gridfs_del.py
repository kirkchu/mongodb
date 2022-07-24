import pymongo
import gridfs

filename = 'FILENAME'

client = pymongo.MongoClient()
db = client.test
fs = gridfs.GridFS(db)
file = fs.find_one({ 'filename': filename }) 

if file is not None:
    fs.delete(file._id) 
else:
    print('"{}" not found'.format(filename))
