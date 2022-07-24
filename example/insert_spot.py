import urllib.request as urllib
import json
import pymongo

r = urllib.urlopen('https://gis.taiwan.net.tw/XMLReleaseALL_public/scenic_spot_C_f.json')
jsonObj = json.load(r)

client = pymongo.MongoClient()
db = client.turist

for p in jsonObj["XML_Head"]["Infos"]["Info"]:
    geometry = {
        "type": "Point",
        "coordinates": [p["Px"], p["Py"]]
    }

    p["Geometry"] = geometry
    db.spot.insert_one(p)
    

    
