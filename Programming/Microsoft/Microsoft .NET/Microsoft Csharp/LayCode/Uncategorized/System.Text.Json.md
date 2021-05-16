# System.Text.Json

- [System.Text.Json 命名空间](https://docs.microsoft.com/zh-cn/dotnet/api/system.text.json?view=net-5.0)
- [[译]试用新的 System.Text.Json API - WAKU - 博客园](https://www.cnblogs.com/waku/p/11026630.html)
- [C# 通过 Dynamic 访问 System.Text.Json 对象 - 非法关键字 - 博客园](https://www.cnblogs.com/linxmouse/p/14075049.html)

```c#

```

## 0. Installation

```c#
System.Text.Json
```

## 1. QuickStart

- [.NETCore3.1 中的 Json 互操作最全解读-收藏级 - Ron.Liang - 博客园](https://www.cnblogs.com/viter/p/12116640.html)

```c#
using System.Text.Json;
string s = JsonSerializer.Serialize(object);
var obj = JsonSerializer.Deserialize<T>(string);



var jsonStr = "{\"CaiPinCode\":\"001\",\"CaiPinName\":\"海鲜\"}";

var jsonDocument = System.Text.Json.JsonSerializer.Deserialize<System.Text.Json.JsonDocument>(jsonStr);


string reqCode = jsonDocument.RootElement.GetProperty("CaiPinCode").GetString();

jsonDocument.RootElement.TryGetProperty("CaiPinCode", out var CaiPinCode);

jsonDocument.RootElement.TryGetProperty("CaiPinCode0", out var CaiPinCode0);
jsonDocument.RootElement.TryGetProperty("CaiPinCode1", out var CaiPinCode1);
jsonDocument.RootElement.TryGetProperty("CaiPinCode2", out var CaiPinCode2);



var json = "{\"name\":\"Ron\",\"money\":4.5,\"age\":null}";
var jDoc = System.Text.Json.JsonDocument.Parse(json);
var property = jDoc.RootElement.GetProperty("age");
var age = property.GetInt32();


```

## 1. 通过 Dynamic 访问 System.Text.Json 对象

- [JsonSerializerEx2.cs](https://gist.github.com/changhuixu/e5d76eb1f9e9983cca8b6b645dae643e#file-jsonserializerex2-cs)
- [https://codeburst.io/working-with-json-in-net-core-3-2fd1236126c1](https://codeburst.io/working-with-json-in-net-core-3-2fd1236126c1)

```c#

// using JsonDocument to partially read JSON elements
var jsonBytes = File.ReadAllBytes("my-model.json");
using var jsonDoc = JsonDocument.Parse(jsonBytes);
var root = jsonDoc.RootElement;

var myString = root.GetProperty("myString").GetString();    // Get a string from a JsonElement
Console.WriteLine(myString);

var myInt = root.GetProperty("myInt").GetInt32();           // Get an integer from a JsonElement
Console.WriteLine(myInt);

var fruits = new List<string>();
var myStringList = root.GetProperty("myStringList");        // Get a list from a JsonElement
for (var i = 0; i < myStringList.GetArrayLength(); i++)
{
    fruits.Add(myStringList[i].GetString());
}
Console.WriteLine(string.Join(", ", fruits));


// POST api/<ShyzController>
[HttpPost]
public IActionResult Post([FromBody] JsonElement value)
{
    dynamic ja = new JTextAccessor(value);
    string reqCode = ja.reqCode;
    string Name = ja.Name;
    int Age = (int)ja.Age;
    var list = ja.List;
    string childName = list[0].Name;
    string phoneNumber = ja.Data.Content;
    string str = JsonSerializer.Serialize(value);
    _logger.LogInformation(str);
    return Ok(new
              {
                  code = "0",
                  message = "成功",
                  reqCode = reqCode
              });
}

```
