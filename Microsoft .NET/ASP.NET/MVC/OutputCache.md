# OutputCache

- MVC 之 缓存机制
- [Improving Performance with Output Caching (C#)](https://docs.microsoft.com/en-us/aspnet/mvc/overview/older-versions-1/controllers-and-routing/improving-performance-with-output-caching-cs)
- [MVC 之 缓存机制（一） - Now,DayBreak - 博客园](https://www.cnblogs.com/xinaixia/p/6548587.html)
- [asp.net mvc 清除视图缓存 - yanggm - 博客园](https://www.cnblogs.com/yanggm/archive/2013/01/15/2861133.html)
- [Asp.Net MVC 缓存 - JoeSnail - 博客园](https://www.cnblogs.com/JoeSnail/p/7993903.html)

## 缓存配置

### 0. 缓存常用代码示例

```c#
[OutputCache(Duration = 3600, VaryByParam = "none", Location = System.Web.UI.OutputCacheLocation.Client)]
```

### 1. 缓存

- Creating a Cache Profile
- Listing 6 – Caching section for web.config

```xml
<caching>
<outputCacheSettings>
    <outputCacheProfiles>
        <add name="Cache1Hour" duration="3600" varyByParam="none"/>
    </outputCacheProfiles>
</outputCacheSettings>
</caching>
```

- Listing 7 – Controllers\ProfileController.cs

```C#
using System;
using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class ProfileController : Controller
    {
        [OutputCache(CacheProfile="Cache1Hour")]
        public string Index()
        {
            return DateTime.Now.ToString("T");
        }
    }
}
```

### 2.缓存 DEMO2

```c#
using System.Web.Mvc;
using System.Web.UI；

namespace MvcApplication1.Controllers
{
    public class HomeController : Controller
    {
        //缓存时间10秒，缓存变量为无，缓存位置为服务端
        [OutputCache(Duration=10, VaryByParam="none"， Location = OutputCacheLocation.Server)]
        public ActionResult Index()
        {
            return View();
        }
    }
}
```
