# Microsoft.AspNet.WebApi.Cors

- [Enabling Cross-Origin Requests in ASP.NET Web API 2](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api)

## 常用

```c#
Install-Package Microsoft.AspNet.WebApi.Cors


using System.Web.Http;
namespace WebService
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // New code
            config.EnableCors();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
```

## 配置

### 0. 控制器优先顺序

```c#
If you set the attribute at more than one scope, the order of precedence is:

Action
Controller
Global
```

### 1. 允许任何来源的请求

```c#
var cors = new System.Web.Http.Cors.EnableCorsAttribute("*", "*", "*");
config.EnableCors(cors);

config.EnableCors();

// Allow CORS for all origins. (Caution!)
[EnableCors(origins: "*", headers: "*", methods: "*")]
```
