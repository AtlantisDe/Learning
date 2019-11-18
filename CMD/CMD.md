# CMD

- [CMD：[1]在当前文件夹下打开 cmd 命令 - hhj187 - 博客园](https://www.cnblogs.com/hhj187/p/4721596.html)
- [bat 批处理修改 cmd 窗口大小、标题、字体、背景颜色](https://blog.csdn.net/zj0910/article/details/46942861?utm_source=blogxgwz8)

## 常用命令

### 1. 查看端口被占用情况

```bat
<!-- 查看指定的端口号 -->
netstat -ano | findstr "8088"
netstat -ano | findstr "8989"
```

### 2. 切换文件夹如 D 盘文件夹

- Path tools 常用辅助工具

```bat
d:
cd D:/Work/
例如: cd /d "C:\administrator\My Documents\Visual Studio 2010\Projects\KeyPro"
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
