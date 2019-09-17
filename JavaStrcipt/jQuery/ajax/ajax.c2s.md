# ajax.c2s

## 对象设计传输

### 1. JS 对象结构体设计

- 注意:提交必须包含 json 为空的这样格式对象格式

```js
var apiDemoItem_c2s_Valueitems = {
  json: ""
};
apiDemoItem_c2s_Valueitems.Items = {};
apiDemoItem_c2s_Valueitems.Items = { k: "v" };
```

### 2. AJAX 发送 data 对象数据

- 只需要发送 apiDemoItem_c2s_Valueitems 结构体里面

```js
data: {
  Items: Items;
}
```

### 3. 后台服务端设计

```c#
[Route("api/Demo/go")]
[HttpPost]
public apiDemosRootItemRoot Demo(apiDemoItem_c2s_Valueitems apiDemoItem_c2s_Valueitems)
{
    var root = new apiDemosRootItemRoot();
    try
    {
        root = Util.demo(apiDemoItem_c2s_Valueitems);
    }
    catch (Exception ex)
    {
        root.message = ex.Message;
    }
    return root;
}
```
