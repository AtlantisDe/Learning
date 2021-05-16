# ASP.NET Core

- .NET Core 是微软开发出的另一个可以跨 Linux、Windows、Mac OS 等平台的.NET。
- ASP.NET Core 是一个跨平台的高性能开源框架，用于生成基于云且连接 Internet 的新式应用程序。

- [ASP.NET Core 简介](https://docs.microsoft.com/zh-cn/aspnet/core/?view=aspnetcore-2.2)
- [ASP.NET Core 概述](https://baijiahao.baidu.com/s?id=1607601165004945962&wfr=spider&for=pc)
- [ASP.NET Core 入门](https://docs.microsoft.com/zh-cn/aspnet/core/getting-started/?view=aspnetcore-2.2&tabs=macos)
- [ASP.NET Core 开发 - Entity Framework (EF) Core - LineZero - 博客园](https://www.cnblogs.com/linezero/p/EntityFrameworkCore.html)
- [使用.NET Core 快速开发一个较正规的命令行应用程序 - KAnts - 博客园](https://www.cnblogs.com/ants/p/8615958.html)
- [.NET Core 跨平台的奥秘[下篇]：全新的布局 - Artech - 博客园](https://www.cnblogs.com/artech/p/7812811.html)
- [[讨论] .net core 软件也能反编译吗?](https://www.52pojie.cn/thread-740204-1-1.html)

## 1. Download .NET Core

## 2. Github

- [aspnet/AspNetCore](https://github.com/aspnet/AspNetCore)
- [.NET Core Community](https://github.com/dotnetcore)
- [OrchardCMS/OrchardCore](https://github.com/OrchardCMS/OrchardCore)
- [OrchardCMS/OrchardCore](https://github.com/OrchardCMS/OrchardCore)
- [SeriaWei/ZKEACMS](https://github.com/SeriaWei/ZKEACMS)
- [dotnet/orleans](https://github.com/dotnet/orleans)
- [XiaoFaye/WooCommerce.NET](https://github.com/XiaoFaye/WooCommerce.NET)
- [MichaCo/CacheManager](https://github.com/MichaCo/CacheManager)
- [ThreeMammals/Ocelot](https://github.com/ThreeMammals/Ocelot)
- [StackExchange/Dapper](https://github.com/StackExchange/Dapper)
- [NLog/NLog](https://github.com/NLog/NLog)

## 1. QuickStart

```c#

```

## 2. aspNetCore 调试

- [在 ASP.NET Core 中使用多个环境](https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/environments?view=aspnetcore-5.0)

```c#
// aspNetCore
ASPNETCORE_ENVIRONMENT Development
ASPNETCORE_HOSTINGSTARTUPASSEMBLIES Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation
```

## 3. Wiki

```c#

```

### 1. ASP.NET Core 访问 wwwroot 下的文件

- [ASP.Net Core MVC: Read Files from wwwroot Directory in Controller](https://www.aspsnippets.com/Articles/ASPNet-Core-MVC-Read-Files-from-wwwroot-Directory-in-Controller.aspx)
- [ASP.NET Core 访问 wwwroot 下的文件 - Kyle0418 - 博客园](https://www.cnblogs.com/jizhiqiliao/p/13097973.html)
- [Get image from wwwroot/images in ASP.Net Core](https://stackoverflow.com/questions/42587428/get-image-from-wwwroot-images-in-asp-net-core)
- [Error Happened](https://mariusschulz.com/blog/getting-the-web-root-path-and-the-content-root-path-in-asp-net-core)

```c#
private readonly Microsoft.AspNetCore.Hosting.IWebHostEnvironment _env;

public HomeController(Microsoft.AspNetCore.Hosting.IWebHostEnvironment env)
{
    _env = env;
}

 this.Request.PathBase


 string path =  $"{Directory.GetCurrentDirectory()}{@"\wwwroot\images"}";

// C:\Users\all\source\repos\mvcpoc\bin\Debug\netcoreapp3.1\
string projectRootPath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
string projectRootPath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;

namespace AspNetCorePathMapping
{
    public class HomeController : Controller
    {
        private readonly IWebHostEnvironment _env;

        public HomeController(IWebHostEnvironment env)
        {
            _env = env;
        }

        public ActionResult Index()
        {
            string contentRootPath = _env.ContentRootPath;
            string webRootPath = _env.WebRootPath;

            return Content(contentRootPath + "\n" + webRootPath);
        }
    }
}


// IHostingEnvironment在未来的版本中将不再支持，所以建议使用IWebHostEnvironment。

private readonly IWebHostEnvironment _hostingEnvironment;
public ConsoleController(IWebHostEnvironment hostingEnvironment)
{
    _hostingEnvironment = hostingEnvironment;

}

/// <summary>About Resume</summary>
public IActionResult Resume()
{
    var path = System.IO.Path.Combine(_hostingEnvironment.WebRootPath, "images", $"{id}.jpg");
    var imageFileStream = System.IO.File.OpenRead(path);
    return File(imageFileStream, "image/jpeg");

    //return View(@"\Areas\AppView\Resume.cshtml");
}


private readonly IHostingEnvironment env;
public HomeController(IHostingEnvironment env)
{
    this.env = env;
}

public IActionResult About(Guid foo)
{
    var path = env.WebRootFileProvider.GetFileInfo("images/foo.png")?.PhysicalPath
}



[Route("api/[controller]")]
public class GalleryController : Controller
{
    private readonly IHostingEnvironment _hostingEnvironment;
    public GalleryController(IHostingEnvironment hostingEnvironment)
    {
        _hostingEnvironment = hostingEnvironment;
    }

    // GET api/<controller>/5
    [HttpGet("{id}")]
    public IActionResult Get(int id)
    {
        var path = Path.Combine(_hostingEnvironment.WebRootPath, "images", $"{id}.jpg");
        var imageFileStream = System.IO.File.OpenRead(path);
        return File(imageFileStream, "image/jpeg");
    }
}


public IActionResult Resume()
{
    var path = System.IO.Path.Combine(_hostingEnvironment.WebRootPath, "AppRoot/Hr/", "2021.html");
    var imageFileStream = System.IO.File.OpenRead(path);
    return File(imageFileStream, "text/html");
}

```

### 2. 路由

- [ASP.NET Core 中的路由](https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/routing?view=aspnetcore-6.0)
- [ASP.NET Core 中的路由](https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/routing?view=aspnetcore-5.0)
- [ASP.Net Core 2.2 Upgrade - Default Route Redirection Issue](https://stackoverflow.com/questions/54238006/asp-net-core-2-2-upgrade-default-route-redirection-issue)

```c#
public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
    if (env.IsDevelopment())
    {
        app.UseDeveloperExceptionPage();
    }

    app.UseRouting();

    app.UseEndpoints(endpoints =>
    {
        endpoints.MapGet("/", async context =>
        {
            await context.Response.WriteAsync("Hello World!");
        });
    });


    endpoints.MapGet("/Console/1.png", context =>
    {
        context.Response.Redirect("/AppRoot/2.png");
        return Task.CompletedTask;
    });

}
```

### 3. 编码问题

- [.NET Core 中使用 GB2312 编码 - 码农教程](http://www.manongjc.com/detail/14-bvoslujamyexzas.html)
- [.net core 中使用 GB2312 编码的问题 - 猎美 - 博客园](https://www.cnblogs.com/liemei/p/7884172.html)

```c#
Install-Package System.Text.Encoding.CodePages

// 在使用GB2312编码前需要先使用Encoding.RegisterProvider方法注册
//先执行这个，不然使用GB2312报错
Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);


Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
var path = System.IO.Path.Combine(_hostingEnvironment.WebRootPath, "AppRoot/Test/", "Test.2021.html");
this.ViewData["Main"] = System.IO.File.ReadAllText(path, System.Text.Encoding.GetEncoding("GB2312"));


```
