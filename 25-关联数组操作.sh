#!/bin/bash

declare -A color

color['red']='#ff0000'
color['green']='#00ff00'
color['blue']='#0000ff'
color['white']='#ffffff'
color['black']='#000000'

# 遍历打印数组内所有的值
for value in ${color[@]}
do
	echo $value
done
echo "***********"

# 打印所有的下标
for sub in ${!color[*]}
do
	echo $sub
done
echo "***********"

# 列出所有键值对
for key in ${!color[@]}
do
	echo "${key} -> ${color[$key]}"
done


