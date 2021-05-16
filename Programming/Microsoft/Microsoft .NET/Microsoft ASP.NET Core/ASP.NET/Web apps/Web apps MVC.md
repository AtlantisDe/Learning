# Web apps MVC

- [Overview of ASP.NET Core MVC](https://docs.microsoft.com/en-us/aspnet/core/mvc/overview?view=aspnetcore-5.0)

## 三层文件夹

```c#
Controllers 可存放视图控制器 API控制器
Models
Views

解决方案文件夹名称示范:
0.Tookits
Google.Common.Utils
Google.Tookits
1.Entity

3.DAL

```

## 路由器 Routing

- [Routing to controller actions in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/mvc/controllers/routing?view=aspnetcore-5.0)

```c#
routes.MapRoute(name: "Default", template: "{controller=Home}/{action=Index}/{id?}");
```
