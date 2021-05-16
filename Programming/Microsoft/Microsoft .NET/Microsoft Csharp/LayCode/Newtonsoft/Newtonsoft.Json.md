# Newtonsoft.Json

- [Newtonsoft.Json 12.0.3](https://www.nuget.org/packages/Newtonsoft.Json)
- [Getting Title at 30:27](https://github.com/JamesNK/Newtonsoft.Json/issues/138)

```c#
Newtonsoft.Json
Install-Package Newtonsoft.Json -Version 12.0.3
```

## 常用

```c#
var jObject = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(Newtonsoft.Json.JsonConvert.SerializeObject(jObject));
var doubleSecurityLog = Newtonsoft.Json.JsonConvert.DeserializeObject<DoubleSecurityLog>(Newtonsoft.Json.JsonConvert.SerializeObject(jObject));

Newtonsoft.Json.JsonConvert.DeserializeObject<T>(html);
Newtonsoft.Json.JsonConvert.SerializeObject(obj);
var jObject = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(html);
var items = jObject["list"].Values<string>();
foreach (var item in items)
{
    var a = item;
}
items.ToArray();
items.ToList();

var jArray = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JArray>(html);

HtmlContent = JObject?.Value<string>("Bindingname") ?? "其它";

```

### 0. 常用判断遍历类型

```c#
foreach (var item in jArray1)
{
    switch (item.GetType().Name)
    {
        case "JValue":
            break;
        case "JArray":
            break;
    }
}

```

### 1. JArray

```c#
// Newtonsoft.Json.Linq.JArray


var a = item.Parent;
var b = a?.Parent;
var c = b?.Parent;
var d = c?.Parent;
var e = d?.Parent;
var f = e?.Parent;


var Lv1 = f?[0]?[0] ?? "";
var Lv2 = e?[0] ?? "";
var Lv3 = d?[0]?[0] ?? "";
var Lv4 = c?[0]  ?? "";
var Lv5 = b?[0]?[0] ?? "";
var Lv6 = a?[0] ?? "";

items.Add($"{Lv2}|{Lv4}|{Lv6}|{hQNodesItem3.EnName}");

```

### 2. JToken

- [Parsing all JSON using JToken.Parse](https://www.newtonsoft.com/json/help/html/ParseJsonAny.htm)
- [JToken 的层次结构 sarah_shao](https://blog.csdn.net/sarah_shao/article/details/94620464)

```c#
// Newtonsoft.Json.Linq.JToken
// JToken  用于存放Linq to JSON查询后的结果
var jToken = jArray[0];

```

### 3. JValue

- [Using JValue.Value](https://www.newtonsoft.com/json/help/html/JValueValue.htm)

```c#
JValue s = new JValue("A string value");

Console.WriteLine(s.Value.GetType().Name);
// String
Console.WriteLine(s.Value);
// A string value

JValue u = new JValue(new Uri("http://www.google.com/"));

Console.WriteLine(u.Value.GetType().Name);
// Uri
Console.WriteLine(u.Value);
// http://www.google.com/

```
