#!/bin/bash

name="Shell"
url="http://liangzi.com"

str1=$name$url
str2="$name : $url"
str3=$name":"$url
str4="njs kaljdsa${name}nsjkal njkcnxa${url}siq jnj"
str5="${name}Script: ${url}index.html"

echo $str1
echo $str2
echo $str3
echo $str4
echo $str5
