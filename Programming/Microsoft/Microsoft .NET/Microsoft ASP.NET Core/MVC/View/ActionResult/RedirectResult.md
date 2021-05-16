# RedirectResult

- [RedirectResult.ExecuteResult(ControllerContext) Method (System.Web.Mvc)](https://docs.microsoft.com/en-us/dotnet/api/system.web.mvc.redirectresult.executeresult?view=aspnet-mvc-5.2)
- [RedirectResult Class (System.Web.Mvc)](https://docs.microsoft.com/en-us/dotnet/api/system.web.mvc.redirectresult?view=aspnet-mvc-5.2)
- [return new RedirectResult() vs return Redirect()](https://stackoverflow.com/questions/14875894/return-new-redirectresult-vs-return-redirect)
- [How to 301 redirect in ASP.NET 4.0?](https://stackoverflow.com/questions/10673303/how-to-301-redirect-in-asp-net-4-0)

## 常用

```c#
System.Web.Http.Results.RedirectResult
System.Web.Mvc.RedirectResult

return Redirect("http://www.google.com");

return new RedirectResult("http://www.google.com", false);

new System.Web.Mvc.RedirectResult("http://www.google.com", false)

return await Task.Run(() => new System.Web.Mvc.RedirectResult("http://www.google.com", false));


this.Response.Redirect("http://www.microsoft.com/gohere/look.htm");


return await Task.Run(() => Redirect("https://www.google.com/"));
// 302 临时 重定向
return await Task.Run(() => new System.Web.Mvc.RedirectResult("http://www.google.com", false));
// 301 永久 重定向
return await Task.Run(() => new System.Web.Mvc.RedirectResult("http://www.google.com", true));



 /*http 站点重定向 https*/
if (App.Website.WebsiteRequestHttpToHttps.ContainsKey(this.Request.Url.Host))
{
    //301 永久 重定向
    if (this.Request.Url.Scheme.Equals("http"))
    {
        HttpContext.Current.Response.Status = "301 Moved Permanently";
        HttpContext.Current.Response.AddHeader("Location", $"https{this.Request.Url.AbsoluteUri.Substring(4, this.Request.Url.AbsoluteUri.Length - 4)}");return;
    }

    //302 永久 重定向
    if (this.Request.Url.Scheme.Equals("http"))
    {
        this.Response.Redirect($"https{this.Request.Url.AbsoluteUri.Substring(4, this.Request.Url.AbsoluteUri.Length - 4)}",true); return;
    }
}



// Code that runs on every request

if (HttpContext.Current.Request.Url.ToString().ToLower().Contains("http://website.net"))
{
    HttpContext.Current.Response.Status = "301 Moved Permanently";
    HttpContext.Current.Response.AddHeader("Location", Request.Url.ToString().ToLower().Replace("http://website.net", "http://www.website.net"));
}
```
