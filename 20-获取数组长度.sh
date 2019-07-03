#!/bin/bash

array_name=(1 2 3 4 5 6 "你好啊")  # 构造一个新的数组

echo array_name的长度@${#array_name[@]}  # 输出数组长度
echo array_name的长度*${#array_name[*]}  # 输出数组长度
echo 第7个元素的长度为：${#array_name[6]}  # 输出数组长度

echo ""
nums=(11 22 33)
echo nums的长度：${#nums[@]}
nums[10]="www.liangzi.com"
echo nums的长度：（添加了一个元素）${#nums[@]}
echo 输出第十个元素的长度${#nums[10]}

# 删除数组元素
unset nums[0]
echo 输出删除元素后的长度${#nums[@]}

