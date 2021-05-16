# WinRAR

- [WinRAR archiver, a powerful tool to process RAR and ZIP files](https://www.rarlab.com/download.htm)
- [WinRAR - 压缩软件 老牌压缩软件知名产品 经典装机软件之一](http://www.winrar.com.cn/)
- [WinRAR - 5.90 最新版](http://www.winrar.com.cn/download.htm)
- [WinRAR 的命令行模式用法介绍 - Fetty - 博客园](https://www.cnblogs.com/fetty/p/4769279.html)
- [Using the WinRAR Command-line tools in Windows](https://cects.com/using-the-winrar-command-line-tools-in-windows/?fdx_switcher=mobile)
- [WinRAR 压缩文件参数详解](https://blog.csdn.net/ping523/article/details/54973064)
- [41 Shortcuts for WinRAR (Windows)](https://shortcutworld.com/WinRAR/win/WinRAR_Shortcuts)

## 常用

```c#
WinRAR x64 (64 bit) 5.91

https://www.rarlab.com/rar/winrar-x64-600sc.exe
```

### 1. 压缩全部文件

```c#
//a 压缩 e 解压
"C:\Program Files\WinRAR\WinRAR.exe" a -r  -ep1 "D:\Work\Demo\Authorization.rar" "D:\Work\Demo\Authorization"

// 自解压加注释
%winrar% a  -r  -ep1  -sfx -z%~dp0AipOutput\%projectTitle%.Update.sfx.exe.txt %~dp0AipOutput\%projectTitle%.exe %~dp0ReleaseProject\%ReleaseProjectTitle%\
```

### 1. 压缩编码

```c#
用这个:UTF-16LE

UTF-16BE、UTF-16LE、UTF-16
```

### 2. 添加注释，注释从一个 txt 文件读取，txt 文件名 info.txt

```c#
// rem 添加注释，注释从一个txt文件读取，txt文件名info.txt
WinRAR.exe c -zinfo.txt num_all.zip
WinRAR.exe c -zinfo.txt num_all.rar
```

### 3. 直接创建自解压文件

```c#
rar a -sfx d:/cc.exe d:/cc.txt

set winrar="C:\Program Files\WinRAR\WinRAR.exe"

%winrar% a  -r  -ep1  -sfx %~dp0AipOutput\%projectTitle%.exe %~dp0ReleaseProject\%ReleaseProjectTitle%\


"C:\Program Files\WinRAR\WinRAR.exe" a -sfx "D:\Work\Demo\Authorization.exe" "D:\Work\Demo\Authorization"
```

### 4. 给自解压文件（.exe）添加注释（设置默认解压路径等）

```c#
// 写入注释编码:请以当前系统编码为标准
// 中文系统就是:GB2312

// 注释命令
-z
rar.exe a -zC:\Temp\message.txt "test.rar" "C:\TestFiles"

rar c -zwk.txt d:/final.exe

set winrar="C:\Program Files\WinRAR\WinRAR.exe"

%winrar% c -z%~dp0AipOutput\%projectTitle%.txt %~dp0AipOutput\%projectTitle%.exe

```

### 5. Add comment to WinRar archive with batch file

- [Add comment to WinRar archive with batch file](https://superuser.com/questions/1126594/add-comment-to-winrar-archive-with-batch-file)

```c#
// 写入注释编码:请以当前系统编码为标准
// 中文系统就是:GB2312

@echo off
SET /P comment=Comment:
echo %comment% > C:\Temp\message.txt
rar.exe a -zC:\Temp\message.txt "test.rar" "C:\TestFiles"
del C:\Temp\message.txt
pause
```

### 5. rem 从压缩包中读取注释，写入到 read.txt 文件,默认 ASCII，参数-scuc 表示 unicode

```c#
// 写入注释编码:请以当前系统编码为标准
// 中文系统就是:GB2312

WinRAR.exe cw num_all.zip read1_ASCII.txt
WinRAR.exe cw num_all.rar read2_ASCII.txt
WinRAR.exe cw -scuc num_all.rar read_unicode.txt

%winrar% cw -scuc %~dp0AipOutput\%projectTitle%.exe read1_ASCII.txt
```

### 6. 创建桌面快捷方式

- [WinRAR 创建自解压文件并添加桌面快捷方式](http://www.360doc.com/content/14/1113/17/14813814_424868126.shtml)

```c#
D, exe, , 金融快讯控制面板软件动态感知行情, 金融快讯V2020
```

### 7. 注册

```c#
WinRAR 5.31 注册即可
```

### 8. 自解压注释文本

```c#

;下面的注释包含自解压脚本命令

Path=D:\Test
Overwrite=1
Title=[Application]
Text
{
安装包
}


```
