import urllib.request as urllib
import json
import pymongo
 
url = 'https://raw.githubusercontent.com/kirkchu/mongodb/main/aqi.json'
 
# 下載 JSON 資料並解析
response = urllib.urlopen(url)
text = response.read().decode('utf-8')
print(text)
text = text.replace('PM2.5', 'PM2_5')
text = text.replace('"AQI": ""', '"AQI": "-1"')
jsonObj = json.loads(text)
 
# 將資料存進opendata資料庫中的AQI資料表
client = pymongo.MongoClient()
db = client.opendata
db.AQI.insert_many(jsonObj['records'])
