# IIS7

- [iis.net](https://www.iis.net/)
- [Home : The Official Microsoft IIS Site](https://www.iis.net/)
- [IIs 配置文件存放路径](https://www.cnblogs.com/xienb/p/3456379.html)
- [如何查看 IIS 版本](https://jingyan.baidu.com/article/09ea3ede06c2ebc0aede3926.html)
- [IIS6、IIS7 和 IIS8](https://blog.csdn.net/zhangge3663/article/details/83539380)
- [怎么查看 IIS 的版本](http://ask.zol.com.cn/x/5538655.html)
- [asp.net 获取服务器信息 如:IIS 版本/.net 版本](https://blog.csdn.net/zhifeiya/article/details/41789659)
- [C#解决 IIS 域名批量绑定-十有三博客](https://shiyousan.com/post/636022975388168065)
- [New Features Introduced in IIS 10.0 Version 1709](https://docs.microsoft.com/en-us/iis/get-started/whats-new-in-iis-10-version-1709/new-features-introduced-in-iis-10-1709?redirectedfrom=MSDN)
- [windows-admin-center-feed - msft.iis.iis-management 0.1.3042563 | MyGet](https://msft-sme.myget.org/feed/windows-admin-center-feed/package/nuget/msft.iis.iis-management)

## 0. QuickStart

```c#
// IIS 5 中，IIS的配置文件在：
C:\WINNT\system32\inetsrv\MetaBase.bin
// IIS 6 中，IIS 的配置文件在：
C:\WINDOWS\system32\inetsrv\MetaBase.xml
// IIS 7 中，IIS 的配置文件在：
C:\WINDOWS\system32\inetstr\config\applicationHost.config
// 想修改这个文件需要把iis对应的服务关掉，这样才能修改这个文件，通过DirectoryEntry类可以修改此文件实现程序配置IIS。

// 管理工具
C:\Windows\system32\inetsrv\config

控制面板\所有控制面板项\管理工具
控制面板\所有控制面板项\管理工具\IIS Manager.lnk


```

## 1. Windows 10 安装 IIS

- [Win10 下 IIS 配置图解、MVC 项目发布图解、IIS 添加网站图解](https://www.cnblogs.com/zhao123/p/5588888.html)
- [IIS 之 HTTP 错误 404.3 - Not Found（由于扩展配置问题而无法提供您请求的页面...）](https://www.cnblogs.com/xinaixia/p/4460690.html)
- [Windows Server 2008 R2 Enterprise 安装.NET Framework 4.0 - Liu_Cabbage - 博客园](https://www.cnblogs.com/baocaige/p/10027434.html)
- [ASP.NET Core 部署到 Windows IIS - 程序员大本营](https://www.pianshen.com/article/5199690861/)

```C#
// # 注意事项
1. 一定参考上面这两个链接都要做里面的动作
2. 安装扩展支持如ASP/ASPX/主要是.net框架,还有如CGI/ISAPI扩展等.

// Tips:

启用或关闭windows功能

控制面板\所有控制面板项 --->程序和功能
控制面板\所有控制面板项\程序和功能

Control Panel\Programs\Programs and Features

```

## 2. 无法在 Web 服务器上启动调试。IIS 未列出与打开的 URL 匹配的网站

- VS 开发遇到这个问题,是权限问题,直接用管理员运行 VS

## 3. IIS 服务器 SSL 证书安装

- [IIS 服务器 SSL 证书安装 - 星畔 - 博客园](https://www.cnblogs.com/raincedar/p/10129717.html)

## 4. Download

- [Downloads : The Official Microsoft IIS Site](https://www.iis.net/downloads)

```c#

```

## 5. IIS 配置反向代理

- [用 IIS 配置反向代理 - shiningrise - 博客园](https://www.cnblogs.com/shiningrise/p/5520524.html)

```c#
// 安装ARR下载:
// ARRv3_0.exe
// Application Request Routing

https://www.iis.net/downloads/microsoft/application-request-routing

添加演示:
1. 站点--添加规则--空白规则--Test
    与模式匹配--正则表达式
    模式:.*
    操作:操作类型:重写 重写URL:https://www.cnblogs.com/{R:0}



<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <rewrite>
            <rules>
                <rule name="Test">
                    <match url=".*" />
                    <action type="Rewrite" url="https://www.cnblogs.com/{R:0}" />
                </rule>
            </rules>
        </rewrite>
    </system.webServer>
</configuration>

```

## 5. Application Request Routing

- [Application Request Routing : The Official Microsoft IIS Site](https://www.iis.net/downloads/microsoft/application-request-routing)
- [IIS 设置反向代理](https://blog.csdn.net/Helloantoherday/article/details/100117026)
- [在 IIS7 中应用 Application Request Routing 配置反向代理的图文教程](https://www.jb51.net/article/39963.htm)

```c#
// 下载安装包,当前最高版本:
ARRv3_0.exe
// 关闭相关服务.
net stop was /y
net stop wmsvc /y

// 手动安装ARR的依赖项。

a) Web Farm Framework module version 1.1
b) External cache module version 1.0
c) URL Rewrite module version 2.0
```

## 6. 解除 IIS 配置节锁定/删除 IIS7 web 角色服务

- [2008 怎么删除 web 服务器？删除 IIS7\web 角色服务-百度经验](https://jingyan.baidu.com/article/bad08e1e85e98009c951216e.html)

```c#
C:\windows\system32\inetsrv\appcmd unlock config -section:system.webServer/modules
```

## 7. IIS 服务器备份导入与导出

- [IIS 服务器备份导入与导出 爱人 BT](https://blog.csdn.net/u011146423/article/details/86068714)

```c#
// 导出站点
%windir%/system32/inetsrv/appcmd list apppool “AppConsole” /config /xml > c:/Websites/AppConsole.apppool.xml
%windir%/system32/inetsrv/appcmd list site “AppConsole” /config /xml > c:/Websites/AppConsole.site.xml


%windir%/system32/inetsrv/appcmd list apppool “WebsiteDriver” /config /xml > c:/Websites/WebsiteDriver.apppool.xml
%windir%/system32/inetsrv/appcmd list site “WebsiteDriver” /config /xml > c:/Websites/WebsiteDriver.site.xml

// 导入站点
%windir%/system32/inetsrv/appcmd add apppool /in < c:/Websites/AppConsole.apppool.xml
%windir%/system32/inetsrv/appcmd add site /in < c:/Websites/AppConsole.site.xml

%windir%/system32/inetsrv/appcmd add apppool /in < c:/Websites/WebsiteDriver.apppool.xml
%windir%/system32/inetsrv/appcmd add site /in < c:/Websites/WebsiteDriver.site.xml


```

```c#
// 导出单独应用程序池:
%windir%/system32/inetsrv/appcmd list apppool “应用程序池名称” /config /xml > c:/Websites/myapppool.xml

// 导入单独应用程序池:
%windir%/system32/inetsrv/appcmd add apppool /in < c:/Websites/myapppool.xml

// 导出单独站点:
%windir%/system32/inetsrv/appcmd list site “站点名称” /config /xml > c:/Websites/mywebsite.xml


// 导入单独站点:
%windir%/system32/inetsrv/appcmd add site /in < c:/Websites/cnziben.com.xml
```

## 8. IIS 部署 ASP.NET 站点常遇到问题

```c#
// 常用思维思考方向:
// 0. 本地开发调试能运行,但是发布出现问题,很多事web.config 配置问题
// 1. 版本号,重定向解决.
// 2. system.codedom 节点中 删除 compilers 配置项
```

### 1. 遇到问题:未能加载文件或程序集“Microsoft.CodeDom.Providers.DotNetCompilerPlatform

```c#
// 删除以下配置项即可
    <compilers>
      <compiler language="c#;cs;csharp" extension=".cs" type="Microsoft.CodeDom.Providers.DotNetCompilerPlatform.CSharpCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.1.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" warningLevel="4" compilerOptions="/langversion:default /nowarn:1659;1699;1701" />
      <compiler language="vb;vbs;visualbasic;vbscript" extension=".vb" type="Microsoft.CodeDom.Providers.DotNetCompilerPlatform.VBCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.1.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" warningLevel="4" compilerOptions="/langversion:default /nowarn:41008 /define:_MYTYPE=\&quot;Web\&quot; /optionInfer+" />
    </compilers>
```

## 9. ASP.NET Core 应用发布到 IIS

- [.NET Downloads (Linux, macOS, and Windows)](https://dotnet.microsoft.com/download/dotnet)
- [Download .NET 6.0 (Linux, macOS, and Windows)](https://dotnet.microsoft.com/download/dotnet/6.0)
- [将 ASP.NET Core 应用发布到 IIS](https://docs.microsoft.com/zh-cn/aspnet/core/tutorials/publish-to-iis?view=aspnetcore-2.2&tabs=visual-studio)
- [ASP.NET Core 部署系列一：发布到 IIS 上 - 艾三元 - 博客园](https://www.cnblogs.com/i3yuan/p/10988358.html)
- [ASP.NET Core 模块](https://docs.microsoft.com/zh-cn/aspnet/core/host-and-deploy/aspnet-core-module?view=aspnetcore-5.0)
- [ASP.NET CORE 发布至 IIS-百度经验](https://jingyan.baidu.com/article/e52e3615026e2f40c60c51b0.html)

```c#
// 安装 .NET Core 托管捆绑包

// 使用以下链接下载安装程序：
// 当前 .NET Core 托管捆绑包安装程序（直接下载）

dotnet-hosting-6.0.0-preview.3.21201.13-win.exe
dotnet-hosting-5.0.5-win.exe


// 在 IIS 服务器上运行安装程序。
// 重启服务器或在命令行界面中执行 net stop was /y，后跟 net start w3svc。

net stop was /y
net start w3svc

```

## 10. IIS 中的 CORS | IIS CORS Module

- [(CORS) 启用跨域请求 ASP.NET Core](https://docs.microsoft.com/zh-cn/aspnet/core/security/cors?view=aspnetcore-5.0#cors-in-iis)
- [IIS CORS Module : The Official Microsoft IIS Site](https://www.iis.net/downloads/microsoft/iis-cors-module)

```c#
public class StartupTest2
{
    public void ConfigureServices(IServiceCollection services)
    {
        services.AddCors(options =>
        {
            options.AddPolicy(name: "MyPolicy",
                builder =>
                {
                    builder.WithOrigins("http://example.com",
                        "http://www.contoso.com",
                        "https://cors1.azurewebsites.net",
                        "https://cors3.azurewebsites.net",
                        "https://localhost:44398",
                        "https://localhost:5001")
                            .WithMethods("PUT", "DELETE", "GET");
                });
        });

        services.AddControllers();
        services.AddRazorPages();
    }

    public void Configure(IApplicationBuilder app)
    {
        app.UseHttpsRedirection();
        app.UseStaticFiles();
        app.UseRouting();

        app.UseCors();

        app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapControllers();
            endpoints.MapRazorPages();
        });
    }
}
```
