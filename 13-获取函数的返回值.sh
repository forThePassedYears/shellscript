#!/bin/bash

function add(){
    return `expr $1 + $2`  # 返回两个数相加的和
}

add 11 22  # 调用函数
echo $?  # 输出上一个函数的返回值
