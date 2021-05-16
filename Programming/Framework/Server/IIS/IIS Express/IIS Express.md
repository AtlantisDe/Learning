# IIS Express

- [命令行启用 IIS Express](https://www.cnblogs.com/cby-love/p/7102847.html)
- [vs 运行时候冒了这个错：无法启动 IIS Express Web 服务器~Win10](https://www.cnblogs.com/dunitian/p/5347281.html)
- [Adding Application Pools](https://docs.microsoft.com/en-us/iis/configuration/system.applicationhost/applicationpools/add/)
- [New Features Introduced in IIS 10.0 Version 1709](https://docs.microsoft.com/zh-cn/iis/get-started/whats-new-in-iis-10-version-1709/new-features-introduced-in-iis-10-1709)
- [Running IIS Express from the Command Line](https://docs.microsoft.com/en-us/iis/extensions/using-iis-express/running-iis-express-from-the-command-line)

## 版本

```c#
Microsoft-IIS/10.0
```

## 命令

```shell
"C:\Program Files\IIS Express\appcmd.exe" list site
“C:\Program Files\IIS Express\iisexpress.exe“  /siteid:2
netsh http add urlacl url=http://*:58127/ user=everyone;
“C:\Program Files\IIS Express\iisexpress.exe“  /siteid:2


"C:\Program Files (x86)\IIS Express\appcmd.exe" list site
“C:\Program Files (x86)\IIS Express\iisexpress.exe“  /siteid:2
netsh http add urlacl url=http://*:58127/ user=everyone;
“C:\Program Files (x86)\IIS Express\iisexpress.exe“  /siteid:2

# 开启外部连接
netsh http add urlacl url=http://*:{端口号}/ user=everyone
# 关闭外部连接
netsh http delete urlacl url=http://*:{端口号}/
```

```console
#32
cd \Program Files\IIS Express
#64
cd \Program Files (x86)\IIS Express
iisexpress /?

```
