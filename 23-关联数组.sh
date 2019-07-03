#!/bin/bash

# 创建关联数组的方式一
declare -A color
color['red']="#ff0000"
color['green']="#00ff00"
color['blue']="#0000ff"
echo ${color[@]}


# 创建关联数组的方式二
declare -A color2=(['red']='#ff0000' ['green']='#00ff00' ['blue']='#0000ff')
echo ${color2[*]}

