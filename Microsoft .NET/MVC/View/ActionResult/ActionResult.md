# ActionResult

- [ActionResult Class (System.Web.Mvc)](https://docs.microsoft.com/en-us/dotnet/api/system.web.mvc.actionresult?view=aspnet-mvc-5.2)
- [MVC 中几种常用 ActionResult](https://blog.csdn.net/qq_42898553/article/details/82976839)
- [如何更改 ASP.NET MVC 控制器返回的 ContentType（的 ActionResult）(How to change returned ContentType in ASP.NET MVC controller (ActionResult))](http://www.it1352.com/270699.html)
- [ActionResult 详解](https://blog.csdn.net/sundna/article/details/91511745)
- [MVC 中几种常用 ActionResult - 小小邪 - 博客园](https://www.cnblogs.com/xielong/p/5940535.html)

```c#
//Response.ContentType = "text/javascript";
Response.AddHeader("Server","Baidu");
return Content("参数有误");

```
