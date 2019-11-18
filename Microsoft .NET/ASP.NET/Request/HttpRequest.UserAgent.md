# HttpRequest.UserAgent

- [HttpRequest.UserAgent Property (System.Web)](https://docs.microsoft.com/en-us/dotnet/api/system.web.httprequest.useragent?view=netframework-4.8)
- [Error Happened](https://www.w3school.com.cn/jsref/prop_nav_useragent.asp)
- [ajax 中的 setRequestHeader 设置请求头 - 暗语 321 - 博客园](https://www.cnblogs.com/cdwp8/p/5157377.html)
- [常用浏览器 User-Agent 大全-PC 浏览器 user-agent-手机浏览器 user-agent](http://www.jsons.cn/useragent/)

## Examples

- Gets the raw user agent string of the client browser that has been provided. Please note it may be null.

```c#
String userAgent;
userAgent = Request.UserAgent;
if (userAgent.IndexOf("MSIE 6.0") > -1)
{
   // The browser is Microsoft Internet Explorer Version 6.0.
}
```

## JS

```c#
navigator.userAgent
```

## Page

```c#
if(this.Request.UserAgent.ContainsCase("bot") == true)
{

}
```
