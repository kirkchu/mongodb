import pymongo

client = pymongo.MongoClient()
db = client.test

db.course.drop()
db.course.insert_many([
    {
        'student': 'S1',
        'courseList': ['機率', '音樂欣賞']
    },
    {
        'student': 'S2',
        'courseList': ['物理', '機率', '音樂欣賞']
    },
    {
        'student': 'S3',
        'courseList': ['物理', '音樂欣賞']
    },
    {
        'student': 'S4',
        'courseList': ['微積分', '電子學']
    }
])
