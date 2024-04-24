from pymongo import MongoClient
from datetime import datetime, timezone, timedelta
from collections.abc import Iterable

client = MongoClient('localhost', 27017)
db = client['lab']  # 替换为你的数据库名
coll_time_range = db['time_range']  # 替换为你的集合名
coll_reports = db['reports']  # 替换为你的集合名

date_format = '%Y-%m-%d %H:%M:%S'


def to_datetime(date_string):
    date_time_object = datetime.strptime(date_string, date_format)
    # print(date_time_object)
    return date_time_object


def add_minute(dt, minute):
    res = datetime.now(timezone.utc) + timedelta(minutes=minute)
    if dt is not None:
        res = dt + timedelta(minutes=minute)
    return res


def time_range_create():
    coll_time_range.drop();
    rows = [
        {"num_id": "1", "start_at": to_datetime("2024-02-24 16:00:00"), "end_at": to_datetime("2024-02-24 16:20:00")},
        {"num_id": "2", "start_at": to_datetime("2024-02-24 16:30:00"), "end_at": to_datetime("2024-02-24 16:49:00")},
        {"num_id": "3", "start_at": to_datetime("2024-02-24 16:50:00"), "end_at": to_datetime("2024-02-24 16:59:00")}]
    coll_time_range.insert_many(rows)

# time_range_create()

def lab_image_to_datetime(file_path):
    file_name = file_path.split('/')[-1].split('.')[0]
    file_name = file_name[1:-2]  # 去掉P 去掉末尾的00 10
    date_format_lab_image = "%y%m%d%H%M%S"
    date_time_object = datetime.strptime(file_name, date_format_lab_image)
    return date_time_object


# 查询函数
def query_records_for_file_path(file_path):
    datetime_obj = lab_image_to_datetime(file_path)
    to_format_time = datetime_obj.strftime(date_format)

    query = {
        "$and": [
            {"start_at": {"$lte": datetime_obj}},
            {"end_at": {"$gte": datetime_obj}}
        ]
    }
    result = coll_reports.find_one(query)
    return {"file_path": file_path, "file_time_str": to_format_time, "row": result}


# print(query_records_for_file(file_paths[-1]))


file_paths = [
    "1_1/20240224/images/P24022416301510.jpg",
    "1_1/20240224/images/P24022416164610.jpg",
    "1_1/20240224/images/P24022416501510.jpg",
    "1_1/20240224/images/P24022516501510.jpg",  ## 没有的数据 以后可以redis存储当日的 增加缓存
    "1_1/20240224/images/P24022616501510.jpg",  ## 没有的数据
]

# results = [query_records_for_file_path(file_path) for file_path in file_paths]
# #
# # # 输出结果
# for result in results:
#     print(
#         result['file_path'],
#         result['file_time_str'],
#         result['row'] and result['row']["start_at"],
#         result['row'] and result['row']["end_at"]
#     )
