#!/bin/zsh

rsync -azPv \
--exclude  data \
--exclude lib \
--exclude __pycache__/ \
. root@aliyun.gakaki.com:/root/server