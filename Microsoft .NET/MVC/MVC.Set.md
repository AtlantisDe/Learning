# MVC.Set

```c#
Visual Studio 已向项目“AleseoEngine”添加 ASP.NET MVC 5 的 全部集合 个依赖项。

项目中的 Global.asax.cs 文件可能需要其他更改才能启用 ASP.NET MVC。

1. 添加以下命名空间引用:

    using System.Web.Mvc;
    using System.Web.Routing;
    using System.Web.Optimization;

2. 如果代码尚未定义 Application_Start 方法，请添加以下方法:

    protected void Application_Start()
    {
    }

3. 在 Application_Start 方法的末尾添加以下行:

    AreaRegistration.RegisterAllAreas();
    RouteConfig.RegisterRoutes(RouteTable.Routes);
    FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
    BundleConfig.RegisterBundles(BundleTable.Bundles);

    RouteConfig.RegisterRoutes(System.Web.Routing.RouteTable.Routes);
    FilterConfig.RegisterGlobalFilters(System.Web.Mvc.GlobalFilters.Filters);
    BundleConfig.RegisterBundles(System.Web.Optimization.BundleTable.Bundles);
```
