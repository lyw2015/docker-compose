#!/bin/bash

code=$(curl -fis http://localhost | grep HTTP | awk '{print $2}')
if [[ $code -ne 200 ]]; then
  # 当前主机nginx服务异常则暂停keepalived服务以进行切换
  systemctl stop keepalived
fi