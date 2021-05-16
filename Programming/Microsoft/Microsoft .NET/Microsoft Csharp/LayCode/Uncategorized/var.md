# C# var

- [C#中的隐式类型 var——详细示例解析 - Vibin - 博客园](https://www.cnblogs.com/0weibin/p/3952407.html)

## 可以用匿名类初始化

```c#
 var person = new { Age = 18, Name = "Kobe" };//正确
 //匿名类中的属性一定要赋初始值，否则报错
 var person = new { Age, Name };//报错：当前上下文中不存在"Age" 当前上下文中不存在"Name"


var Items = new List<Newtonsoft.Json.Linq.JObject>();
for (int i = 0; i < 20; i++)
{

    var Item = new Newtonsoft.Json.Linq.JObject { { "Phone", "132****7777" }, { "Gender", $"男{i}" } };
    Items.Add(Item);
}


var JObjectItems = new List<Newtonsoft.Json.Linq.JObject>();
for (int i = 0; i < arr.Length; i++)
{
    var User = arr[i];
    var Item = new Newtonsoft.Json.Linq.JObject { { "User", User } };
    JObjectItems.Add(Item);
}


```
