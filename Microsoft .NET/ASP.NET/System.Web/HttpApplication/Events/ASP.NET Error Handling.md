# ASP.NET Error Handling

## 版本差异捕获信息方法

- 403 常没设置默认首页,设置即可

### 1. ASP.NET Error Handling

- 一定要取消 GlobalFilter 全局过滤器中 HandleErrorAttribute 的注册
- [ASP.NET MVC 中注册 Global.asax 的 Application_Error 事件处理全局异常-十有三博客](https://shiyousan.com/post/635813858052755170)
- [ASP.NET Error Handling](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/aspnet-error-handling)
- [在 Global.asax 中 注册 Application_Error 事件 捕获全局异常 - 可靠的企业级 http 代理/socks5 代理 IP 服务平台](https://www.qingtingip.com/h_273865.html)
- [在 Application_Error 中，无法捕获 403 错误](http://hant.ask.helplib.com/asp.net/post_7015746)
- [9762;&#x4E0E;&#x5F02;&#x5E38;&#x65E5;&#x5FD7;&#x603B;&#x7ED3; - Edi.Wang](https://edi.wang/post/2014/1/11/iis7-aspnet-custom-error-best-practice)
- [ASP.NETMVC自定义错误页面真的简单吗？ - Cameron - 博客园](https://www.cnblogs.com/CameronWu/p/aspnet-mvc-custom-error-pages.html)

```c#
// Set runAllManagedModulesForAllRequests to true in web.config in modules under system.webServer.
<system.webServer>
    <modules runAllManagedModulesForAllRequests="true" />
    ...
</system.webServer>
```

### 2. Global Error Handling in ASP.NET Web API 2

- [Exception Handling in ASP.NET Web API - ASP.NET 4.x](https://docs.microsoft.com/en-us/aspnet/web-api/overview/error-handling/exception-handling)
- [Global Error Handling in ASP.NET Web API 2 - ASP.NET 4.x](https://docs.microsoft.com/en-us/aspnet/web-api/overview/error-handling/web-api-global-error-handling)
- [c# &#8211; Application_Error 在 global.asax 中没有捕获 WebAPI 中的错误 - 代码日志](https://codeday.me/bug/20181017/288281.html)

```c#

```
