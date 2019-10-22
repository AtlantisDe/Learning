# if

## bat 批处理 if 命令示例详解

- [bat 批处理 if 命令示例详解](https://www.jb51.net/article/14986.htm)

```c#
// 1、检测字符串(注意，用if检测字符串是否相等的时候，后面用的不是“=”，而是“==”)：
@echo off
set "str=this is a test"
REM 检测变量%str%是否等于test，如果相等，显示OK，否则显示NO
if "%str%"=="test" (echo OK) else echo NO
pause>nul
```
