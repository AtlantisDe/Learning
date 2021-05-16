# ASP.NET

## Github

- [ASP.NET](https://github.com/aspnet)

## 1. 常见报错解决方案

- [网站发布出现“未能找到路径“path\bin\roslyn\csc.exe”....“的解决办法 - EleMMent - 博客园](https://www.cnblogs.com/EleMMent/p/7307263.html)

### 1. 复制项目代码 配置基本 Web Form 认证 出现 重定向次数过多

```c#
原因: 由于新建ASP.NET新项目,未配置路由,配置下即可

routes.MapRoute(
    name: "App",
    url: "App/{controller}/{action}/{id}",
    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
);
```
