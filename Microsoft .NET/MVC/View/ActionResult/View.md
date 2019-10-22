# View

- [爱上 MVC~一个 Action 多套 View 模版的设计 - 张占岭 - 博客园](https://www.cnblogs.com/lori/p/6022912.html)

## 常用

```c#
return Content(str);
return View("参数有误");

@{Layout = null;}@Html.Raw(ViewBag.Html)
```
