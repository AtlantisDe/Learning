# Context

- [ASP.NET Response.Redirect 使用 302 而不是 301 - 代码日志](https://codeday.me/bug/20180130/126660.html)
- [HttpResponse.ContentType Property (System.Web)](https://docs.microsoft.com/en-us/dotnet/api/system.web.httpresponse.contenttype?view=netframework-4.8)
- [Action Results in Web API 2 - ASP.NET 4.x](https://docs.microsoft.com/en-us/aspnet/web-api/overview/getting-started-with-aspnet-web-api/action-results)

```c#
Context.RewritePath("/index.html");

Context.Response.StatusCode = 301;
Context.Response.Redirect(newUrl, true);
Context.Response.End();


Context.Response.StatusCode = 200;
Context.Response.ContentType = "text/html;charset=utf-8";
Context.Response.Write("请不要恶意解析与请求.");
Context.Response.End();


this.Request.Content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("text/plain");
```
