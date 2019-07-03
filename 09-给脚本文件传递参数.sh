#!/bin/bash

echo "Process ID: $$"  # 当前shell进程ID
echo "File Name: $0"  # 当前脚本文件名
echo "First Parameter: $1"  # 第一个参数
echo "Second Parameter: $2"  # 第二个参数
echo "All parameters1 1: $@"  # 所有的参数
echo "All parameters1 2: $*"  # 所有的参数
echo "Total: $#"  # 参数总个数

