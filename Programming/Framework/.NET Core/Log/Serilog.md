# Serilog

- [Serilog &mdash; simple .NET logging with fully-structured events](https://serilog.net/)
- [serilog/serilog](https://github.com/serilog/serilog)
- [asp.net core 使用 serilog 将日志推送到腾讯云日志服务 - 饭勺 oO - 博客园](https://www.cnblogs.com/fanshaoO/p/11023271.html)
- [Serilog 初识（一）————分别 Console、Web 程序简单使用 Serilog 数据库 MDZZ666](https://blog.csdn.net/MDZZ666/article/details/98961215)
- [Serilog 初识(二)————结构化数据 数据库 MDZZ666](https://blog.csdn.net/MDZZ666/article/details/99109081)
- [serilog/serilog](https://github.com/serilog/serilog/wiki/Configuration-Basics)

## 1. 常用

```c#
// Console使用Serilog
Install-Package Serilog -Version 2.10.0
Install-Package Serilog.Sinks.Console
Install-Package Serilog.Sinks.File -Version 4.1.0


// 在Web程序中使用Serilog
Install-Package Serilog
Install-Package Serilog.AspNetCore
Install-Package Serilog.Sinks.Console
Install-Package Serilog.Sinks.File
Install-Package Serilog.Settings.Configuration

Information
Error
Warning
```

## 2. 代码

```c#
Serilog
var log = new LoggerConfiguration()
    .WriteTo.Console()
    .WriteTo.File("log.txt")
    .CreateLogger();

log.Information("Hello, Serilog!");
log.Information("集合{@items}", items);

```

## 3. Serilog.Sinks.File

```c#
Serilog.Core.Logger log = new Serilog.LoggerConfiguration().WriteTo.File("log.txt", rollingInterval: RollingInterval.Day).CreateLogger();

var log = new Serilog.LoggerConfiguration().WriteTo.File("log.txt", rollingInterval: RollingInterval.Day).CreateLogger();

var log = new LoggerConfiguration()
    .WriteTo.File("log.txt", rollingInterval: RollingInterval.Day)
    .CreateLogger();

    
```

## 4. Object

```c#
/// <summary>日志文件夹初始</summary>
public static bool LogsFoldersInit()
{
    $@"D:\Test\Logs\Work\OrdinaryLogs".CreateDirectory();
    $@"D:\Test\Logs\Work\ExceptionLogs".CreateDirectory();

    return true;
}

/// <summary>写出日志到文件同时打印输出控制台</summary>
public static Serilog.Core.Logger FileLogger = new LoggerConfiguration().WriteTo.Console().WriteTo.File(@"D:\Test\Logs\Work\OrdinaryLogs\log.txt", rollingInterval: RollingInterval.Day).CreateLogger();


/// <summary>异常日志 写出到文件同时打印输出控制台</summary>
public static Serilog.Core.Logger ExLogger = new LoggerConfiguration().WriteTo.Console().WriteTo.File(@"D:\Test\Logs\Work\ExceptionLogs\log.txt", rollingInterval: RollingInterval.Day).CreateLogger(); 

/// <summary>仅仅输出到控制台</summary>
public static Serilog.Core.Logger ConsoleLogger = new LoggerConfiguration().WriteTo.Console().CreateLogger();
```
