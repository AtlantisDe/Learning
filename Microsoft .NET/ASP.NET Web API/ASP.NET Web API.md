# ASP.NET Web API

- [ASP.NET Web API](<https://docs.microsoft.com/en-us/previous-versions/aspnet/hh833994(v=vs.108)>)
- [1、入门--ASP.NET Web API 2 (C#) - 杨孟易 - 博客园](https://www.cnblogs.com/yangmengyi/p/4233971.html)
- [Web Api ——创建 WebAPI - 小白 T 哥 - 博客园](https://www.cnblogs.com/xtblog/p/8099382.html)

```c#
Visual Studio 已向项目“AleseoEngine”添加 ASP.NET Web API 2 的 全部集合 个依赖项。

项目中的 Global.asax.cs 文件可能需要其他更改才能启用 ASP.NET Web API。

1. 添加以下命名空间引用:

    using System.Web.Http;
    using System.Web.Routing;

2. 如果代码尚未定义 Application_Start 方法，请添加以下方法:

    protected void Application_Start()
    {
    }

3. 在 Application_Start 方法的开头添加以下行:

    GlobalConfiguration.Configure(WebApiConfig.Register);
```
