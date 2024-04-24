### README

## 程序整体流程

python 程序打开

开启ftp 服务器 <=  摄像头设置上传ftp地址 填它
ftp服务器收到文件上传结束,触发调用ftp_deal.py的 file_path_detected 方法
转换上传的图片文件为webp, 为了节省空间,转换为webp 之后删除上传的jpg文件
请求远端服务器的18000端口的/experiment/valid_range 接口, 判断是在实验时间范围内,否则什么都不干
生成阿里云oss上的文件路径
上传到阿里云oss通过 自己写的接口阿里云内网传oss 节省上传费用(这样间接传免费无流量费)
阿里云图片上传完毕,调用ocr检测图片中的数字和对应的结果
保存ocr的数字结果 post到远端服务器/records/upload接口.



把 "摄像头设置上传ftp地址"直接设置为aliyun服务器地址,以及之后所有的操作都在aliyun服务器上进行,
也就是请求远端服务器的18000端口的/experiment/valid_range 接口,替换为本地运行接口即可完成迁移.


###
virtualenv .

virtualenv . -p  /usr/local/bin/python3.11

 source bin/activate
 python -v
pip install --upgrade pip
pip install --upgrade pip

import logging
import os
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer
# https://github.com/PaddlePaddle/PaddleOCR/blob/release/2.7/StyleText/README.md#Quick_Start
# uvicorn main:app --reload
# pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "fastapi[all]" "uvicorn[standard]"
# https://github.com/cgcel/PaddleOCRFastAPI/blob/master/README_CN.md
# https://cloud.tencent.com/developer/article/1758809
# https://realpython.com/fastapi-python-web-apis/
# https://juejin.cn/post/7085653337365807112

## https://www.youtube.com/watch?v=W0IwfbrdCC4&ab_channel=jomutlo
# https://crates.io/crates/hot-lib-reloader
# https://robert.kra.hn/posts/hot-reloading-rust/
def get_path(directory_name):
    current_directory = os.getcwd()
    full_path = os.path.join(current_directory, directory_name)
    return full_path

logging.basicConfig(level=logging.DEBUG)

current_ftp_cam_path = get_path("ftp_cam")
print("当前ftp cam路径",current_ftp_cam_path)

authorizer = DummyAuthorizer()

authorizer.add_user("root", "root", current_ftp_cam_path, perm="elradfmwMT") //elradfmw
# authorizer.add_anonymous("/home/nobody")

handler = FTPHandler
handler.authorizer = authorizer
handler.log_prefix = 'XXX [%(username)s]@%(remote_ip)s'

server = FTPServer(("0.0.0.0", 21), handler)
server.serve_forever()

