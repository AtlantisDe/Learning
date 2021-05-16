# Web Api

## 常用接口

### 1. LayUI 分页接口

```c#
//API接口层
namespace Demo.Controllers.App.Console.Api.Demoitems
{
    [Authorize]
    public class DemoitemsController : ApiController
    {
        [Route("api/Demoitems/all")]
        [HttpGet]
        [HttpPost]
        public Demo.Module.PublicTools.ApiBase.apiDemoitems Demoitems(int page, int limit)
        {
            var root = Demo.Module.PublicTools.Util.Demoitems(page, limit);

            return root;
        }
    }
}
//静态方法层
public static Demo.Module.PublicTools.ApiBase.apiDemoitems Demoitems(string host, int page, int limit)
{

}
```
