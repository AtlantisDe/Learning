# C# Class

```c#
Classes

```

## 1. 相关代码

```c#
 public class Ucmain
{
    public aaaa Root { get; set; }
    public Ucmain()
    {

    }
    public UcmainTwo(aaaa Root_):this()
    {

    }
    class two{
    }
}
```

### 1. 代码 1

```c#
public class Entity
    {
        public class userbase
        {
            public class useritem
            {
                public string name { get; set; }
                public int age { get; set; }
            }
            public class Root
            {
                public List<useritem> users { get; set; }
            }
        }

    }
```

### 2. 代码 2

```c#
namespace Demos
{
    public class Entity
    {

    }
    public class Const
    {
        public const string aa = "aa";

    }
    public class Method
    {

    }
    public class UI
    {

    }
}
```

### 3. 代码 3

```c#
namespace Demos
{
    public class Entity
    {

    }
    public class Const
    {
        public const string aa = "aa";

    }
    public class Method
    {

    }
    public class UI
    {

    }
}
```

### 4. 代码 4

```c#
public class apiresponsedemo
        {
            public class ItemItem
            {

                public string id { get; set; }

                public string username { get; set; }

                public string email { get; set; }

                public string sex { get; set; }

                public string city { get; set; }

                public string sign { get; set; }

                public string experience { get; set; }

                public string ip { get; set; }

                public string logins { get; set; }

                public string joinTime { get; set; }
            }

            public class Rows
            {

                public List<ItemItem> item { get; set; }
            }

            public class Root
            {

                public int status { get; set; }

                public string message { get; set; }

                public int total { get; set; }

                public Rows rows { get; set; }
            }
        }
```

### 5. 代码 5

```c#
public class apiresponsedemo
        {
            public class ItemItem
            {

                public string id { get; set; }
            }

            public class Rows
            {

                public List<ItemItem> item { get; set; }
            }

            public class Root
            {

                public int status { get; set; }

                public string message { get; set; }

                public int total { get; set; }

                public Rows rows { get; set; }
            }
        }
```

### 6. 代理示例 6 类型问号

```C#
    public class Entity
    {
        public class Models
        {
            [SugarTable("t_Sites")]
            public class Sites
            {
                [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "Guid")]
                public int Guid { get; set; }
                public int? SchoolId { get; set; }
                public string Name { get; set; }
                public DateTime? CreateTime { get; set; }
                [SugarColumn(IsIgnore = true)]
                public int TestId { get; set; }
            }
        }
    }

```

```C#
public class Root
{
    /// <summary>
    ///
    /// </summary>
    public int code { get; set; }
    /// <summary>
    /// 请求被拒绝，请求重复, 请注意 Nonce 参数两次请求不能重复, Timestamp 与腾讯服务器相差不能超过 2 小时, 腾讯服务器 Timestamp = 1556706450
    /// </summary>
    public string message { get; set; }
    /// <summary>
    ///
    /// </summary>
    public string codeDesc { get; set; }
}

public class Root
{
    public int code { get; set; }
    public string message { get; set; }
    public string codeDesc { get; set; }
}
```

## 2. 报错继承问题

- [未提供必须形参对应的实参怎样解决？ - OnTime 的博客 - CSDN 博客](https://blog.csdn.net/qq_38061677/article/details/81021646)

### 1. 继承代码示例 1

```C#
public aleDB(string INIPath, string _encodingName = "utf-8") : base(INIPath, _encodingName)
{

}
```

### 2. 继承代码示例 2

```C#
 public class muluclassdb : DemoCore.Module.Aledb.Class.aleDB
    {
        public muluclassdb(string INIPath, string _encodingName = "utf-8") : base(INIPath, _encodingName)
        {


        }
    }
```

## 3. 类库初始化问题

```c#
注意问题:

Google.Net.V0
拥有一个静态变量:
Google.Net.Database.Engine.Mongo.BigDatabase.App.Collection.Init();

当该类库也需要初始化并使用该变量的时候:
Google.Net.Com


当该类库 需要引用 Google.Net.Com 当时他们都需要最前面的静态变量的时候:
Google.Net.CommandLine

// 会发生以下情况
Google.Net.Com 初始化的就只能属于他们这个空间区域内生效.
Google.Net.CommandLine 初始化的就只能属于他们这个空间区域内生效.
// 也就是 两个类库都引用,但是这个静态变量也是无法共享的!


```
