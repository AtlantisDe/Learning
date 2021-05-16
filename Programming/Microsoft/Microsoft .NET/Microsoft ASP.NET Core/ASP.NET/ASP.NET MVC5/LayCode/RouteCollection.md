# RouteCollection

- [RouteCollection.Add(String, RouteBase) Method (System.Web.Routing)](https://docs.microsoft.com/en-us/dotnet/api/system.web.routing.routecollection.add?view=netframework-4.8)
- [RouteCollection C# (CSharp)代码示例 - HotExamples](https://csharp.hotexamples.com/zh/examples/-/RouteCollection/-/php-routecollection-class-examples.html)
- [RouteCollection.MapPageRoute Method (System.Web.Routing)](https://docs.microsoft.com/en-us/dotnet/api/system.web.routing.routecollection.mappageroute?view=netframework-4.8)
- [Routing &mdash; ASP.NET documentation](https://aspnetcore.readthedocs.io/en/stable/fundamentals/routing.html)

## 常用

```c#
 routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

        routes.MapRoute(
            name: "Student",
            url: "students/{id}",
            defaults: new { controller = "Student", action = "Index"}
        );

        routes.MapRoute(
            name: "Default",
            url: "{controller}/{action}/{id}",
            defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
        );
```

### 1. How do I route images through ASP.NET routing

- [How do I route images through ASP.NET routing?](https://stackoverflow.com/questions/4476170/how-do-i-route-images-through-asp-net-routing)
- [RouteCollection.RouteExistingFiles Property (System.Web.Routing)](https://docs.microsoft.com/en-us/dotnet/api/system.web.routing.routecollection.routeexistingfiles?view=netframework-4.8)
- [Controller in ASP.NET MVC](https://www.tutorialsteacher.com/mvc/mvc-controller)
- [RouteCollection C# (CSharp)代码示例 - HotExamples](https://csharp.hotexamples.com/zh/examples/-/RouteCollection/-/php-routecollection-class-examples.html)
- [Route URL Request Using RouteExistingFiles in MVC4](https://www.c-sharpcorner.com/UploadFile/97fc7a/route-url-request-using-routeexistingfiles-in-mvc4/)
- [routes.RouteExistingFiles does nothing, very confused](https://forums.asp.net/t/1878807.aspx?routes+RouteExistingFiles+does+nothing+very+confused)
- [Is it possible to return image in web api](https://forums.asp.net/t/1822496.aspx?Is+it+possible+to+return+image+in+web+api)
- [How To Return An Image Result From Web API Using .NET Core](https://www.c-sharpcorner.com/article/how-to-return-an-image-result-from-web-api-using-net-core/)
- [Serving URLs with File Extensions in an ASP.NET MVC Application](https://weblog.west-wind.com/posts/2015/nov/13/serving-urls-with-file-extensions-in-an-aspnet-mvc-application)

```c#

public ActionResult ReadImage()
{
    FileStreamResult result = new FileStreamResult(@"D:\Tmp\ICO\1\Paint_Tool_Sai_128px_572486_easyicon.net.ico".FileToStream(), "image/png");
    return result;
}


/// <summary>图片测试</summary>
[Route("api/image/{img}")]
[HttpGet]
public HttpResponseMessage Image(string img)
{
    HttpResponseMessage response = new HttpResponseMessage();
    response.Content = new StreamContent(FileToStream(@"D:\Tmp\ICO\1\Paint_Tool_Sai_128px_572486_easyicon.net.ico"));
    response.Content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("image/png");
    return response;
}

public HttpResponseMessage GetImage()
{
    HttpResponseMessage response = new HttpResponseMessage();
    response.Content = new StreamContent(new FileStream(@"path to image")); // this file stream will be closed by lower layers of web api for you once the response is completed.
    response.Content.Headers.ContentType = new MediaTypeHeaderValue("image/png");

    return response;
}

routes.MapRoute(
      name: "tt",
      url: "{*src}",
        defaults: new { controller = "Home", action = "Contact", id = UrlParameter.Optional },
       constraints: new { src = @"(.*?)\.(html|htm|aspx|asp|jpg)" },
       namespaces: new string[] { "XXX" }
         );
```

### 1. APi 下载文件 Demo

- [How to Return Files From Web API](https://www.c-sharpcorner.com/article/sending-files-from-web-api/)

```c#

```

### 2. 强制所有请求走管道 runAllManagedModulesForAllRequests

```c#
  <system.webServer>
    <modules runAllManagedModulesForAllRequests="true" />
  </system.webServer>
```
