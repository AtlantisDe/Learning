# set

## 系统变量

- [dos 批处理文件中的变量小结-jsustchenjin-ChinaUnix 博客](http://blog.chinaunix.net/uid-22319135-id-5763519.html)

```c#
echo %WINDIR%
```

## 变量操作

```c#
//第一原则连接符号前一定空格 第一次运行变量未赋值 不知道为啥

set a=1
 &echo %a%
 &set b=2
 &echo %b%
 &set c=3
 &echo %c%

// 运行代码
set a=1 &echo %a% &set b=2 &echo %b% &set c=3 &echo %c%
// 运行结果
1
2
3

// 简洁版
set a=1
 &echo %a%
 &set a=2
 &echo %a%

// 运行代码
set a=1 &echo %a% &set a=2 &echo %a%
// 运行结果
1
1

//第一原则连接符号前一定空格 第一次运行变量未赋值 不知道为啥
@echo off
 &set a=1
 &echo %a%
 &set b=2
 &echo %b%
 &set c=3
 &echo %c%

// 运行代码
set a=1 &echo %a% &set b=2 &echo %b% &set c=3 &echo %c%
// 运行结果
1
2
3



```
