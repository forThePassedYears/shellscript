#!/bin/bash

array1=(11 22 33)
array2=(你好啊 "我很好")

array_new=(${array1[@]} ${array2[*]})  # 拼接数组
array_new2=(${array1[@]} ${array2[@]})  # 拼接数组
echo ${array_new[@]}  # 输出数组中的所有元素


array_new3=(${#array1[@]} ${array2[*]})  # 拼接数组
echo ${array_new3[@]}

