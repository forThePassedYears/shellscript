#!/bin/bash

array_name=(1 2 3 4 5 6)  # 构造一个新的数组
echo ${array_name[0]}  # 输出第0个元素

array_name[10]="你好啊"  # 给数组的第八个元素赋值
echo "全部元素为："${array_name[@]}  # 输出数组内所有的元素
echo "全部元素为："${array_name[*]}  # 输出数组内所有的元素
echo "下标为6的元素："${array_name[6]}  # 输出下标为6的元素是空的
echo "下标为7的元素："${array_name[7]}  # 输出下标为7的元素是空的
echo "下标为10的元素："${array_name[10]}
