# Request

- [使用 Request 对象实现 get/post 表单传值](https://blog.csdn.net/winycg/article/details/68942517)

```C#
// 不区分大小写获取值
this.Request.QueryString["Action"]
this.Request.QueryString["action"]
var Json = this.Request.Form["Json"];
var Json = this.Request.Form["JSON"];
var user = ""; try { user = this.Request.Form["user"]; } catch (Exception) { }
```
