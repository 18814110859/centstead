#!/usr/bin/env bash

# 检测是否需要安装
if [ -f /home/vagrant/.env/mysql57 ] && [ ! -f ~/.replace ]
then
    exit 0
fi