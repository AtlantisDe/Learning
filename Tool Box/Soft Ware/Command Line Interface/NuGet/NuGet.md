# Nuget

- [安装 NuGet 客户端工具](https://docs.microsoft.com/zh-cn/nuget/install-nuget-client-tools)
- [发布你的程序包到 Nuget - 晓晨 Master - 博客园](https://www.cnblogs.com/stulzq/p/8874426.html)

## 1. nuget.exe

- [NuGet Gallery | Downloads](https://www.nuget.org/downloads)
- [安装 NuGet 客户端工具](https://docs.microsoft.com/zh-cn/nuget/install-nuget-client-tools)

## 2. WIki

```C#
// NuGet（读作New Get）是用于微软.NET开发平台的软件包管理器，是一个Visual Studio的扩展。

// Nuget是.NET程序包管理工具（类似linux下的npm等），程序员可直接用简单的命令行（或VS）下载包。好处：

// （1）避免类库版本不一致带来的问题。GitHub是管理源代码的，这个是管理生成的类库/包的。

// （2）可自动处理类库依赖:

// （3）可指定下载历史版本: install-package name –version 1.0.2

// （4）可部署私有包服务器: https://docs.microsoft.com/en-us/nuget/hosting-packages/overview
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

## 3. View Account Settings

- [Getting Title at 22:27](https://www.nuget.org/account)

## 4. Upload a package

- [NuGet Gallery | Sign In](https://www.nuget.org/packages/manage/upload)

## 5. NUGet 程序包还原

- [使用 NUGet 自动下载(还原)项目中使用的包 - freewsf - 博客园](https://www.cnblogs.com/freewsf/p/5615875.html)
- [VS 项目依赖项全部感叹号 - 天天的蓝色 - 博客园](https://www.cnblogs.com/huanyun/p/9199542.html)

```c#
// 点击解决方案--还原NUGet 程序包 即可
// 再有错误,打开.csproj项目文件,Ctrl+G 找到目标行删掉.
// VS项目依赖项全部感叹号,折腾很久，后来干脆新建一个sln，重新加载，搞定，头发都要掉了好几根。。。。

```
