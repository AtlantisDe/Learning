# System.Web.Http.Authorize

- [AuthorizeAttribute Class (System.Web.Http)](<https://docs.microsoft.com/en-us/previous-versions/aspnet/hh834194(v=vs.118)>)
- [HttpApplication.AuthorizeRequest Event (System.Web)](https://docs.microsoft.com/en-us/dotnet/api/system.web.httpapplication.authorizerequest?redirectedfrom=MSDN&view=netframework-4.8)

## 常用

```c#
1. 使用这个配置很简单就是配置下 Web .config 文件即可 FORM

2. Application_AuthenticateRequest 验证状态这里 做个全局变量
[System.Web.Http.Authorize]
public class RegController : ApiController
{

}
```
