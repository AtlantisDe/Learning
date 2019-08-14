# Nuget

```txt
NuGet（读作New Get）是用于微软.NET开发平台的软件包管理器，是一个Visual Studio的扩展。

Nuget是.NET程序包管理工具（类似linux下的npm等），程序员可直接用简单的命令行（或VS）下载包。好处：

（1）避免类库版本不一致带来的问题。GitHub是管理源代码的，这个是管理生成的类库/包的。

（2）可自动处理类库依赖:

（3）可指定下载历史版本: install-package name –version 1.0.2

（4）可部署私有包服务器: https://docs.microsoft.com/en-us/nuget/hosting-packages/overview
```

- [NuGet Gallery | Home](https://www.nuget.org/)
- [NuGet 的简单使用](https://www.cnblogs.com/nizhenghua/p/6422078.html)
- [用 Nuget 部署程序包 - surfsky - 博客园](https://www.cnblogs.com/surfsky/p/8072993.html)

1. 注册账号 可用微软账户登录注册
2. [Getting Title at 12:50](http://www.nuget.org)

3. 生成 ApiKey

```shell
Get-Package：获取当前已经安装的包
UnInstall-Package：卸载某个包
Update-Package：升级某个包
```

## View Account Settings

- [Getting Title at 22:27](https://www.nuget.org/account)

## Upload a package

- [NuGet Gallery | Sign In](https://www.nuget.org/packages/manage/upload)
