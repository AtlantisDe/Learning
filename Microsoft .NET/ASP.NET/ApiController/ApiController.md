# ApiController

- [asp.net实现阻止用户直接通过url访问文件，实现通过权限访问文件](https://blog.csdn.net/asdfghjkl110292/article/details/96829704)

## 常用代码示例

### 代码集合

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

#### 2. POST 单个参数

- [webapi-2 接口参数 - eye_like - 博客园](https://www.cnblogs.com/eye-like/p/9338191.html)
- [Building a Restful API With ASP.NET Web API](https://www.codeproject.com/Articles/1252477/Building-a-Restful-API-With-ASP-NET-Web-API)
- [这是一种看上去非常正确的写法，可是实际情况是](https://www.jb51.net/article/143201.htm)

```js

通过dynamic动态类型能顺利得到多个参数，省掉了[FromBody]这个累赘，并且ajax参数的传递不用使用"无厘头"的{"":"value"}这种写法，有没有一种小清新的感觉~~有一点需要注意的是这里在ajax的请求里面需要加上参数类型为Json，即contentType: 'application/json',这个属性。

 data: { '': host },

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

- 要点本领:传送数据是 JSON 系化后对象的字符串
- 要点: 发送不成功 原因是:数据类型设置没对

```js
// 要点预览
contentType: 'application/json',
data: JSON.stringify({ NAME: "Jim",DES:"备注" }),
```

```c#
// 后端设计
[Route("api/demo/dynamic")]
[HttpGet]
[HttpPost]
public async Task<Newtonsoft.Json.Linq.JObject> iamdemo(dynamic obj)
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
