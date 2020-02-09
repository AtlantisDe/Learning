# C# Class

```c#
Classes

```

## 相关代码

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

### 代码 1

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

### 代码 2

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

### 代码 3

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

### 代码 4

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

### 代码 5

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

### 代理示例 6 类型问号

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

## 报错继承问题

- [未提供必须形参对应的实参怎样解决？ - OnTime 的博客 - CSDN 博客](https://blog.csdn.net/qq_38061677/article/details/81021646)

### 继承代码示例 1

```C#
public aleDB(string INIPath, string _encodingName = "utf-8") : base(INIPath, _encodingName)
{

}
```

### 继承代码示例 2

```C#
 public class muluclassdb : DemoCore.Module.Aledb.Class.aleDB
    {
        public muluclassdb(string INIPath, string _encodingName = "utf-8") : base(INIPath, _encodingName)
        {


        }
    }
```
