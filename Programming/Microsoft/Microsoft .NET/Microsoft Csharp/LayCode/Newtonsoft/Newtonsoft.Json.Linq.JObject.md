# Newtonsoft.Json.Linq.JObject

- [ASP.NET 提取多层嵌套 json 数据的方法 - Nullobj - 博客园](https://www.cnblogs.com/feiyuhuo/p/6098065.html)
- [Querying JSON with SelectToken](https://www.newtonsoft.com/json/help/html/SelectToken.htm)

## 常用解析

### 1. 解析:不知道属性名称時

- [遍历 Newtonsoft.Json.Linq.JObject - gust_vip - 博客园](https://www.cnblogs.com/gust/articles/5822055.html)

#### 1. 代码 1

```c#
HtmlContent = JObject?.Value<string>("Bindingname") ?? "其它";



var config = System.IO.File.ReadAllText(oldpath, System.Text.Encoding.UTF8);
var items = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(config);
StringBuilder str = new StringBuilder();
foreach (var item in items)
{
    str.Append(item.Key + ":" + item.Value + ",");
}
var rst = str.ToString();
```

#### 1. 代码 2

```c#
 JObject _jObject = JObject.Parse("{'ID':'001','Mark':'Hello Word'}");

 StringBuilder str = new StringBuilder();

 foreach (var item in _jObject)
 {
     str.Append(item.Key + ":" + item.Value+",");
 }
```

### 2. 解析:知道属性名称 直接用

#### 1. 代码

```c#
 _jObject = JObject.Parse("{'Goods':{'GoodsId':'111',GoodsName:'Adidas'},'Mark':'2589'}");
 var _value = _jObject["Goods"]["GoodsId"].ToString();    //取值 结果 : 111


// 把 JArray 看做是 JObject 的集合，那么遍历就简单了

foreach (JObject items in _JArray)

{  foreach (var item in items)

  {

        str.Append(item.Key + ":" + item.Value + ",");

    }

}
```
