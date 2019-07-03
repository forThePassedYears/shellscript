#!/bin/bash

# 定义函数
function func(){
    echo "你好啊，${1}"  # 十个以下的参数时可以使用 $1
    echo "我是${2}"
}

# 调用函数，并传递两个参数
# 两种方式都可以
func "大哥" "小弟"
# func 大哥 小弟

