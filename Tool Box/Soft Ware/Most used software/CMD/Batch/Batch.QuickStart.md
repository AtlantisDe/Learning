# Batch.QuickStart

## 常用

```c#

```

### 1. 运行 bat 文件怎样不弹出黑色窗口

```c#
@echo off
color 0a

if not "%2"=="snow" mshta vbscript:createobject("wscript.shell").run("""%~F0"" wind snow",vbhide)(window.close)&&exit
D:\ATool.exe "demo"

exit
```
