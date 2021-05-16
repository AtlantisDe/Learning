# Cookie

- [Sharing ASP.NET cookies across sub-domains](https://stackoverflow.com/questions/7589630/sharing-asp-net-cookies-across-sub-domains)

## 设置 Cookie

### 1. 设置所有子域名 Cookie

```c#
set the property of Domain to ".mydomain.com" in each Cookies of two subdomains websites

like

Response.Cookies["test"].Value = "some value";
Response.Cookies["test"].Domain = ".mysite.com";
UPDATE 1

// in Site

HttpCookie hc = new HttpCookie("strName", "value");
hc.Domain = ".mydomain.com"; // must start with "."
hc.Expires = DateTime.Now.AddMonths(3);
Response.Cookies.Add(hc);


HttpCookie hc = new HttpCookie("strName", "value");
hc.Domain = ".mydomain.com"; // must start with "."
hc.Expires = DateTime.Now.AddMonths(3);
HttpContext.Current.Response.Cookies.Add(hc);

// In Site B

HttpContext.Current.Request.Cookies["strName"].Value
Try It

Regards
```
