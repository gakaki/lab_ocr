import os
import os
from datetime import datetime
from pprint import pprint
import oss2
import PIL
import pillow_avif
import io
import cv2
from ultralytics import YOLO
import numpy as np
import easyocr
from app.yolo_ocr import detect_than_ocr
import requests
import json
import os
from dotenv import load_dotenv

# 现在你可以像这样使用这些环境变量
ACCESS_KEY_ID = os.getenv('ACCESS_KEY_ID')
if not ACCESS_KEY_ID:
    # 加载 .env 文件中的环境变量
    load_dotenv()

# 阿里云OSS的配置信息
ACCESS_KEY_ID = os.getenv('ACCESS_KEY_ID')
ACCESS_KEY_SECRET = os.getenv('ACCESS_KEY_SECRET')
BUCKET_NAME = os.getenv('BUCKET_NAME')

# 本地上传oss 不收取流量费用
ENDPOINT = os.getenv('ENDPOINT')
REGION = os.getenv('REGION')
ENDPOINT_INTERNET = os.getenv('ENDPOINT_INTERNET')
REGION_INTERNET = os.getenv('REGION_INTERNET')

if not ACCESS_KEY_ID:
    print("注意出错了 没有获得env变量")

auth = oss2.Auth(ACCESS_KEY_ID, ACCESS_KEY_SECRET)
bucket = oss2.Bucket(auth, ENDPOINT_INTERNET, BUCKET_NAME)

model = YOLO("yolo_lab.pt")

def to_oss_path(original_path):
    parts = original_path.rsplit('/', 4)
    dir_name_not_need = parts[0]
    path_lab_and_device = parts[1]  # 1_1
    path_year_date = parts[2]  # 20240224
    path_images_not_need = parts[3]  # images
    path_image_name = parts[4].replace('.jpg', '.webp')

    oss_image_name = path_lab_and_device + '-' + path_year_date + '-' + path_image_name
    oss_path = path_lab_and_device + '/' + path_year_date + '/' + oss_image_name
    return oss_path


def to_oss(oss_path, file_bytes_io):
    print("upload path is {}".format(oss_path))
    if file_bytes_io is None:
        raise Exception("not get file_bytes_io")
    bucket.put_object(oss_path, file_bytes_io)
    return oss_path


def to_webp(file_path):
    image_file = open(file_path, 'rb')
    image_data = image_file.read()

    # 使用 io.BytesIO 处理图像数据
    image_bytes_io = io.BytesIO(image_data)
    pilImage = PIL.Image.open(image_bytes_io)

    new_image_bytes_io = io.BytesIO()
    pilImage.save(new_image_bytes_io, format='WEBP')  # AVIF
    # image.save(f, format='AVIF')
    new_image_bytes_io.seek(0)
    # image.show()

    return [new_image_bytes_io, pilImage]


def save_webp_delete_jpg(file_path, pilImage):
    file_name, file_extension = os.path.splitext(file_path)
    new_path = file_name + '.' + "webp"
    pilImage.save(new_path)
    # 检查文件是否存在
    if os.path.exists(file_path):
        try:
            # 删除文件
            os.remove(file_path)
            print(f"文件 {file_path} 已被删除。")
        except OSError as e:
            # 如果发生错误，打印错误信息
            print(f"删除文件时发生错误: {e}")


BASE_URL = 'http://localhost:18000'


def post_body_than_get_json(url_path, data_map):
    url = BASE_URL + url_path
    response = requests.post(url,
                             json=data_map,
                             headers={'Content-Type': 'application/json',
                                      "Authorization": "Bearer abdaer37641$%^#$%^E%^$&%"})
    if response.status_code == 200:
        result = response.json()
        print("json result is:")
        pprint(result)
        return result
    else:
        # 请求失败，打印错误信息
        print(f'Request failed with status code {response.status_code}')
        print(response.text)
        return None


def verify_time_in_range(file_path):
    res = post_body_than_get_json('/experiment/valid_range',
                                  {"file_path": file_path})
    key = 'data'
    if res is not None and key in res:
        if res[key] is not None and "device_name" in res[key]:
            return res[key]
    return None


def save_ocr_res_to_db(oss_path, file_path, ocr_lines, time_in_range):
    res = post_body_than_get_json('/records/upload',
                                  {
                                      "oss_path": oss_path,
                                      "file_path": file_path,
                                      "ocr_lines": ocr_lines,
                                      "time_in_range": time_in_range
                                  })
    pprint(res)
    return res



def file_path_detected(file_path):
    if not os.path.exists(file_path):
        return None

    [new_image_bytes_io, image_webp] = to_webp(file_path)

    save_webp_delete_jpg(file_path, image_webp)

    time_in_range = verify_time_in_range(file_path)

    if time_in_range is not None:

        oss_path = to_oss_path(file_path)

        to_oss(oss_path, new_image_bytes_io)

        [ocr_lines, bgr_image] = detect_than_ocr(image_webp)

        if ocr_lines is not None and len(ocr_lines) > 0:
            pprint(ocr_lines)
        save_ocr_res_to_db(
            oss_path,
            file_path,
            ocr_lines,
            time_in_range
        )

    # save_ocred_image(bgr_image)

    # cv2.imshow('PIL Image', pilImage)
    # cv2.waitKey(0)
    # cv2.destroyAllWindows()


if __name__ == '__main__':
    file_path = "/Users/macbook/Desktop/work/working/ftp_detect/lab_pic/1_1/20240224/images/P24022416421510.jpg"
    file_path_detected(file_path)
    assert 1 == 1

    # # 3 4 秒很慢的
    # pic_path = 'detect_ocr.jpg'
    # [new_image_bytes_io, pilImage] = to_webp(pic_path)
    #
    # [ocr_lines, bgr_image] = detect_than_ocr(pilImage)
    # pprint(ocr_lines)
