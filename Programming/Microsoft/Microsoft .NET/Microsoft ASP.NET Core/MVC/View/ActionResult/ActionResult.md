# ActionResult

- [ActionResult Class (System.Web.Mvc)](https://docs.microsoft.com/en-us/dotnet/api/system.web.mvc.actionresult?view=aspnet-mvc-5.2)
- [MVC 中几种常用 ActionResult](https://blog.csdn.net/qq_42898553/article/details/82976839)
- [如何更改 ASP.NET MVC 控制器返回的 ContentType（的 ActionResult）(How to change returned ContentType in ASP.NET MVC controller (ActionResult))](http://www.it1352.com/270699.html)
- [ActionResult 详解](https://blog.csdn.net/sundna/article/details/91511745)
- [MVC 中几种常用 ActionResult - 小小邪 - 博客园](https://www.cnblogs.com/xielong/p/5940535.html)
- [Using Asynchronous Methods in ASP.NET MVC 4](https://docs.microsoft.com/en-us/aspnet/mvc/overview/performance/using-asynchronous-methods-in-aspnet-mvc-4)
- [MVC 中几种常用 ActionResult - 小小邪 - 博客园](https://www.cnblogs.com/xielong/p/5940535.html)
- [Controller action return types in ASP.NET Core web API](https://docs.microsoft.com/en-us/aspnet/core/web-api/action-return-types?view=aspnetcore-3.1)

```c#
//Response.ContentType = "text/javascript";
Response.AddHeader("Server","Baidu");
return Content("参数有误");

```

## 异步

- [ASP.NET MVC 什么时候使用异步 Action - Darren Ji - 博客园](https://www.cnblogs.com/darrenji/p/4436764.html)
- [How to return view along with model in Async task in Asp.Net MVC](https://stackoverflow.com/questions/53987939/how-to-return-view-along-with-model-in-async-task-in-asp-net-mvc)
- [Using Asynchronous Methods in ASP.NET MVC 4](https://docs.microsoft.com/en-us/aspnet/mvc/overview/performance/using-asynchronous-methods-in-aspnet-mvc-4)
- [In MVC, how do I return a string result?](https://stackoverflow.com/questions/553936/in-mvc-how-do-i-return-a-string-result)
- [c# — ASP.NET Core API - ActionResult &lt;T&gt; vs Async Task &lt;T&gt;](https://www.it-swarm.dev/es/c%23/asp.net-core-api-actionresult-t-vs-async-task-t/809194904/)

```c#
// 综上，当涉及到调用第三方服务的时候，就可以考虑使用异步Action。async和await是异步编程的2个关键字，async总和Action成对出现，而在调用异步方法之前要加上await关键字。

/// <summary>图片引擎 查看</summary>
public async Task<ActionResult> ReadImage()
{
    return await Task<ActionResult>.Run(() =>
    {
        return base.File(FunDemo(), "image/jpeg");
    });

}


public ActionResult Temp() {
    return Content("Hi there!");
}


return Content("<xml>This is poorly formatted xml.</xml>", "text/xml");

public async Task<IActionResult> AddUser(User user)
 {
      ///Logic to add user
      return await Task.Run(() => View());
 }

return await Task<ActionResult>.Run(() =>
{

});


return Task.Run(() => base.File("".IsUTF8ConvertStringToStream(), "text/plain"));
return Task.Run(() => base.File(rst.Data.Html.IsUTF8ConvertStringToStream(), "text/html;charset=utf-8"));
return Task.Run(() => base.File("一个人写全部的项目累啊!感觉被世界遗忘了.哈哈哈哈.........".IsUTF8ConvertStringToStream(), "text/plain;charset=utf-8"));


return await Task.Run(() => Redirect("https://www.google.com/"));
// 302 临时 重定向
return await Task.Run(() => new System.Web.Mvc.RedirectResult("http://www.google.com", false));
// 301 永久 重定向
return await Task.Run(() => new System.Web.Mvc.RedirectResult("http://www.google.com", true));
```

### 1.Returning a file to View/Download in ASP.NET MVC

- [Returning a file to View/Download in ASP.NET MVC](https://stackoverflow.com/questions/5826649/returning-a-file-to-view-download-in-asp-net-mvc)

```c#
 var cd = new System.Net.Mime.ContentDisposition
{
    FileName = "urls.site.txt",
    Inline = false,
};
Response.AppendHeader("Content-Disposition", cd.ToString());
return base.File(urlText.ToUTF8EncodedBytes(), "application/x-msdownload ; Charset=utf-8");

public ActionResult Download()
{
    var document = ...
    var cd = new System.Net.Mime.ContentDisposition
    {
        // for example foo.bak
        FileName = document.FileName,

        // always prompt the user for downloading, set to true if you want
        // the browser to try to show the file inline
        Inline = false,
    };
    Response.AppendHeader("Content-Disposition", cd.ToString());
    return File(document.Data, document.ContentType);
}
```
