# Newtonsoft

- [Json.NET - Newtonsoft](https://www.newtonsoft.com/json)
- [JamesNK/Newtonsoft.Json](https://github.com/JamesNK/Newtonsoft.Json/releases)

## 1. 常用

```c#
// Newtonsoft 安装
Newtonsoft.Json
Install-Package Newtonsoft.Json -Version 12.0.3
```

### 0. JSONPath Online Evaluator

- [JSONPath Online Evaluator](https://jsonpath.com/)
- [Not Found](http://$.ResultSets[0].Content[1])

```c#
// SelectToken
// SelectToken with JSONPath
// SelectToken with LINQ

// 默认返回null
var bq1 = (string)jObject.SelectToken($"$.ResultSets[1].Content[{k}][13]");

// jsonpath
var content =  jObject.SelectToken("$.ResultSets[:1].Content");
string name = (string)o.SelectToken("Manufacturers[0].Name");
var mairuJine = (double)jObject.SelectToken("$.ResultSets[0].Content[0][1]");


```

### 1. 常用代码

```C#
- [C# 关于JArray和JObject封装JSON对象](https://www.jianshu.com/p/bd567de57308)
// JObject：基本的json对象
// JObject：嵌套子对象（JObject嵌JObject）
// JArray：基本json对象中的数组
// JArray： 多个json对象数组
// JArray：json数组嵌套数组（一个学生对应多个课程分数）

// JObject  用于操作JSON对象
// JArray    用语操作JSON数组
// JValue   表示数组中的值
// JProperty 表示对象中的属性,以"key/value"形式
// JToken  用于存放Linq to JSON查询后的结果



Newtonsoft.Json.JsonConvert.DeserializeObject<T>(config);
Newtonsoft.Json.JsonConvert.SerializeObject(obj);

var ConfigItem = Newtonsoft.Json.JsonConvert.DeserializeObject<T>(html);

var jObject = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(html);
var jArray = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JArray>(html);


// 数组解析范例
var jArray = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JArray>(text);
var item = jArray[0];
var item0 = item[0];
var item1 = item[1];
var item2 = item[2];


// jObject解析
jObject["ResultSets"][0]["Content"]
var content =  jObject.SelectToken("$.ResultSets[:1].Content");

jObject["UserItem"]["Name"] = "Queen";
var ccc = jObject["UserItem"].Value<string>("Phone") ?? "默认值";

JObject o = JObject.Parse(@"{
  'Stores': [
    'Lambton Quay',
    'Willis Street'
  ],
  'Manufacturers': [
    {
      'Name': 'Acme Co',
      'Products': [
        {
          'Name': 'Anvil',
          'Price': 50
        }
      ]
    },
    {
      'Name': 'Contoso',
      'Products': [
        {
          'Name': 'Elbow Grease',
          'Price': 99.95
        },
        {
          'Name': 'Headlight Fluid',
          'Price': 4
        }
      ]
    }
  ]
}");

string name = (string)o.SelectToken("Manufacturers[0].Name");
// Acme Co
decimal productPrice = (decimal)o.SelectToken("Manufacturers[0].Products[0].Price");
// 50
string productName = (string)o.SelectToken("Manufacturers[1].Products[0].Name");
// Elbow Grease


// Expando
var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(config);
Newtonsoft.Json.JsonConvert.DeserializeObject<System.Dynamic.ExpandoObject>(get.value);

System.IO.File.WriteAllText(ccc, Newtonsoft.Json.JsonConvert.SerializeObject(articleItem), Encoding.UTF8);

var items = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Main.Entity.tpl.tplitem>>(System.IO.File.ReadAllText("", System.Text.Encoding.UTF8));
var items = Newtonsoft.Json.JsonConvert.DeserializeObject<GoogleEmpire.Net.Core.Engine.Website.Models.Tplitem>(ConfigPath.ReadDocument());


// 字符串
[{"cnt":9305}]
// 对象类型应该为
Newtonsoft.Json.Linq.JArray

var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JArray>(rdata);

异常[无法将类型为“Newtonsoft.Json.Linq.JObject”的对象强制转换为类型“Newtonsoft.Json.Linq.JArray”。]

var json = {
    filenamestylesText: filenamestylesText,
    extensionnamesText: extensionnamesText,
  };

var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(config);

var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(json);

host = jobj["host"].ToString();
guid = jobj["guid"].ToString();

```

### 2. JObject 取值规范

```c#
Newtonsoft.Json.Linq.JObject JObject = null;
var nnn = JObject?.Value<string>("noKey") ?? "默认值";

var StrCode = "{\r\n  \"IsOpen\": \"true\",\r\n  \"Anums\": \"1\",\r\n  \"Bnums\": \"2\",\r\n  \"Cnums\": \"3\",\r\n  \"AText\": \"2\",\r\n  \"BText\": \"2\"\r\n}";
var JObject = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(StrCode);
var IsOpen1 = JObject["IsOpen"] ?? true;
var IsOpen2 = JObject.Value<bool>("IsOpen");
var IsOpen3 = JObject.Value<bool>("noKey");

var aaa = JObject.Value<string>("Anums");
var bbb = JObject.Value<string>("noKey") ?? "默认值";
var ccc = JObject.Value<string>("Anums") ?? "默认值";



// 常用API 常用JObject 与 实体类同步相互转换:
var DemoItem = Newtonsoft.Json.JsonConvert.DeserializeObject<ConfigItem>(Newtonsoft.Json.JsonConvert.SerializeObject(obj));
 JObject["UserItem"] = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(Newtonsoft.Json.JsonConvert.SerializeObject(new UserItem() { Age = 9, Name = "King" }));
```

### 3. JSON 中 JObject 和 JArray 的修改

```c#
var JObject = new Newtonsoft.Json.Linq.JObject { };
JObject.Add("IsOpen", true);
JObject.Add("Anums", 1);
JObject.Add("Bnums", 2);
JObject.Add("Cnums", 3);

JObject.Add("AText", "2");
JObject.Add("BText", "3");

JObject["CText"] = "C";
JObject["CText"] = "C1";
JObject["CText"] = new Newtonsoft.Json.Linq.JObject { { "Phone", "132****7777" }, { "Gender", "男" } };
var info = new Newtonsoft.Json.Linq.JObject { { "Phone", "132****7777" }, { "Gender", "男" } };
JObject.Add("Info", info);

//修改
JObject.Property("AText").Value="999";
```

### 4. 删除对象

- [Getting the error &quot;Cannot add or remove items from Newtonsoft.Json.Linq.JProperty&quot; in Json.net](https://stackoverflow.com/questions/21898727/getting-the-error-cannot-add-or-remove-items-from-newtonsoft-json-linq-jpropert)

```c#
/*删除第一个对象*/
//JObject.First.Remove();
JObject.Property("Name")?.Remove();
```

## 1. Version (AssemblyVersion) (Runtime)

```c#
9.0.0.0
10.0.0.0
12.0.0.0 - (12.0.2.23222) (Runtime: v4.0.30319)
```

### 1. TargetFramework

- [assembly: TargetFramework(".NETFramework,Version=v4.5", FrameworkDisplayName = ".NET Framework 4.5")]

## 2. Util

```c#
public class Util
{
    public static string SerializeObject(object value)
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(value);
    }

    public static T DeserializeObject<T>(string jsonstext)
    {
        return Newtonsoft.Json.JsonConvert.DeserializeObject<T>(jsonstext); ;
    }
}
```

## 3. Newtonsoft.Json 通过 JObject 读取 json 对像 超简单

- [Newtonsoft.Json 通过 JObject 读取 json 对像 超简单 - WebEnh - 博客园](https://www.cnblogs.com/webenh/p/5745355.html)

### 1. 版本重定向

- [Newtonsoft.Json 版本冲突解决 - BigLiang - 博客园](https://www.cnblogs.com/NewBigLiang/p/5371745.html)
- [Newtonsoft.Json 版本冲突解决](https://www.bbsmax.com/A/l1dyEwbdem/)
- [Newtonsoft.Json 版本不一致问题解决 - 沐恩 - CSDN 博客](https://blog.csdn.net/qq_31176861/article/details/84772964)
- [Found conflicts between different versions of the same dependent assembly that could not be resolved](https://stackoverflow.com/questions/24772053/found-conflicts-between-different-versions-of-the-same-dependent-assembly-that-c)

```c#
<assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
<bindingRedirect oldVersion="0.0.0.0-11.0.0.0" newVersion="11.0.0.0" />

<assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
<bindingRedirect oldVersion="0.0.0.0-6.0.0.0" newVersion="6.0.0.0" />

<assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
<bindingRedirect oldVersion="0.0.0.0-11.0.0.0" newVersion="6.0.0.0" />

<assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
<bindingRedirect oldVersion="0.0.0.0-9.0.0.0" newVersion="9.0.0.0" />


```

```c#
// 通过bindingRedirect节点重定向，即当找到10.0的版本时，给定向到6.0版本
<runtime>
     <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
         <dependentAssembly>
             <assemblyIdentity name="Newtonsoft.Json"
                               publicKeyToken="30ad4fe6b2a6aeed"
                               culture="neutral" />
             <bindingRedirect oldVersion="10.0.0.0"
                              newVersion="6.0.0.0" />
         </dependentAssembly>
     </assemblyBinding>
</runtime>
// 对每个版本指定codeBase路径，然后分别放上不同版本的程序集，这样就可以加载两个相同的程序集
<runtime>
     <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
          <dependentAssembly>
              <assemblyIdentity name="Newtonsoft.Json"
                                publicKeyToken="30ad4fe6b2a6aeed"
                                culture="neutral" />
              <codeBase version="6.0.0.0"
                        href="E:\6.0\Newtonsoft.Json.dll" />
          </dependentAssembly>
          <dependentAssembly>
              <assemblyIdentity name="Newtonsoft.Json"
                                publicKeyToken="30ad4fe6b2a6aeed"
                                culture="neutral" />
              <codeBase version="10.0.0.0"
                        href="E:\10.0\Newtonsoft.Json.dll" />
          </dependentAssembly>
    </assemblyBinding>
</runtime>

```

```c#
// 通过bindingRedirect节点重定向，即当找到10.0的版本时，给定向到6.0版本

```

```c#
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
        <bindingRedirect oldVersion="0.0.0.0-9.0.0.0" newVersion="6.0.0.0" />
      </dependentAssembly>
    </assemblyBinding>

    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
        <bindingRedirect oldVersion="0.0.0.0-6.0.0.0" newVersion="6.0.0.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Net.Http.Formatting" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-5.2.3.0" newVersion="5.2.3.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Web.Http" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-5.2.3.0" newVersion="5.2.3.0" />
      </dependentAssembly>
    </assemblyBinding>
```

### 2. 的不同版本间存在无法解决的冲突。当日志详细信息设置为“详细”时，这些引用冲突将会在生成日志中列出

- [发现同一依赖程序集的不同版本间存在无法解决的冲突 - 世事一场大梦,人生几度秋凉 - CSDN 博客](https://blog.csdn.net/ao123056/article/details/86238871)

## 4. 动态对象灵活使用

### 1. 例子示范

```c#
public async static Task<Newtonsoft.Json.Linq.JObject> Demo(this Uri uri)
{
    return await Task.Run(() =>
    {
        var json = Newtonsoft.Json.JsonConvert.SerializeObject(DemoExtenions.demo(uri).Result);
        var jobj = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JObject>(json);
        return jobj;
    });

}

```

## 5. JToken

- [How to convert a JToken](https://stackoverflow.com/questions/25870698/how-to-convert-a-jtoken)

```c#
// You can use the JToken.ToObject<T>() method.

JToken token = ...;
int value = token.ToObject<int>();

Item.MairuJine = jObject.SelectToken($"$.ResultSets[1].Content[{k}][8]").ToObject<double>();
Item.MaichuJine = jObject.SelectToken($"$.ResultSets[1].Content[{k}][10]").ToObject<double>();
```

## 6. 对象转换

```c#
Item.MairuJine = jObject.SelectToken($"$.ResultSets[1].Content[{k}][6]").ToDouble();
Item.MaichuJine = jObject.SelectToken($"$.ResultSets[1].Content[{k}][8]").ToDouble();
```
