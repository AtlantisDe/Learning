# Global.asax | HttpApplication

- 全局类
- 事件查看 System.Web.HttpApplication
- [Global.asax 中的方法 - pinko - 博客园](https://www.cnblogs.com/pinko/archive/2013/05/02/3053965.html)
- [ASP.NET： 正在中止线程 错误原及解决方法 - John\_杰 - 博客园](https://www.cnblogs.com/johnblogs/p/8822096.html)

## 1. QuickStart

```c#
// 当前路径
string CurrentMainPath = $"{System.AppDomain.CurrentDomain.BaseDirectory}";
// WEB应用程序,实测会带斜杠结尾
// D:\Work\GitHub\AppSpiderTest\


// 接管
// Set runAllManagedModulesForAllRequests to true in web.config in modules under system.webServer.
<system.webServer>
    <modules runAllManagedModulesForAllRequests="true" />
    ...
</system.webServer>

namespace AppEngine

    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
```

## 2. 事件

```c#
// 再说这两个无顺序的
Application_PreSendRequestHeaders：向客户端发送Http标头之前执行。
Application_PreSendRequestContent：向客户端发送Http正文之前执行。
```

## 3. Context

- [ASP.NET Response.Redirect 使用 302 而不是 301 - 代码日志](https://codeday.me/bug/20180130/126660.html)
- [HttpResponse.ContentType Property (System.Web)](https://docs.microsoft.com/en-us/dotnet/api/system.web.httpresponse.contenttype?view=netframework-4.8)
- [Action Results in Web API 2 - ASP.NET 4.x](https://docs.microsoft.com/en-us/aspnet/web-api/overview/getting-started-with-aspnet-web-api/action-results)
- [ASP.NET： 正在中止线程 错误原及解决方法 - John 杰 - 博客园](https://www.cnblogs.com/johnblogs/p/8822096.html)

```c#
- [try catch中用了 Response.Redirect 引发的线程异常终止 - LoveCoder - 博客园](https://www.cnblogs.com/Jerseyblog/p/5962766.html)
- [HttpResponse.Redirect 方法](https://docs.microsoft.com/zh-cn/dotnet/api/system.web.httpresponse.redirect?redirectedfrom=MSDN&view=netframework-4.8)
// 调用 Redirect 等效于调用 Redirect 并将第二个参数设置为 true。
// Redirect 调用 End 在完成时引发 ThreadAbortException 异常。 此例外会对 Web 应用程序性能产生不利影响。 因此，建议不要使用此重载，而应使用 HttpResponse.Redirect(String, Boolean) 重载，并为 endResponse 参数传递 false，然后调用 CompleteRequest 方法。 有关更多信息，请参见 End 方法。


Context.RewritePath("/index.html");

Context.Response.StatusCode = 301;
Context.Response.Redirect(newUrl, true);
Context.Response.End();


Context.Response.StatusCode = 200;
Context.Response.ContentType = "text/html;charset=utf-8";
Context.Response.Write("请不要恶意解析与请求.");
Context.Response.End();

// 正在中止线程
Context.Response.StatusCode = 401;
Context.Response.ContentType = "text/html;charset=utf-8";
Context.Response.Write("删除!");
//Context.Response.End();
HttpContext.Current.ApplicationInstance.CompleteRequest();


// 注意使用 HttpContext.Current.ApplicationInstance.CompleteRequest() 后面不能使用 return; 再读取文件流时候.

this.Request.Content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("text/plain");
```

## 1. Redirect 重定向

```c#
// 302 临时 重定向
this.Response.Redirect("/Console/LiuxiangJinglingIndex2");

// 302 临时 重定向 指示当前页的执行终止。
this.Response.Redirect("/Console/LiuxiangJinglingIndex2");

// 302 临时 重定向
Context.Response.StatusCode = 301;
Context.Response.Redirect(newUrl, true);
Context.Response.End();
```
