# IIS7

- [Home : The Official Microsoft IIS Site](https://www.iis.net/)
- [IIs 配置文件存放路径](https://www.cnblogs.com/xienb/p/3456379.html)
- [如何查看 IIS 版本](https://jingyan.baidu.com/article/09ea3ede06c2ebc0aede3926.html)
- [IIS6、IIS7 和 IIS8](https://blog.csdn.net/zhangge3663/article/details/83539380)
- [怎么查看 IIS 的版本](http://ask.zol.com.cn/x/5538655.html)
- [asp.net 获取服务器信息 如:IIS 版本/.net 版本](https://blog.csdn.net/zhifeiya/article/details/41789659)
- [C#解决 IIS 域名批量绑定-十有三博客](https://shiyousan.com/post/636022975388168065)

```shell
# IIS 5 中，IIS的配置文件在：

# C:\WINNT\system32\inetsrv\MetaBase.bin

# IIS 6 中，IIS 的配置文件在：

# C:\WINDOWS\system32\inetsrv\MetaBase.xml

# IIS 7 中，IIS 的配置文件在：

# C:\WINDOWS\system32\inetstr\config\applicationHost.config

# 想修改这个文件需要把iis对应的服务关掉，这样才能修改这个文件，通过DirectoryEntry类可以修改此文件实现程序配置IIS。
```

```shell
C:\Windows\system32\inetsrv\config
控制面板\所有控制面板项\管理工具
控制面板\所有控制面板项\管理工具\IIS Manager.lnk
```

## Windows 10 安装 IIS

- [Win10 下 IIS 配置图解、MVC 项目发布图解、IIS 添加网站图解](https://www.cnblogs.com/zhao123/p/5588888.html)
- [IIS 之 HTTP 错误 404.3 - Not Found（由于扩展配置问题而无法提供您请求的页面...）](https://www.cnblogs.com/xinaixia/p/4460690.html)
- [Windows Server 2008 R2 Enterprise 安装.NET Framework 4.0 - Liu_Cabbage - 博客园](https://www.cnblogs.com/baocaige/p/10027434.html)

```shell
# 注意事项
1. 一定参考上面这两个链接都要做里面的动作
2. 安装扩展支持如ASP/ASPX/主要是.net框架,还有如CGI/ISAPI扩展等.

```

## 无法在 Web 服务器上启动调试。IIS 未列出与打开的 URL 匹配的网站。

- VS 开发遇到这个问题,是权限问题,直接用管理员运行 VS

## IIS 服务器 SSL 证书安装

- [IIS 服务器 SSL 证书安装 - 星畔 - 博客园](https://www.cnblogs.com/raincedar/p/10129717.html)

## Download

```c#
- [Downloads : The Official Microsoft IIS Site](https://www.iis.net/downloads)

```
