# routes

- [MVC 路由解析---IgnoreRoute - 小王子的博客 - 博客园](https://www.cnblogs.com/xiaowangzi1987/p/9224175.html)
- [RouteCollection 类 (System.Web.Routing)](<https://msdn.microsoft.com/zh-cn/vstudio/system.web.routing.routecollection(v=vs.80)>)
- [Getting Title at 30:53](https://www.cnblogs.com/Leo_wl/p/3779666.html)
- [ASP.Net MVC route to catch all \*.aspx requests](https://stackoverflow.com/questions/36156496/asp-net-mvc-route-to-catch-all-aspx-requests)
- [【C#】 用 Route 进行 URL 重写 - のんきネコ - 博客园](https://www.cnblogs.com/nonkicat/p/3796590.html)
- [MVC 框架(3)---如何定义 url route](https://blog.csdn.net/shuanger_/article/details/41315643)

```c#
总结：RouteTable只有一个职责，就是构建一个静态单例RouteCollection，RouteCollection是一个泛型类:Collection<RouteBase>。这个RouteCollection用来保存路由规则的集合。
在.NET Framework 4中，微软推出了Route机制。这种机制不仅在MVC中大量运用，在WebForm中也可以使用。
和Contex.RewritePath()一样，Route功能也是写在Global.asax文件中。
```

## 路由代码示例

```c#
 routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

        // never generates a match
        routes.MapRoute(
            name: "ASPXFiles",
            url: "*.aspx",
            defaults: new { controller = "ASPXFiles", action = "Index" }
        );

        // Used to process all other requests (works fine)
        routes.MapRoute(
            name: "Default",
            url: "{controller}/{action}/{id}",
            defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
        );
```
