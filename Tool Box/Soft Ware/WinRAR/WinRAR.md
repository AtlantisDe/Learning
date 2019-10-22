# WinRAR

- [WinRAR 的命令行模式用法介绍 - Fetty - 博客园](https://www.cnblogs.com/fetty/p/4769279.html)
- [Using the WinRAR Command-line tools in Windows](https://cects.com/using-the-winrar-command-line-tools-in-windows/?fdx_switcher=mobile)
- [WinRAR 压缩文件参数详解](https://blog.csdn.net/ping523/article/details/54973064)

## 常用

### 1. 压缩全部文件

```c#
//a 压缩 e 解压
"C:\Program Files\WinRAR\WinRAR.exe" a -r  -ep1 "D:\Work\Demo\Authorization.rar" "D:\Work\Demo\Authorization"
```

### 2. 添加注释，注释从一个 txt 文件读取，txt 文件名 info.txt

```c#
// rem 添加注释，注释从一个txt文件读取，txt文件名info.txt
WinRAR.exe c -zinfo.txt num_all.zip
WinRAR.exe c -zinfo.txt num_all.rar
```
