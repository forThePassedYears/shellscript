
shell脚本 第一行指定执行该脚本的解释器
#!/bin/bash


#### 执行shell脚本：
    
    chmod +x ./test.sh
    
    当前目录下：  ./test.sh
                bash test.sh

    在当前进程中运行shell脚本：
                source test.sh  # 使用 source 命令不用给脚本增加执行权限
                . test.sh
                . ./test.sh


#### 定义变量：
    
    variable=value
    variable='value'
    variable="value"

    - variable 是变量名
    - value 是赋给变量的值
    **如果value不包含任何空包字符(如空格，Tab缩进等)，那么可以不适用引号；如果包含了空白符，那么就必须使用引号包围起来。**

    注意: **赋值号=周围不能有空格**

    - 单引号 会原样输出字符 不会解析变量
    - 双引号 先解析变量，再输出

    变量的使用：
        - $value
        - ${value}
    ** 花括号可选，花括号的作用是帮助解释器识别变量的边界 **

    变量可以被重新赋值


#### 将命令的结果赋值给变量：
    variable=`command`
    variable=$(command)

    推荐使用第二种方式


    log=$(cat haha.txt)
    echo $log

    url='https://haha.com'
    readonly url
    url='haha'  # 此时修改变量会报错



#### 删除变量：
    unset log


#### Shell 变量的作用域可以分为三种：

    - 有的变量可以在当前 Shell 会话中使用，这叫做全局变量（global variable）；

    - 有的变量只能在函数内部使用，这叫做局部变量（local variable）；
    
    - 而有的变量还可以在其它 Shell 中使用，这叫做环境变量（environment variable）。


    全局变量：

        - 全局变量就是值在当前的整个shell会话中都有效。每个shell会话都是相互独立的，互不影响。在shell中定义的变量，默认就是全局变量。

        - 在一个shell会话中，可以执行多个shell脚本文件，此时全局变量在这些脚本文件中都有效。
            一个文件中定义的变量，在另外的脚本中也可以引用


    局部变量：

        - 脚本文件中函数内定义的变量默认是全局变量。
        
        - 要想变量的作用域仅限于函数内部，那么可以在定义时加上 local 命令，此时该变量就成了局部变量


    环境变量：

        - 全局变量只在当前shell会话中有效，如果使用 export 命令将它导出，那么它就在所有的子shell中有效了，称之为“环境变量”。

        环境变量被创建时所处的shell称为父shell，如果父shell中再创建一个shell，则该shell被称作为子shell。当子shell产生时，它会继承父shell的环境变量为自己所用。所以，说环境变量可从父shell传给子shell。

        **注意：环境变量只能向下传递而不能向上传递，即“传子不传父”。**


        在一个 Shell 中创建子 Shell 最简单的方式是运行 bash 命令。

        通过exit命令可以一层一层地退出shell。

        **注意，强调的是环境变量在子 Shell 中有效，并没有说它在所有的 Shell 种有效；如果你通过终端创建一个新的 Shell，那么它就不是当前 Shell 的子 Shell，环境变量对这个 Shell 就是无效的。**

        如果想让环境变量在所有 Shell 中都有效，并且能够永久保存，在关闭 Shell 后也不丢失，那么就需要把环境变量写入启动文件



#### Shell位置参数（命令行参数）：
    
    运行Shell脚本文件时，我们可以给它传递参数，这些参数在脚本文件中，使用 $n 的形式接收， 例如：$1表示第一个参数，$2表示第二个参数......

    同样，在调用函数时也可以传递参数。Shell 函数参数的传递和其它编程语言不同，没有所谓的形参和实参，在定义函数时也不用指明参数的名字和数目。换句话说，定义 Shell 函数时不能带参数，但是在调用函数时却可以传递参数，这些传递进来的参数，在函数内部就也使用$n的形式接收，例如，$1 表示第一个参数，$2 表示第二个参数......

    **这种通过 $n 的形式来接收的参数，在Shell中称为位置参数。**

    - 变量的名字必须以字母或者下划线开头，不能以数字开头；但是位置参数却偏偏是数字，这和变量的命名规则是相悖的，所以我们将它们视为“特殊变量”。

    - 除了 $n，Shell 中还有 $#、$*、$@、$?、$$ 几个特殊参数。


    - 注意：

        如果参数个数太多，达到或者超过了 10 个，那么就得用${n}的形式来接收了，例如 ${10}、${23}。{ }的作用是为了帮助解释器识别参数的边界，这跟使用变量时加{ }是一样的效果。


#### 特殊变量：
    
    $0  当前脚本的文件名

    $n(n>1)  传递给脚本或函数的参数。n为数字，表示第几个个参数

    $#  传递给脚本或函数的参数个数

    $*  传递给脚本或函数的所有参数

    $@  传递给脚本或函数的所有参数。当被双引号""包含时，$@与$*稍有不同

    $?  上个命令的退出状态，或函数的返回值

    $$  当前Shell进程ID。对于Shell脚本，就是这些脚本所在的进程ID


#### $* 和 $@ 的区别：
    
    在没有""双引号包围的情况下，$*和$@是没有区别的

    在有双引号""包围的情况下，"$*" 会将接收到的所有数据整合为“一个“参数

    "$@" 不受影响，还是解析每一个参数


#### $?
```markdown
    /*$?是一个特殊的变量，用来获取上一个命令的退出状态，或者上一个函数的返回值。*/

    退出状态是一个数字，一般情况下，大部分命令执行成功会返回0，失败返回1。
```

#### shell中的字符串

    字符串就是一系列字符的组合，是Shell编程中最常用的数据类型（共有数字和字符串两种类型）

    **字符串可以由单引号''包围，也可以由双引号""包围，亦可以不用引号。它们之间是由区别的。**

    1) 由单引号' '包围的字符串：
    - 任何字符都会原样输出，在其中使用变量是无效的。
    - 字符串中不能出现单引号，即使对单引号进行转义也不行。

    2) 由双引号" "包围的字符串：
    - 如果其中包含了某个变量，那么该变量会被解析（得到该变量的值），而不是原样输出。
    - 字符串中可以出现双引号，只要它被转义了就行。

    3) 不被引号包围的字符串
    - 不被引号包围的字符串中出现变量时也会被解析，这一点和双引号" "包围的字符串一样。
    - 字符串中不能出现空格，否则空格后边的字符串会作为其他变量或者命令解析。

#### 字符串拼接
在Shell中不需要使用如何运算符，将两个字符串并排放在一起就能实现拼接。
```shell
#!/bin/bash

name="Shell"
url="http://c.biancheng.net/shell/"

str1=$name$url  #中间不能有空格
str2="$name $url"  #如果被双引号包围，那么中间可以有空格
str3=$name": "$url  #中间可以出现别的字符串
str4="$name: $url"  #这样写也可以
str5="${name}Script: ${url}index.html"  #这个时候需要给变量名加上大括号

echo $str1
echo $str2
echo $str3
echo $str4
echo $str5
```
结果为:
Shellhttp://c.biancheng.net/shell/
Shell http://c.biancheng.net/shell/
Shell: http://c.biancheng.net/shell/
Shell: http://c.biancheng.net/shell/
ShellScript: http://c.biancheng.net/shell/index.html

#### 获取字符串长度

```markdown
    ${#string_name}
```
string_name表示字符串的名字


#### 字符串的截取

Shell 截取字符串两种方式：
    - 从指定位置开始截取
    - 从指定字符（子字符串）开始截取

##### 从指定位置开始截取

1. 从字符串左边开始计数

```markdown
${string:start:length}
```
string 是要截取的字符串，start是起始位置(从左边开始，从0开始计数)，length是要截取的长度(省略的话表示知道字符串的末尾)。

例如：
```shell
url="www.liangzi.com"
echo ${url: 4: 7}
```
结果：liangzi

或：
```shell
url="www.liangzi.com"
echo ${url: 4}
```
结果：liangzi.com

2. 从右边开始计数

格式：
```shell
${string:0-start:length}
```
这是固定的写法，专门用来表示从字符串右边开始计数。

##### 注意
- 从左边开始计数时，起始数字是 0（这符合程序员思维）；从右边开始计数时，起始数字是 1（这符合常人思维）。计数方向不同，起始数字也不同。
- 不管从哪边开始计数，截取方向都是从左到右。

例如：
```shell
url="www.liangzi.com"
echo ${url:0-11: 7}
```
结果为:
liangzi
```shell
url="www.liangzi.com"
echo ${url:0-11}
```
结果为：
liangzi.com


##### 从指定字符(子字符串)开始截取

这种截取方式无法指定字符串长度，只能从指定字符（子字符串）截取到字符串末尾。Shell 可以截取指定字符（子字符串）右边的所有字符，也可以截取左边的所有字符。

1. 使用#号截取右边字符
```shell
$(string#*chars)
```
string表示要截取的字符，chars是指定的字符(子串)， * 是通配符的一种，表示任意长度的字符串。\*chars连起来使用的意思是：忽略左边的所有字符，知道遇见chars(chars不会被截取)。

例如：
```shell
url="https://www.liangzi.com"
echo ${url#*:}
```
结果为：
//www.liangzi.com

```shell
url="https://www.liangzi.com"
echo ${url#*p:}
echo ${url#*ttp:}
```
效果和上面相同。

如果不需要忽略 chars 左边的字符，那么也可以不写\*，例如：
```shell
url="https://www.liangzi.com"
echo ${url#http://}
```

遇到匹配的第一个字符(子串)就结束了。

如果希望匹配最后一个指定字符（子字符串）再匹配结束，那么可以使用##，具体格式为：
```shell
${string##*chars}
```
例如：
```shell
url="https://www.liangzi.com"

echo ${url#*/}    #结果为 /c.biancheng.net/index.html
echo ${url##*/}   #结果为 index.html
str="---aa+++aa@@@"
echo ${str#*aa}   #结果为 +++aa@@@
echo ${str##*aa}  #结果为 @@@
```

2. 使用 % 截取左边字符
- 使用%号可以截取指定字符（或者子字符串）左边的所有字符，具体格式如下：
```shell
${string%chars*}
```
请注意*的位置，因为要截取 chars 左边的字符，而忽略 chars 右边的字符，所以*应该位于 chars 的右侧。其他方面%和#的用法相同，例如：
```shell
#!/bin/bash

url="http://www.liangzi.com/index.html"

echo ${url%/*}  #结果为 http://c.biancheng.net
echo ${url%%/*}  #结果为 http:
str="---aa+++aa@@@"
echo ${str%aa*}  #结果为 ---aa+++
echo ${str%%aa*}  #结果为 ---
```


##### 总结：
```markdown
${string: start :length}    从 string 字符串的左边第 start 个字符开始，向右截取 length 个字符。
${string: start}    从 string 字符串的左边第 start 个字符开始截取，直到最后。
${string: 0-start :length}  从 string 字符串的右边第 start 个字符开始，向右截取 length 个字符。
${string: 0-start}  从 string 字符串的右边第 start 个字符开始截取，直到最后。
${string#*chars}    从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
${string##*chars}   从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
${string%*chars}    从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。
${string%%*chars}   从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。
```
