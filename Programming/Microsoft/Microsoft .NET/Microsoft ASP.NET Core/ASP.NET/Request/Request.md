# Request

- [使用 Request 对象实现 get/post 表单传值](https://blog.csdn.net/winycg/article/details/68942517)

```C#
// 不区分大小写获取值
this.Request.QueryString["Action"]
this.Request.QueryString["action"]
var Json = this.Request.Form["Json"];
var Json = this.Request.Form["JSON"];
var user = ""; try { user = this.Request.Form["user"]; } catch (Exception) { }


// 自写方法区分大小写
alert(GetQueryString("参数名1"));
var guid = GetQueryString("guid")


UrlReferrer = {http://1030.baidu.com/oJFLT/gnavC/x8mxf9.shtml}
Browser = "Chrome"
UserHostAddress = "127.0.0.1"
UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36"
```

## 1. Baike

### 1. 页面请求超时设置

- [ASP.NET 页面请求超时时间设置多种方法(https://www.jb51.net/article/93682.htm)

```c#
System.Web.Configuration.HttpRuntimeSection configSection = new System.Web.Configuration.HttpRuntimeSection();
configSection.ExecutionTimeout = TimeSpan.FromHours(1);
```

### 2. UrlParameter.Optional 说明

- [UrlParameter.Optional&nbsp;说明*月下独酌*新浪博客](http://blog.sina.com.cn/s/blog_540aa4ec01016i9p.html)

```c#
// 1、mvc中的UrlParameter.Optional

routes.MapRoute(
            "Default", // 路由名称
            "{controller}/{action}/{menuid}/{secid}/{cid}", // 带有参数的 URL
            new { controller = "Home", action = "Index", menuid = UrlParameter.Optional, secid = UrlParameter.Optional, cid = UrlParameter.Optional }// 参数默认值
        );
// 2、参数处理
public ActionResult News(string type1,string type2)
{
ViewData["Message1"] = type1;
ViewData["Message2"] = type2";
    return View();
}
```

## 2. Request 相关信息

```c#
log.Information($"{this.Request.UserHostAddress}|{this.Request.UserLanguages}");


// IP地址
this.Request.UserHostAddress
```
