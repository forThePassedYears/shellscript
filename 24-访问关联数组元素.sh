#!/bin/bash

# 创建关联数组的方式一
declare -A color
color['red']="#ff0000"
color['green']="#00ff00"
color['blue']="#0000ff"

echo ${color["red"]}

# 访问所有元素的下标和值
echo ${color[@]}

#访问关联数组的所有下标
echo ${!color[@]}
echo ${!color[*]}

# 获取关联数组的长度
echo ${#color[@]}
echo ${#color[*]}

