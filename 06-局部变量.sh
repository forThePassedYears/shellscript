#!/bin/bash

# 定义函数
function func(){
    local b=99  # 定义局部变量
}

# 调用函数
func

# 输出函数内部变量
echo $b

