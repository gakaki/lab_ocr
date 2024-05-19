import io
from datetime import datetime, timedelta
import random
from collections.abc import Iterable

import PIL
from bson import ObjectId
import uvicorn
import hashlib
from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel, Field
from jose import JWTError, jwt
from datetime import datetime, timedelta, time
from passlib.context import CryptContext
from pymongo import MongoClient, ReturnDocument
from datetime import datetime, timedelta, timezone
from typing import Any, Union, List, Optional
from fastapi.middleware.gzip import GZipMiddleware
import time
from fastapi import FastAPI, File, Form, UploadFile

from fastapi.responses import StreamingResponse
from starlette.requests import Request

import time_test
from file_deal import *



# MongoDB连接配置
client = MongoClient("mongodb://root:iloveNewipad3@db:27018")
db = client["lab"]
coll_users = db["users"]
coll_reports = db["reports"]
coll_records = db["records"]

app = FastAPI()
app.add_middleware(GZipMiddleware, minimum_size=1000)

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")


@app.middleware("http")
async def add_response_calc_time_header(request, call_next):
    start_time = time.time()
    response = await call_next(request)
    process_time = time.time() - start_time
    # 添加自定义响应头
    response.headers["X-Process-Time"] = f"{process_time:.4f} seconds"
    return response


@app.middleware("http")
async def add_request_need_user_jwt(request, call_next):
    start_time = time.time()
    response = await call_next(request)
    process_time = time.time() - start_time
    # 添加自定义响应头
    response.headers["X-Process-Time"] = f"{process_time:.4f} seconds"
    return response


@app.get("/hello")
async def hello():
    return success({"data": "hello"})


def response_with_status(code: int, msg: str, data):
    response = {"code": code, "msg": msg, "data": data}
    if data is not None:
        response["data"] = data
    return response


def mongodb_id_deal(row):
    k = "_id"
    if k in row:
        row[k] = f"{row[k]}"
        del row[k]
    return row


def mongodb_id_deal_rows(rows):
    if isinstance(rows, Iterable):
        for row in rows:
            mongodb_id_deal(row)
    return rows


def success(data):
    return response_with_status(100200, "success", data)  # 100200 means success


def fail(data):
    return response_with_status(-1, "fail", data)


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")


class User(BaseModel):
    id: str = ""
    username: str = ""
    password: str = ""
    password_hash: str = ""
    lab_id: str = ""
    is_admin: str = ""
    last_login: str = ""
    access_token: str = ""
    refresh_token: str = ""
    disabled: bool = False


# 修改用户信息
@app.post("/update_user", response_model=None)
async def update_user(current_user: User = Depends(oauth2_scheme)):
    user_doc = coll_users.find_one({"username": current_user.username})
    if not user_doc:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="User not found"
        )
    # 更新用户信息，例如昵称、邮箱等
    # ...
    coll_users.update_one(
        {"username": current_user.username}, {"$set": {"nickname": "new_nickname"}}
    )
    return {"message": "User updated successfully"}


# 删除用户
@app.delete("/delete_user", response_model=None)
async def delete_user(current_user: User = Depends(oauth2_scheme)):
    user_doc = coll_users.find_one({"username": current_user.username})
    if not user_doc:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="User not found"
        )
    coll_users.delete_one({"username": current_user.username})
    return {"message": "User deleted successfully"}


# to get a string like this run:
# openssl rand -hex 32
SECRET_KEY = "09d25e094faa6ca2556c818166b7a9563b93f7099f6f0f4caa6cf63b88e8d3e7"
ALGORITHM = "HS256"
# ACCESS_TOKEN_EXPIRE_MINUTES = 60 * 24 * 20
ACCESS_TOKEN_EXPIRE_MINUTES = 60


class Token(BaseModel):
    access_token: str
    token_type: str


class TokenData(BaseModel):
    username: Union[str, None] = None


def get_user(username):
    user = coll_users.find_one({"username": username})
    if user is None:
        return None
    user = User(**user)
    return user


def authenticate_user(username: str, password: str):
    user = get_user(username)

    if user:
        verify_password = pwd_context.verify(password, user.password_hash)
        if verify_password:  # 时间判断什么的
            return user  # 返回用户信息
        else:  # 密码错误有user 但是密码不对 那返回空 密码错误
            return False
    else:  # 用户不存在 create
        password_hash = pwd_context.hash(password)
        user = User()
        user.username = username
        user.password = password
        user.password_hash = password_hash
        # user._id = ObjectId()
        user_hashmap = user.dict()
        inserted_id = coll_users.insert_one(user_hashmap)
        user._id = f'{inserted_id}'
        return user


def create_access_token(data: dict, expires_delta: Union[timedelta, None] = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.now(timezone.utc) + expires_delta
    else:
        expire = datetime.now(timezone.utc) + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


credentials_exception = HTTPException(
    status_code=status.HTTP_401_UNAUTHORIZED,
    detail="Could not validate credentials",
    headers={"WWW-Authenticate": "Bearer"},
)


async def get_current_user(token: str = Depends(oauth2_scheme)):
    token_user_name = await get_current_user_name(token)
    user = get_user(username=token_user_name)
    if user is None:
        raise credentials_exception
    return user


async def get_current_user_name(token: str = Depends(oauth2_scheme)):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
        token_data = TokenData(username=username)
        return token_data.username
    except JWTError:
        raise credentials_exception


class Item(BaseModel):
    id: str = Field(alias="_id", default=None)
    camera_id: str = ""
    device_name: str = ""
    username: str = ""
    pic: str = ""
    metrics: Optional[float] = None
    result: str = ""
    remarks: str = ""
    start_at: str = ""
    end_at: str = ""

    class Config:
        from_attributes = True  # 允许模型直接返回字典


# formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

def current_datetime(add_minute: int = 0):
    my_date = datetime.now()  # 获取当前时间
    if add_minute is not None:
        my_date = my_date + timedelta(minutes=add_minute)
    return my_date

@app.get("/")
async def hello():
    return success("hello world")
# 开始
@app.post("/experimental_report_lists/start")
async def experimental_report_lists(item: Item, token: str = Depends(oauth2_scheme)):
    user = await get_current_user(token)
    report = item.dict()
    report['username'] = user.dict()['username']
    if not is_valid_string(report['start_at']):
        report['start_at'] = current_datetime()
        report['end_at'] = current_datetime(25)

    coll_reports.insert_one(report)
    return success(report)


# 结束
@app.post("/experimental_report_lists/end")
async def experimental_report_lists(item: dict, token: str = Depends(oauth2_scheme)):
    user = await get_current_user(token)
    query = {"_id": ObjectId(item["id"])}
    update = {'$set': {'end_at': current_datetime()}}
    report = coll_reports.find_one_and_update(query, update, return_document=ReturnDocument.AFTER)
    return success(report)


@app.get("/experimental_report_lists/{device_name}")
async def experimental_report_lists(device_name: str, token: str = Depends(oauth2_scheme)):
    token_user_name = await get_current_user_name(token)
    reports = coll_reports.find({"device_name": device_name}).to_list()
    return success(reports)


async def get_current_active_user(current_user: User = Depends(get_current_user)):
    if current_user.disabled:
        raise HTTPException(status_code=400, detail="Inactive user")
    return current_user


@app.post("/token")
async def login_for_access_token(
        form_data: OAuth2PasswordRequestForm = Depends(),
):
    user = authenticate_user(form_data.username, form_data.password)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )
    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        data={"sub": user.username}, expires_delta=access_token_expires
    )
    token_dict = Token(access_token=access_token, token_type="bearer").dict()
    res = success(token_dict)
    return res


@app.get("/users/me/", response_model=User)
async def read_users_me(current_user: User = Depends(get_current_active_user)):
    return success(current_user)


@app.get("/users/me/items/")
async def read_own_items(current_user: User = Depends(get_current_active_user)):
    return success([{"item_id": "Foo", "owner": current_user.username}])


import oss2
import pillow_avif

auth = oss2.Auth(ACCESS_KEY_ID, ACCESS_KEY_SECRET)
bucket = oss2.Bucket(auth, ENDPOINT, BUCKET_NAME)


@app.post("/images")
async def read_image(item: dict):
    try:
        # 获取文件内容
        blob = bucket.get_object(item["file_path"])
        if blob:
            # 读取文件内容到内存
            content = blob.read()
            image_file = io.BytesIO(content)
            # image = PIL.Image.open(image_file)
            return StreamingResponse(content=image_file, media_type="image/webp")  # image/avif
        else:
            raise HTTPException(status_code=404, detail="File not found")
    except oss2.exceptions.OssError as e:
        raise HTTPException(status_code=500, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/upload/")
async def upload_image(
        file: bytes = File(),
        file_path: str = Form()
):
    try:
        print(file_path)
        image_file = io.BytesIO(file)
        image = PIL.Image.open(image_file)
        f = io.BytesIO()
        image.save(f, format='WEBP')  # AVIF
        # image.save(f, format='AVIF')
        f.seek(0)
        bucket.put_object(file_path, f)
        return success({file_path})

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


# 假设我们有一个函数来验证Token中的特定字符串
def check_token_for_string(token: str, expected_string: str) -> bool:
    return expected_string in token


# 自定义依赖项，用于检查Token
async def verify_token(request: Request, expected_string: str = "abdaer37641$%^#$%^E%^$&%"):
    # 获取Bearer Token
    authorization_header = request.headers.get("Authorization")
    if authorization_header is None or expected_string not in authorization_header:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Authorization header must be a Bearer token",
            headers={"WWW-Authenticate": "Bearer"},
        )
    else:
        return True


@app.post("/experiment/valid_range")
async def experiment_valid_range(item: dict, isAllow: bool = Depends(verify_token)):
    if isAllow is True and item is not None:
        if "file_path" in item:
            file_path = item["file_path"]
            res = time_test.query_records_for_file_path(file_path)
            if res['row'] is None:  # 说明在实验范围外不管他 但暂时不能删除 可能只是没有创建实验时间范围 2 3个月后吧
                print("no experiment time range found", res['file_time_str'])
                return fail(None)
            else:  # 在时间范围内,那说明需要上传到oss
                return success(res['row'])
    return fail(None)


@app.post("/records/upload")
async def records_upload(item: dict, isAllow: bool = Depends(verify_token)):
    if isAllow is True and item is not None:
        if "file_path" in item:
            item['created_at'] = datetime.now()
            item['file_time'] = time_test.lab_image_to_datetime(item['file_path'])
            res = coll_records.insert_one(item)
            item['_id'] = res.inserted_id
            return success(item)
    return fail(None)


def is_valid_string(s):
    return s is not None and s.strip() != ""


@app.post("/records")
async def records(item: dict, isAllow: bool = Depends(verify_token)):
    return_obj = {
        'rows': [],
        'length': 0,
        'chart': {}
    }

    start_at = item.get('start_at', None)
    end_at = item.get('end_at', None)
    detect_value_num = item.get('detect_value_num', 60)

    if is_valid_string(start_at) and is_valid_string(end_at):
        query = {
            "$and": [
                {"file_time": {"$lte": time_test.to_datetime(end_at)}},
                {"file_time": {"$gte": time_test.to_datetime(start_at)}}
            ]
        }
        cursor = coll_records.find(query)
        rows = list(cursor)

        return_obj['rows'] = mongodb_id_deal_rows(rows)
        return_obj['length'] = len(rows)

        def pv_filter_fun(row):
            res = row["ocr"]["pv"] < detect_value_num
            return res

        total_row_length = len(rows)

        pv_rows_fail = list(filter(lambda row: pv_filter_fun(row), return_obj['rows']))
        ration_fail = len(pv_rows_fail) / total_row_length * 100
        ration_ok = 100 - ration_fail

        return_obj['chart'] = [
            {
                "ratio": ration_ok,
                "type": "right",
            },
            {
                "ratio": ration_fail,
                "type": "error",
            }
        ]

        return success(return_obj)
    else:
        return success(return_obj)


def get_data_hour_00_start(dt: datetime):
    if dt is not None:
        now = dt
    else:
        now = datetime.now()
    minutes = now.minute
    if minutes != 0:
        now = now - timedelta(minutes=minutes)
    return now




@app.get("/records")
async def records():
    cursor = coll_records.find({},{ "limit": 2})
    rows = list(cursor)
    rows = mongodb_id_deal_rows(rows)
    return success(rows)

@app.get("/records/mock")
async def records_mock():
    rows = []
    start_at = get_data_hour_00_start(datetime.now())
    end_at = time_test.add_minute(start_at, 30);

    for i in range(1, 21):
        created_at = time_test.add_minute(datetime.now(), i + 0.5);
        # 生成一个随机数在 50 到 90 之间

        result_pv = random.randint(70, 100)
        result_sv = random.randint(70, 100)
        result_warning = random.choice([True, False])

        if i <= 10:
            result_pv = random.randint(0, 60)
            result_sv = random.randint(10, 60)

        row = {
            "oss_path": "1_1/20240225/1_1-20240225-P24022502170310.webp",
            "file_path": "/Users/macbook/Desktop/work/working/ftp_detect/lab_pic/1_1/20240225/images/P24022502170310.jpg",
            "ocr": {
                "pv": result_pv,
                "sv": result_sv,
                "warning": result_warning
            },
            "time_in_range": {
                "id": "65da30692761548ab0228b7c",
                "camera_id": "",
                "device_name": "设备1",
                "username": "johndoe",
                "pic": "",
                "metrics": None,
                "result": "",
                "remarks": "",
                "start_at": start_at,
                "end_at": end_at
            },
            "created_at": created_at,
            "file_time": created_at
        }
        rows.append(row)

    res = coll_records.insert_many(rows)
    length = len(res.inserted_ids)
    return success(length)


if __name__ == "__main__":
    uvicorn.run(app="main_jose:app", host="0.0.0.0", port=18000, reload=True)
