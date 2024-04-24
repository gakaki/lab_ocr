import logging

from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer
import toml

from app.file_deal import *


class MyFTPHandler(FTPHandler):
    def on_file_received(self, file_path):
        # 文件接收完成后的回调
        print(f"File received: {file_path}")
        try:
            file_path_detected(file_path)
        except oss2.exceptions.OssError as e:
            raise e
        except Exception as e:
            raise e


toml_file_path = 'config.toml'
with open(toml_file_path, 'r') as f:
    config = toml.load(f)

current_lab_pic_dir = config['lab']['dir']
print("当前ftp图片存放路径", current_lab_pic_dir)


def get_cwd_path(directory_name):
    current_directory = os.getcwd()
    full_path = os.path.join(current_directory, directory_name)
    return full_path


logging.basicConfig(level=logging.DEBUG)
authorizer = DummyAuthorizer()

authorizer.add_user("root", "root", current_lab_pic_dir, perm="elradfmwMT")
# authorizer.add_anonymous("/home/nobody")

# 设置FTPHandler
handler = MyFTPHandler
handler.authorizer = authorizer
handler.log_prefix = 'XXX [%(username)s]@%(remote_ip)s'

server = FTPServer(("0.0.0.0", 21), handler)
server.serve_forever()
