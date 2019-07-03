#!/bin/bash

arr=(1 2 3 4 5)
unset arr[0]

echo ${arr[@]}

unset arr
echo ${arr[*]}

