# HttpCookie

- Response.Cookies

```c#
HttpCookie hc = new HttpCookie("hello", "Baidu");
hc.Domain = string.Format(".{0}", "");
hc.Expires = DateTime.Now.AddMonths(3);
Response.Cookies.Add(hc);
```

## 常用

### 1. response.cookies.delete

- [How to delete cookie from .Net](https://stackoverflow.com/questions/12116511/how-to-delete-cookie-from-net)

```c#

HttpCookie currentUserCookie = HttpContext.Current.Request.Cookies["currentUser"];
HttpContext.Current.Response.Cookies.Remove("currentUser");
currentUserCookie.Expires = DateTime.Now.AddDays(-10);
currentUserCookie.Value = null;
HttpContext.Current.Response.SetCookie(currentUserCookie);
```

```c#
if (Request.Cookies["currentUser"] != null)
{
    Response.Cookies["currentUser"].Expires = DateTime.Now.AddDays(-1);
}
```
