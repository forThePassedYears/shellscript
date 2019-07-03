#!/bin/bash

alias timestamp="date +%s"  # 时间戳

begin=`timestamp`  # 命令替换两种方式
sleep 2s
finsh=$(timestamp)  # 命令替换
difference=$((finsh - begin))  # 数学计算专用格式 (())

echo "run time is: $difference s"

