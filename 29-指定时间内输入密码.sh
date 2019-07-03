#!/bin/bash

if 
	read -t 5 -sp "请在20s内输入密码 >" pass1 && printf "\n" &&
	read -t 5 -sp "请在20s内确认密码 >" pass2 && printf "\n" &&
	[ $pass1 == $pass2 ]
then
	echo "valid password"
else
	echo "invalid password"
fi

