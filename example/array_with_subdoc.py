import pymongo

client = pymongo.MongoClient()
db = client.test

db.course.drop()
db.course.insert_many([
    {
        'student': 'S1',
        'courseList': [
            { 'title': '機率', 'score': 80 }, 
            { 'title': '音樂欣賞', 'score': 70 }
        ]
    },
    {
        'student': 'S2',
        'courseList': [
            { 'title': '物理', 'score': 85 }, 
            { 'title': '機率', 'score': 70 },
            { 'title': '音樂欣賞', 'score': 50 }
        ]
    },
    {
        'student': 'S3',
        'courseList': [
            { 'title': '物理', 'score': 50 },
            { 'title': '音樂欣賞', 'score': 70 }
        ]
    },
    {
        'student': 'S4',
        'courseList': [
            { 'title': '微積分', 'score': 80 }, 
            { 'title': '電子學', 'score': 80 }
        ]
    }
])
