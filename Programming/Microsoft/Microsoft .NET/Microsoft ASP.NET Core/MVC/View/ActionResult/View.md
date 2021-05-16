# View

- [爱上 MVC~一个 Action 多套 View 模版的设计 - 张占岭 - 博客园](https://www.cnblogs.com/lori/p/6022912.html)

## 常用

```c#
return Content(str);
return Content("测试返回内容");
return Content("Home Index");

return View("参数有误");

@{Layout = null;}@Html.Raw(ViewBag.Html)

ViewData["Main"] = System.IO.File.ReadAllText(System.AppDomain.CurrentDomain.BaseDirectory + @"/wwwroot/AppRoot/Test.html", System.Text.Encoding.UTF8);
@Html.Raw(ViewData["Main"])


// 也可以写在 Action 中
this.ViewData["CommonTest"] = System.IO.File.ReadAllText(System.AppDomain.CurrentDomain.BaseDirectory + @"/wwwroot/AppRoot/Test.html", System.Text.Encoding.UTF8);


ViewBag.CommonTest = System.IO.File.ReadAllText(System.AppDomain.CurrentDomain.BaseDirectory + @"/App/Root/View/Common.Test.cshtml", System.Text.Encoding.UTF8);
<!-- begin 万能综合测试版-->

@Html.Raw(ViewBag.CommonTest)

<!-- end -->
```
