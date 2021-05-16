# LiteDB

- A .NET NoSQL Document Store in a single data file
- [Error Happened](https://www.litedb.org/)
- [mbdavid/LiteDB](https://github.com/mbdavid/LiteDB)
- [lidanger/LiteDB.wiki_Translation_zh-cn](https://github.com/lidanger/LiteDB.wiki_Translation_zh-cn)
- [.NET 平台开源项目速览(3)小巧轻量级 NoSQL 文件数据库 LiteDB - 数据之巅 - 博客园](https://www.cnblogs.com/asxinyu/p/dotnet_opensource_project_litedb.html)

## 0. Getting Started

- [Getting Started - LiteDB :: A .NET embedded NoSQL database](https://www.litedb.org/docs/getting-started/)

## 0. 常用

```c#
// An open source MongoDB-like database with zero conﬁguration - mobile ready
// 虽然小巧，但也不是万能的，LiteDB给出了几个可能或者比较适合使用的场景。大家可以根据实际情况进行或者根据需要进行测试，看是不是自己需要的：
1.桌面或者本地小型的应用程序
2.小型web应用程序
3.单个数据库账户或者单个用户数据的存储
4.少量用户的并发写操作的应用程序

// LiteDB is a small, fast and lightweight .NET NoSQL embedded database.

// Serverless NoSQL Document Store
// Simple API, similar to MongoDB
// 100% C# code for .NET 4.5 / NETStandard 1.3/2.0 in a single DLL (less than 450kb)
// Thread-safe
// ACID with full transaction support
// Data recovery after write failure (WAL log file)
// Datafile encryption using DES (AES) cryptography
// Map your POCO classes to BsonDocument using attributes or fluent mapper API
// Store files and stream data (like GridFS in MongoDB)
// Single data file storage (like SQLite)
// Index document fields for fast search
// LINQ support for queries
// SQL-Like commands to access/transform data
// LiteDB Studio - Nice UI for data access
// Open source and free for everyone - including commercial use
// Install from NuGet: Install-Package LiteDB


// 自己测试发现大规模读写情况下,内存似乎没释放.所以这里使用本库.
// 只会用于简单少量并发的应用程序下进行读写操作.因为简易.

```

## 1. LiteDB.wiki_Translation_zh-cn

- [lidanger/LiteDB.wiki_Translation_zh-cn](https://github.com/lidanger/LiteDB.wiki_Translation_zh-cn/tree/master/v3)

## 2. 安装使用

- [LiteDB 5.0.9](https://www.nuget.org/packages/LiteDB)

```c#
Install-Package LiteDB -Version 5.0.9
```

## 3. GUI 工具 (LiteDB.Studio)

- [mbdavid/LiteDB.Studio](https://github.com/mbdavid/LiteDB.Studio)
- [releases/latest 下载](https://github.com/mbdavid/LiteDB.Studio/releases/latest)

## 4. 代码

```c#
// 不存在自动创建数据库模式
using (var db = new LiteDB.LiteDatabase(new LiteDB.ConnectionString { Filename = DatabasePath, ReadOnly = false }))
{

}
// 只读模式
using (var db = new LiteDB.LiteDatabase(new LiteDB.ConnectionString { Filename = DatabasePath, ReadOnly = true }))
{

}

// 创建唯一索引
// Create unique index in Name field
col.EnsureIndex(x => x.Name, true);

// 插入
col.Insert(customer);
col.InsertBulk(baseInfoItems);

// 读取
BaseInfoItems = TBaseInfoItems.Find(m => true).ToList();


// 更新 Update a document inside a collection
customer.Name = "Joana Doe";
col.Update(customer);


// 集合对象
var col = db.GetCollection<UserItem>("T_Users");
var count = col.Count();

// 接口实例设计
/// <summary>数据库</summary>
string DatabasePath = $@"D:\TestAPP\Database\Apps\Uncategorized\DB.Google";

/// <summary>数据库 对象</summary>
public LiteDB.LiteDatabase DatabaseDB;

/// <summary>账号与密码 数据库</summary>
public LiteDB.ILiteCollection<TestAPP.Net.WinForms.Engine.Baidu.Models.Google.BaseInfoItem> TBaseInfoItems { get; set; }

public Google()
{
    DatabaseDB = new LiteDB.LiteDatabase(new LiteDB.ConnectionString { Filename = DatabasePath, ReadOnly = false });
    TBaseInfoItems= DatabaseDB.GetCollection<TestAPP.Net.WinForms.Engine.Baidu.Models.Google.BaseInfoItem>("T_BaseInfoItems");

    DatabaseInitialization();
}

public ServiceResult DatabaseInitialization()
{
    #region KV 索引
    try
    {
        TBaseInfoItems.EnsureIndex(x => x.BaiduUser, true);

    }
    catch (Exception) { }
    #endregion

    return ServiceResult.IsSuccess($"初始完成!");

}

var exists = col2.Exists(x => x.Id == person.Id);
```

## 5. 实体类

```c#

/// <summary>Id</summary>
public LiteDB.ObjectId Id { get; set; }



/// <summary>百度站长与163邮箱登陆模块基本属性信息</summary>
public class BaseInfoItem
{
    /// <summary>Id</summary>
    [ReadOnly(true)]
    public int Id { get; set; }

    /// <summary>网易邮箱用户名</summary>
    public string NetEase163User { get; set; }

    /// <summary>网易邮箱密码</summary>
    public string NetEase163Pass { get; set; }

    /// <summary>网易邮箱Cookie</summary>
    public string NetEase163Cookie { get; set; }

    /// <summary>网易邮箱Cookie</summary>
    public List<CefSharp.Cookie> NetEase163Cookies { get; set; }


}


```

## 6. 索引

- [lidanger/LiteDB.wiki_Translation_zh-cn](https://github.com/lidanger/LiteDB.wiki_Translation_zh-cn/blob/master/v3/Indexes.md)
