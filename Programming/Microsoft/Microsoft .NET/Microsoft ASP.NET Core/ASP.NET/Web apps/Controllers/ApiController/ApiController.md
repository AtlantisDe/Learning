# ApiController

- [asp.net 实现阻止用户直接通过 url 访问文件，实现通过权限访问文件](https://blog.csdn.net/asdfghjkl110292/article/details/96829704)
- [Content Negotiation in ASP.NET Web API - ASP.NET 4.x](https://docs.microsoft.com/en-us/aspnet/web-api/overview/formats-and-model-binding/content-negotiation)
- [Format response data in ASP.NET Core Web API](https://docs.microsoft.com/en-us/aspnet/core/web-api/advanced/formatting?view=aspnetcore-3.0)
- [Add custom header to all responses in Web API](https://stackoverflow.com/questions/20349447/add-custom-header-to-all-responses-in-web-api)

## 1. QuickStart

```c#

```

### 1. 接口数据格式 FromForm FromBody

```c#
// 前端对应:@param bool isForm 数据格式
public IEnumerable<OrderFoodApp.Model.CaiPin> CaiPinItems([FromForm] string caiPinCategoryId)

```

## 1. 常用代码示例

### 1. 代码集合

```c#
public class ValuesController : ApiController
{
    public IHttpActionResult Get()
    {
        return new TextResult("hello", Request);
    }
}
```

#### 0. 常用 API 参数写法

```c#
GET请求情况下,参数名称对应上即可.


POET情况下,参数形式为 [FromBody]string host

// 通过dynamic动态类型能顺利得到多个参数，省掉了[FromBody]这个累赘，并且ajax参数的传递不用使用"无厘头"的{"":"value"}这种写法，有没有一种小清新的感觉~~有一点需要注意的是这里在ajax的请求里面需要加上参数类型为Json，即contentType: 'application/json',这个属性。

post 方式总结

// (1)Post参数传递本身是在Request-Body内传递，而Get参数传递本质是url拼接；

// (2)Post参数传递不是key/value形式，而Get参数是key/value形式；

// (3)Post传递参数时，无论是单个参数还是对象，均借助[FromBody]特性(当然，某些情况去掉[FromBody]特性也可把值传递进去，但为了规范化，尽量加上该特性)；

// (4)Post没长度限制，而Get有长度限制(一般为1024b);

// (5)Post相对Get，较安全；

// (6)Post操作相当于DB的Insert操作；
```

#### 1. GET 带对应参数写法

```c#
[Route("api/Links/linkitems/{host}/{page}/{limit}")]
[HttpGet]
public apilinkitems linkitems(string host, int page, int limit)
{

}

// 127.0.0.1:1120/api/Links/linkitemspage?id=2&name=9

[Route("api/Links/linkitemspage")]
[HttpGet]
public string para_get_base(string id, string name)
{
    return "id:" + id + "   name:" + name;
}
```

```c#
// 请求接口
// AJAX GET 写法

layui.$.ajax({
  type: "GET",
  url: "/api/demo/edit",
  dataType: "Json",
  data: "guid=" + guid,
  cache: false,
  async: true,
  success: function (data) {
    if (data.code == 200) {
      WebSiteconfig = data.Expando.Demo;
      layui.form.val("Div_Demo_form", WebSiteconfig);

      btn_for_divform("Div_Demo_form", "btn_save", true);

      layer.alert(
        data.message,
        {
          skin: "layui-layer-molv",
          closeBtn: 0,
        },
        function () {
          layer.close(layer.index);
        }
      );
    } else {
      layer.alert(
        data.message,
        {
          skin: "layui-layer-molv",
          closeBtn: 0,
        },
        function () {
          layer.close(layer.index);
        }
      );
    }
  },
  complete: function (data) {
    layer.closeAll("loading");
  },
});
```

#### 2. POST 单个参数

- [webapi-2 接口参数 - eye_like - 博客园](https://www.cnblogs.com/eye-like/p/9338191.html)
- [Building a Restful API With ASP.NET Web API](https://www.codeproject.com/Articles/1252477/Building-a-Restful-API-With-ASP-NET-Web-API)
- [这是一种看上去非常正确的写法，可是实际情况是](https://www.jb51.net/article/143201.htm)

```c#


// 通过dynamic动态类型能顺利得到多个参数，省掉了[FromBody]这个累赘，并且ajax参数的传递不用使用"无厘头"的{"":"value"}这种写法，有没有一种小清新的感觉~~有一点需要注意的是这里在ajax的请求里面需要加上参数类型为Json，即contentType: 'application/json',这个属性。

data: { '': host },
// 形式太难看直接推荐 JObject设计

```

```c#
[Route("api/Links/linkitems_newadd")]
[HttpPost]
public DemoCore.Module.DemoTest.Host.Main.Entity.apipublish linkitemAdd([FromBody]string host)
{
    var root = DemoCore.Module.siteitem.Util.linkitemAdd(host);
    return root;
}
```

#### 3. dynamic 设计

> 1. 要点本领:传送数据是 JSON 系化后对象的字符串
> 2. 要点: 发送不成功 原因是:数据类型设置没对
> 3. contentType: "application/json", 必须配置原始数据类型是 JSON
> 4. 接收参数设置为 (dynamic obj) 传递进入方法层参数配置为非弱类型参数: (object)obj

```c#
// 要点预览
dataType: "json",
contentType: "application/json",
data: JSON.stringify({ NAME: "Jim",DES:"备注" }),
```

```c#
// 后端设计
[Route("api/demo/dynamic/set")]
[HttpGet]
[HttpPost]
public Newtonsoft.Json.Linq.JObject Demo_Set(dynamic obj)
{
    var root = Demo.Set((object)obj).ObjToJObject();
    return root;
}

[Route("api/demo/dynamic")]
[HttpGet]
[HttpPost]
public async Task<Newtonsoft.Json.Linq.JObject> IamDemo(dynamic obj)
{
    return await Task.Run(() =>
    {
        Newtonsoft.Json.Linq.JObject jObject = new Newtonsoft.Json.Linq.JObject();

        jObject.Add("demo", "yes");
        jObject.Add("json", Newtonsoft.Json.JsonConvert.SerializeObject(obj));

        return jObject;
    });
}
// 前端请求设计

function fun_dynamicDemoGo() {
  layer.load();

  layui.$.ajax({
    type: "POST",
    url:
      "http://" + host + "/api/site/subSiteconfig/set?hostToken=" + localStorage.getItem("hostToken"),
    dataType: "json",
    contentType: "application/json",
    data: JSON.stringify({ NAME: "Jim", DES: "备注" }),
    cache: false,
    async: true,
    success: function(data) {
      layer.closeAll("loading");
      if (data.code == 200) {
        layer.msg(data.message, function() {});
      } else {
        layer.alert(data.message, { icon: 6 });
      }
    }
  });
}

// POSTman 调试请用Request Payload 发送
```

#### 4. dynamic 设计应用

```c#
// 请求接口

        [Route("api/demo/get")]
        [HttpGet]
        [HttpPost]
        public async Task<Newtonsoft.Json.Linq.JObject> GetDynamic()
        {
            return await Task.Run(() =>
            {
                return DemoMain.FunTest().Result.ObjToJObject();
            });
        }


    //刷新通行域名
    public async static Task<ApiPublishDynamic> FunTest()
    {

        return await Task.Run(() =>
        {
            var root = new ApiPublishDynamic
            {
                Expando = new ExpandoObject(),
                code = -1,
                message = "结果未知!"
            };

            try
            {

                using (HttpClient client = new HttpClient())
                {
                    try
                    {
                        Task<HttpResponseMessage> response = client.GetAsync("http://127.0.0.1:61515/FunTest");
                        response.Wait();
                        if (response.Result != null)
                        {
                            var rst = response.Result;
                            if (rst.IsSuccessStatusCode)
                            {
                                root.code = 200;
                                root.message = string.Format("刷新通行证成功![{0}]", rst.Content.ReadAsStringAsync().Result);
                            }
                        }
                    }
                    catch (HttpRequestException e)
                    {
                        Console.WriteLine("\nException Caught!");
                        Console.WriteLine("Message :{0} ", e.Message);

                        root.code = 3;
                        root.message = e.Message;

                    }
                }




            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));

                root.code = 100;
                root.message = string.Format("异常[{0}]", ex.Message + "\r\n");


            }
            finally
            {
            }


            return root;



        });



    }


// JS应用

if (data.code == 200)
{
    DemoConfig = data.Expando.DemoConfig;
    layui.form.val("Div_Demo_form", DemoConfig);
    layer.msg(data.message, function() {});
}
else
{
    layer.alert(data.message, { icon: 6 });
}

```

#### 5. Specify a format

```C#
[ApiController]
[Route("[controller]")]
[Produces("application/json")]
public class WeatherForecastController : ControllerBase
{
}
```

#### 6. JObject 设计使用

```C#
1. API 参数接口:

var doubleSecurityLog = Newtonsoft.Json.JsonConvert.DeserializeObject<DoubleSecurityLog>(Newtonsoft.Json.JsonConvert.SerializeObject(jObject));
// (Newtonsoft.Json.Linq.JObject JObject) /*前端不影响后端接收*/

/// <summary>推送配置配置类 保存</summary>
[System.Web.Http.AllowAnonymous]
[Route("api/DoubleSecurityLogSave")]
[HttpPost]
public ServiceResult DoubleSecurityLogSave(Newtonsoft.Json.Linq.JObject jObject)
{
    var doubleSecurityLog = Newtonsoft.Json.JsonConvert.DeserializeObject<Models.FsWatcher.DoubleSecurityLog>(Newtonsoft.Json.JsonConvert.SerializeObject(jObject));

    return App.Driver.Save(doubleSecurityLog);
}

2. AJAX端口发送参数直接发送对象:

dataType: "json", data: AppConfigs, 样本: dataType: "Json",data: { Path: obj.data.Path },

// 发送样本 组装成一个实体对象
{ "GuidsText": "123" }
{ "GuidsText": GuidsText }
```

#### 7. Api 接口无限制 有权限去访问 AllowAnonymous

```C#
 /// <summary>随机读取一条数据</summary>
[Route("api/Demo")]
[HttpGet]
[AllowAnonymous]
```

#### 8. POST 多参数

- [Web Api 几点注意事项（Post 传递多个参数、ApiController 多个 Action 函数）](https://ityouzi.com/archives/2330.html)

```c#
// 单个参数的传递就可以参考官方的方法，但是如果有多个参数就不能在后面定义多个基本数据类型了。
public void Post([FromBody]string value)
{
}

public void Post([FromBody]Newtonsoft.Json.Linq.JObject jObject)
{
}

// 正式接口设计 后端

/// <summary>万能综合版 分页 查询</summary>
[Route("api/StockZhbs")]
[HttpPost]
public Dot.Net.Common.Engine.Service.Models.ServiceResult StockZhbs([FromBody]Newtonsoft.Json.Linq.JObject postJObject)
{
    var pageIndex = postJObject.Value<string>("pageIndex").ToInt32(1);
    var pageSize = postJObject.Value<string>("pageIndex").ToInt32(10);
    var jObjectText = postJObject.Value<string>("jObjectText") ?? "";
    var jObject = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(jObjectText);

    return Demo.Driver.StockZhbs(pageIndex, pageSize, jObject);
}

// 正式接口设计 前端端


/**万能综合版 分页 查询 */
function FunStockZhbs() {
    //console.log(enumId);

    if (TableIns.StockZhbs != null) {
        TableIns.StockZhbs.reload({
            where: { jObjectText: JSON.stringify({ aa: 123 }) },
            page: { curr: 1 },
        });
        return;
    }


    TableIns.StockZhbs = layui.table.render({
        elem: "#StockZhbs",
        method: "post",
        url: "/api/StockZhbs",
        where: { jObjectText: JSON.stringify({ aa: 123 }) },
        request: { pageName: 'pageIndex', limitName: 'pageSize' },
        //toolbar: "#ToolbarStockZhbs",
        title: "万能综合版",
        totalRow: false,
        limits: [10, 20, 100, 150, 200, 300, 600, 1000, 1500, 2000, 5000],
        cols: [
            [
                { type: "checkbox" },
                { field: "Id", width: 80, title: "编号", sort: true, templet: function (d) { return d.LAY_TABLE_INDEX + 1; } },

                //{ fixed: "right", title: "操作", toolbar: "#RowbarStockZhbs", width: 380 },
            ]
        ],
        page: true,
        limit: 10,
        done: function (res, curr, count) {
            layui.element.tabChange("TabNameStockZhbs", "TabIdStockZhbs");

        },
        parseData: function (responseJSON) {
            return {
                "code": responseJSON.ResultCode,
                "msg": responseJSON.Message,
                "count": responseJSON.Data.Total,
                "data": responseJSON.Data.Items
            };
        }
    });
}


```
