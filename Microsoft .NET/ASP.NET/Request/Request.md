# Request

- [使用 Request 对象实现 get/post 表单传值](https://blog.csdn.net/winycg/article/details/68942517)

```C#
// 不区分大小写获取值
this.Request.QueryString["Action"]
this.Request.QueryString["action"]
var Json = this.Request.Form["Json"];
var Json = this.Request.Form["JSON"];
var user = ""; try { user = this.Request.Form["user"]; } catch (Exception) { }



UrlReferrer = {http://1030.baidu.com/oJFLT/gnavC/x8mxf9.shtml}
Browser = "Chrome"
UserHostAddress = "127.0.0.1"
UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36"
```

## Baike

### 页面请求超时设置

- [ASP.NET 页面请求超时时间设置多种方法(https://www.jb51.net/article/93682.htm)

```c#
System.Web.Configuration.HttpRuntimeSection configSection = new System.Web.Configuration.HttpRuntimeSection();
configSection.ExecutionTimeout = TimeSpan.FromHours(1);
```
