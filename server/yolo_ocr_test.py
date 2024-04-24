from app.file_deal import to_oss_path
import pytest

def test_to_oss_path():
    # 原始路径
    original_path = '/Users/macbook/Desktop/work/working/ftp_detect/lab_pic/1_1/20240224/images/P24022416451510.jpg'
    # 预期的转换后的路径
    expected_path = '1_1/20240224/1_1-20240224-P24022416451510.webp'

    # 调用函数并获取结果
    result_path = to_oss_path(original_path)

    # 断言结果是否符合预期
    assert result_path == expected_path, f"Expected '{expected_path}', but got '{result_path}'"
