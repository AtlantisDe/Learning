# Context

- [ASP.NET Response.Redirect 使用 302 而不是 301 - 代码日志](https://codeday.me/bug/20180130/126660.html)

```c#
Context.RewritePath("/index.html");

Context.Response.StatusCode = 301;
Context.Response.Redirect(newUrl, true);
Context.Response.End();


Context.Response.StatusCode = 200;
Context.Response.ContentType = "text/html;charset=utf-8";
Context.Response.Write("请不要恶意解析与请求.");
Context.Response.End();

```
