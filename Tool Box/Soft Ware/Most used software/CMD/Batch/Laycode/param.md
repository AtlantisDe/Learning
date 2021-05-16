# param

## 0. 常用

```c#
set one=%1
set two=%2

if "%one%"=="" (
echo 空
pause
else (
echo %1
exit
)

```

## 1. 给批处理脚本传递参数

```c#
- [批处理调用批处理是，参数是如何调用的，参数是如何接收的？谢谢!-CSDN论坛](https://bbs.csdn.net/topics/290087634)

// 传递是对的，接受例子：
@echo off
echo %1 %2


// 批处理文件中可引用的参数为%0~%9，%0是指批处理文件的本身，也可以说是一个外部命令；%1~%9是批处理参数，也称形参，我们来新建一个文件，文件命名为test_argv.bat，文件内容如下：

@echo off

echo param[0] = %0
echo param[1] = %1
echo param[2] = %2
echo param[3] = %3
echo param[4] = %4
echo param[5] = %5
echo ...
pause

// 在控制台运行，并且处传入参数，运行结果如下：
F:\batTool>test_argv.bat 1 game test what
param[0] = test_argv.bat
param[1] = 1
param[2] = game
param[3] = test
param[4] = what
param[5] =
…
```

## 2. 判断参数 批处理基础：if 判断输入参数是否空

- [批处理基础：if 判断输入参数是否空](https://blog.csdn.net/u012474286/article/details/18220719)

```c#
@echo off

set one=%1
set two=%2

if "%one%"=="" (
echo 空) else (
echo %1)

if "%two%"=="" (echo null) else echo %2



注意：变量在引用时要用双引号括起来。

如果括号内有赋值，则请勿在后括号前留空。
```
