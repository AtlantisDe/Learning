# Batch

- [bat 多任务并行处理\_thq0201 的博客-CSDN 博客](https://blog.csdn.net/thq0201/article/details/7238069)

## 常用

```bat
---------------------------------

文件RunS1.bat：

echo off
rem RunS1.bat
rem 同时串行运行多个程序
set cmd1=D:test1
set cmd2=D:test2
call %cmd1%
call %cmd2%

---------------------------------

文件RunS2.bat：

echo off
rem RunS2.bat
rem 同时串行运行多个程序
set cmd1=D:test1
set cmd2=D:test2
%cmd1%
%cmd2%

---------------------------------

文件RunP.bat：

echo off
rem RunP.bat
rem 同时并行运行多个程序
set cmd1=D:test1
set cmd2=D:test2
start %cmd1%
start %cmd2%
```
