import logging
import os
import toml
import ssl
ssl._create_default_https_context = ssl._create_stdlib_context
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer
# from file_deal import *

class MyFTPHandler(FTPHandler):
    def on_file_received(self, file_path):
        # 文件接收完成后的回调
        print(f"File received: {file_path}")
        try:
            print(file_path)
            # file_path_detected(file_path)
        except Exception as e:
            raise e

# toml_file_path = 'config.toml'
# with open(toml_file_path, 'r') as f:
#     config = toml.load(f)

# current_lab_pic_dir = config['lab']['dir']
# print("当前ftp图片存放路径", current_lab_pic_dir)

def get_cwd_path(directory_name):
    current_directory = os.getcwd()
    full_path = os.path.join(current_directory, directory_name)
    print(full_path)
    return full_path

logging.basicConfig(level=logging.DEBUG)
authorizer = DummyAuthorizer()


authorizer.add_user("admin", "1234!@#$",  "lab_pic", perm="elradfmwMT")
# authorizer.add_anonymous("/home/nobody")

# 设置FTPHandler
handler = MyFTPHandler
handler.authorizer = authorizer
handler.log_prefix = 'XXX [%(username)s]@%(remote_ip)s'
handler.passive_ports = range(18022,18040)
# 阿里云需要打开 18000 ~ 18999
server = FTPServer(("0.0.0.0", 18021), handler)
server.serve_forever()
