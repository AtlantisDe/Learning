# Controller

- 控制器(视图)

## 1. 常用

```c#

return Content("Account Home Index");
return View("Logon");
```

## 2. 视图控制器

### 1. 每个视图上面添加 System.Web.Mvc.WebViewPage

- [Index.cshtml”处的视图必须派生自 WebViewPage 或 WebViewPage&lt;TModel&gt;。 - 刘小吉 - 博客园](https://www.cnblogs.com/liuxiaoji/p/4519196.html)

```c#
// Index.cshtml”处的视图必须派生自 WebViewPage 或 WebViewPage<TModel>。
// 解决方案：
// 1，在每个视图上面添加
@inherits System.Web.Mvc.WebViewPage
// 2，将views中的web.config COPY到新的视图模版文件夹下，就可以了
```
