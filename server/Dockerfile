FROM python:3.11

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --no-cache-dir -r requirements.txt

EXPOSE 18000

# COPY main_jose.py time_test.py  /app/

CMD ["python", "main_jose.py"]