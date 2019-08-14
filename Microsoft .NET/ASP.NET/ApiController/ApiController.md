# ApiController

## 常用代码示例

### 代码集合

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

#### POST 单个参数

- [webapi-2 接口参数 - eye_like - 博客园](https://www.cnblogs.com/eye-like/p/9338191.html)

```js
 data: { '': host },

```

```c#
[Route("api/Links/linkitems_newadd")]
[HttpPost]
public Aleseocore.Module.Aleseo.Host.Main.Entity.apipublish linkitemAdd([FromBody]string host)
{
    var root = Aleseocore.Module.siteitem.Util.linkitemAdd(host);
    return root;
}
```
