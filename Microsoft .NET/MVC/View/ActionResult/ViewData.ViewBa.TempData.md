# ViewData.ViewBa.TempData

- [MVC 中的 ViewData、ViewBag 和 TempData - 如鱼饮水，冷暖自知 - 博客园](https://www.cnblogs.com/Jinfeng1213/p/8600360.html)

```c#
ViewData["main"] = System.IO.File.ReadAllText(System.AppDomain.CurrentDomain.BaseDirectory + @"/Views/Console/1.cshtml", System.Text.Encoding.UTF8);
ViewData["Title"] = "控制台";
@Html.Raw(ViewData["Title"])
filterContext.Controller.ViewData["stopWatch"] = stopWatch;
filterContext.Controller.ViewBag.stopWatch = stopWatch;
```
