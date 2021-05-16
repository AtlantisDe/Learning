# CMD

- [CMD：[1]在当前文件夹下打开 cmd 命令 - hhj187 - 博客园](https://www.cnblogs.com/hhj187/p/4721596.html)
- [bat 批处理修改 cmd 窗口大小、标题、字体、背景颜色](https://blog.csdn.net/zj0910/article/details/46942861?utm_source=blogxgwz8)
- [Windows 批处理(bat)语法大全 运维 GoodIdea-CSDN 博客](https://blog.csdn.net/qq_36838191/article/details/83046599)

## 常用命令

```c#
// windows使用cmd命令行获取管理员权限
runas /noprofile /user:Administrator cmd
```

### 1. 切换文件夹如 D 盘文件夹

- Path tools 常用辅助工具

```c#
cd /d D:\Tmp\mkcert

d:
cd D:/Work/
// 例如:
cd /d "C:\administrator\My Documents\Visual Studio 2010\Projects\KeyPro"

// 请在管理员权限下使用:
1. 管理员打开 Cmd.exe
2. 切换路径,先输入硬盘盘符如:D:回车,接着cd 文件夹路径,以下是示例路径
D:
cd D:\App\ATest\Application


sc.exe delete "ATest"
sc.exe create "ATest" binpath= "D:\Aaa.exe" start= "auto" displayname= "ATest Service"
sc description "ATest" "系统安全核心服务组件."
sc start "ATest"
sc stop "ATest"
```

### 2. 查看端口被占用情况

```bat
<!-- 查看指定的端口号 -->
netstat -ano | findstr "8088"
netstat -ano | findstr "8989"
```

### 3. 电脑设备是否支持睡眠唤醒

- [电脑从待机唤醒后显示器没法唤醒](http://ask.zol.com.cn/x/1321603.html)

```c#
powercfg -a
```

### 3. windows 命令行能不能查看某个命令的路径

- where ping
- [windows 命令行能不能查看某个命令的路径 - xiaoqidela 的博客 - CSDN 博客](https://blog.csdn.net/xiaoqidela/article/details/80484794)

```c#
// 使用where命令显示命令所在的路径
// 如where ping 查看ping命令的路径
// where java查看jdk的路径

where ping
C:\Windows\System32\PING.EXE

where ilasm
C:\Windows\Microsoft.NET\Framework\v4.0.30319\ilasm.exe

```

### 4.命令行赋值

```c#
set a=10 & echo %a%
```

### 5. 锁定屏幕

```c#
// 锁定屏幕
rundll32.exe user32.dll,LockWorkStation

// 这是设置在9：00定时锁屏
at /delete 9:00 rundll32.exe user32.dll,LockWorkStation

// 待机命令
rundll32.exe powrprof.dll,SetSuspendState

// 休眠待bai机
shutdown -h

// 锁定
rundll32.exe user32.dll,LockWorkStation
```

### 6. 删除文件夹内全部文件

```c#
del D:\Demo\WebImages\*.* /f/s/q/a

del D:\Tmp\Dos\*.* /f/s/q/a

del G:\0\*.* /f/s/q/a pause

// 其中G:\0是需要删除的文件夹绝对路径，可根据实际更改


del G:\0\*.* /f/s/q/a pause
```

### 7. 删除文件夹内全部文件(rmdir /?)

- [cmd 删除文件命令 del/erase 和删除目录命令 rmdir/rd - Macrored - 博客园](https://www.cnblogs.com/macrored/p/11415741.html)

```c#
rd /s/q D:\Sites\www0074747F
rd /s/q D:\Sites\www009C9B86
rd /s/q D:\Sites\www342C67B4
rd /s/q D:\Sites\www364AEA5C
rd /s/q D:\Sites\www4DA1000F
rd /s/q D:\Sites\www63F16A6E
rd /s/q D:\Sites\wwwBC460E1E
rd /s/q D:\Sites\wwwBEBD2EA9
rd /s/q D:\Sites\wwwCA1A9C67
rd /s/q D:\Sites\wwwF5B3D4A7


// rmdir
// 　rd的另外一个写法是rmdir，源自ReMakeDirectory。使用的方法也很简单：rd 文件夹名 即可，例如：rd test。它支持带路径的文件夹名，例如：rd d:\test。
rd /s/q D:\www_9e55830 /*Windows 强制删除文件及文件夹命令 这个文件夹www_9e55830 也会被跟着删除 */

/**/
rmdir /S /Q "D:\DEMO\Sites\"

```

### 8. mkdir 新建文件夹

```c#
mkdir D:\Tmp\程序升级包
mkdir D:\Tmp\GitHub

// 这个不能直接在cmd批处理文件里使用
md 发布
md 开发
md 开发\查询语句
md 开发\数据库
md 文档

REM 声明采用UTF-8编码
chcp 65001

// 代码页 描述

// 65001   UTF-8代码页

// 950繁体中文

// 936简体中文默认的GBK

// 437 MS-DOS美国英语


REM 声明采用简体中文默认的GBK
chcp 936


// 能使用的是 注意编码是跟当前系统编码一样 我们中文系统选择GB2312
@echo off
REM 本文件格式请使用GB2312编码保存,在中文系统下运行


echo '常用开发项目文件夹创建'

md %~dp0发布
md %~dp0开发
md %~dp0开发\查询语句
md %~dp0开发\数据库
md %~dp0文档
pause


```

### 9. 获取管理员权限

- [cmd 获取管理员权限 - raoyi - 博客园](https://www.cnblogs.com/raoyi/p/12101617.html)
- [widnwos .bat 脚本中自动以管理员权限 - 陈昌雄 - 博客园](https://www.cnblogs.com/ChenChangXiong/p/11090834.html)

```c#

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit


// cmd获取管理员权限 键盘打开方式 win+R打开运行窗口后输入cmd,按ctrl+shift+enter可直接进管理员模式。
// cmd命令方式

runas /noprofile /user:Administrator cmd

// 随后输入Administrator账户的密码 可以不是Administrator账户，只要是具有管理员权限的账号都可，例如RaoYi等

runas /noprofile /user:RaoYi cmd

// runas 允许用户用其它权限运行指定的工具和程序
// /noprofile 指定不应该加载用户的配置文件。
// /user:UserAccountName 指定在其下运行程序的用户帐户的名称
```

### 10. tracert

```c#
tracert 192.168.3.1
tracert 1.93.1.1
```

### 11. set 环境变量设置方法详细解释

- [cmd 环境变量设置方法详细解释 - 服务器维护 - 乐享 WEB 技术栈](https://www.54yk.com/?id=57)

```c#

// win10 搜索: 环境变量 即可直达

// 1.找到“高级系统设置”（二选一的方法找到环境变量）

① 我的电脑-属性-高级-环境变量

// ②win8,10 直接在搜索框搜 “查看高级系统设置”-环境变量

查看高级系统设置


// 2.找到变量"Path" （win10用②）

// ①在原来的后边加上“;D:/xammp/php” (php.exe所在的目录，前边还有个；)

// ②或者是按新建加上 “D:/xammp/php”

// 3.重新打开cmd

// win+R，输入 php -v （查看php 版本信息）

// 4.成功!


// 1、查看当前所有可用的环境变量：输入 set 即可查看。
set

// 2、查看某个环境变量：输入 “set 变量名”即可，比如想查看temp变量的值，即输入 set temp
set temp
set windir

// 当然也可以使用 echo %temp%

echo %temp%
echo %windir%


// 3、修改环境变量 ：输入 “set 变量名=变量内容”即可，比如将temp设置为“d:\tempfile”，只要输入set temp="d:\tempfile"。注意，此修改环境变量是指用现在的内容去覆盖以前的内容，并不是追加。比如当我设置了上面的path路径之后，如果我再重新输入set temp="c"，再次查看temp路径的时候，其值为“c”，而不是“d:\tempfile”；“c”。

// 4、设置为空：如果想将某一变量设置为空，输入“set 变量名=”即可。如“set path=” 那么查看path的时候就为空。注意，上面已经说了，只在当前命令行窗口起作用。因此查看path的时候不要去右击“我的电脑”——“属性”........

// 5、给变量追加内容（不同于3，那个是覆盖）：输入“set 变量名=%变量名%;变量内容”。如，为temp添加一个新的路径，输入“ set path=%path%;d:\tempfile”即可将d:\tempfile添加到path中，再次执行"set path=%path%;c:"，那么，使用set path语句来查看的时候，将会有：d:\tempfile;c:，而不是像第3步中的只有c:。




// %ALLUSERSPROFILE% 局部 返回所有“用户配置文件”的位置。
// %APPDATA% 局部 返回默认情况下应用程序存储数据的位置。
// %CD% 局部 返回当前目录字符串。
// %CMDCMDLINE% 局部 返回用来启动当前的 Cmd.exe 的准确命令行。
// %CMDEXTVERSION% 系统 返回当前的“命令处理程序扩展”的版本号。
// %COMPUTERNAME% 系统 返回计算机的名称。
// %COMSPEC% 系统 返回命令行解释器可执行程序的准确路径。
// %DATE% 系统 返回当前日期。使用与 date /t 命令相同的格式。由 Cmd.exe 生成。有关 date 命令的详细信息，请参阅 Date。
// %ERRORLEVEL% 系统 返回最近使用过的命令的错误代码。通常用非零值表示错误。
// %HOMEDRIVE% 系统 返回连接到用户主目录的本地工作站驱动器号。基于主目录值的设置。用户主目录是在“本地用户和组”中指定的。
// %HOMEPATH% 系统 返回用户主目录的完整路径。基于主目录值的设置。用户主目录是在“本地用户和组”中指定的。
// %HOMESHARE% 系统 返回用户的共享主目录的网络路径。基于主目录值的设置。用户主目录是在“本地用户和组”中指定的。
// %LOGONSEVER% 局部 返回验证当前登录会话的域控制器的名称。
// %NUMBER_OF_PROCESSORS% 系统 指定安装在计算机上的处理器的数目。
// %OS% 系统 返回操作系统的名称。Windows 2000 将操作系统显示为 Windows_NT。
// %PATH% 系统 指定可执行文件的搜索路径。
// %PATHEXT% 系统 返回操作系统认为可执行的文件扩展名的列表。
// %PROCESSOR_ARCHITECTURE% 系统 返回处理器的芯片体系结构。值: x86，IA64。
// %PROCESSOR_IDENTFIER% 系统 返回处理器说明。
// %PROCESSOR_LEVEL% 系统 返回计算机上安装的处理器的型号。
// %PROCESSOR_REVISION% 系统 返回处理器修订号的系统变量。
// %PROMPT% 局部 返回当前解释程序的命令提示符设置。由 Cmd.exe 生成。
// %RANDOM% 系统 返回 0 到 32767 之间的任意十进制数字。由 Cmd.exe 生成。
// %SYSTEMDRIVE% 系统 返回包含 Windows XP 根目录（即系统根目录）的驱动器。
// %SYSTEMROOT% 系统 返回 Windows XP 根目录的位置。
// %TEMP% and %TMP% 系统和用户 返回对当前登录用户可用的应用程序所使用的默认临时目录。有些应用程序需要 TEMP，而其它应用程序则需要 TMP。
// %TIME% 系统 返回当前时间。使用与 time /t 命令相同的格式。由 Cmd.exe 生成。有关 time 命令的详细信息，请参阅 Time。
// %USERDOMAIN% 局部 返回包含用户帐户的域的名称。
// %USERNAME% 局部 返回当前登录的用户的名称。
// %UserProfile% 局部 返回当前用户的配置文件的位置。
// %WINDIR% 系统 返回操作系统目录的位置。
```

### 12. CMD 获取当前目录的绝对路径

```c#
@echo off
echo 当前盘符：%~d0
echo 当前盘符和路径：%~dp0
echo 当前批处理全路径：%~f0
echo 当前盘符和路径的短文件名格式：%~sdp0
echo 当前CMD默认目录：%cd%
echo 目录中有空格也可以加入""避免找不到路径
echo 当前盘符："%~d0"
echo 当前盘符和路径："%~dp0"
echo 当前批处理全路径："%~f0"
echo 当前盘符和路径的短文件名格式："%~sdp0"
echo 当前CMD默认目录："%cd%"
pause
```

### 13. 遍历文件夹内文件名写到文本

```c#
dir /w/b>>1.txt
```
