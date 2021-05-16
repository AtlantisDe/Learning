# FreeSql

- [2881099/FreeSql](https://github.com/2881099/FreeSql)
- [DbFirst 安装实体类生成工具](https://github.com/2881099/FreeSql/wiki/DbFirst)
- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/wiki/EntityFramework%e6%af%94%e8%be%83)

```c#

```

## 0. Installation

- [FreeSql 2.3.200](https://www.nuget.org/packages/FreeSql/)
- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/wiki/%e5%ae%89%e8%a3%85)

```c#
// FreeSql 是一个 .NET Standard 2.0 库，仅支持 .NET Framework 4.0 或 .NET Core 或更高版本的应用程序。

Install-Package FreeSql

Install-Package FreeSql.Provider.MySql
```

## 1. FreeSql.Provider

- [Error Happened](https://github.com/dotnetcore/FreeSql/tree/master/Providers)

```c#

```

## 2. QuickStart

### 0. DbFirst

- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/wiki/DbFirst)

```c#

```

### 1. 自动更新数据库表结构 | 迁移

- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/blob/540f2251b3761bc0caeb2e2894b67272d101f659/Providers/FreeSql.Provider.MySql/MySqlCodeFirst.cs)

```c#

// 程序运行中FreeSql会检查AutoSyncStructure参数，以此条件判断是否对比实体与数据库结构之间的变化，达到自动迁移的目的,更多请查看CodeFirst文档，

// 注意：谨慎、谨慎、谨慎在生产环境中使用该功能。

// 注意：谨慎、谨慎、谨慎在生产环境中使用该功能。

// 注意：谨慎、谨慎、谨慎在生产环境中使用该功能。


[TestMethod]
public void FunUpdateDB()
{
    IFreeSql fsql = new FreeSql.FreeSqlBuilder()
                        .UseConnectionString(FreeSql.DataType.MySql, @"Server=127.0.0.1;Port=3306;Database=DB_App;User ID=root;Password=root;")
                        .UseAutoSyncStructure(true) //automatically synchronize the entity structure to the database
                        .Build(); //be sure to define as singleton mode


    fsql.Aop.ConfigEntity += (s, e) =>
    {
    };
    fsql.Aop.ConfigEntityProperty += (s, e) =>
    {
    };

    fsql.Aop.CommandBefore += (s, e) =>
    {
        e.Command.CommandText = e.Command.CommandText.Replace("Engine=InnoDB", "Engine=MyISAM");
    };

    fsql.Aop.SyncStructureBefore += (s, e) =>
    {
    };

    fsql.CodeFirst.SyncStructure<OrderFoodApp.Model.DianCaiDan>();

}


[TestMethod]
public void FunUpdateDB()
{
    IFreeSql fsql = new FreeSql.FreeSqlBuilder()
                        .UseConnectionString(FreeSql.DataType.MySql, @"Server=127.0.0.1;Port=3306;Database=DB_App;User ID=root;Password=root;")
                        .UseAutoSyncStructure(true) //automatically synchronize the entity structure to the database
                        .Build(); //be sure to define as singleton mode

    fsql.CodeFirst.SyncStructure<OrderApp.Model.DianCaiDan>();

}




```

### 2. 实体特性 ✨

- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/wiki/%e5%ae%9e%e4%bd%93%e7%89%b9%e6%80%a7)

```c#
// 可以在类型上指定 NOT NULL，也可以通过 [Column(IsNullable = false)] 设置；

// decimal 指定长度 [Column(DbType = "decimal(10,2)")] 或者 [Column(Precision = 10, Scale = 2)]

// string 指定长度 [Column(DbType = "varchar(128)")] 或者 [MaxLength(128)] 或者 [Column(StringLength = 128)]

// Text类型

[Column(StringLength =-1)]

```

### 3. ConnectionStrings

- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/wiki/%E5%85%A5%E9%97%A8)

```c#
// 搜索找到
ConnectionStrings
```

### 4. 自定义特性

- [Getting Title at 53:32](https://github.com/dotnetcore/FreeSql/wiki/%e8%87%aa%e5%ae%9a%e4%b9%89%e7%89%b9%e6%80%a7)
- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/blob/540f2251b3761bc0caeb2e2894b67272d101f659/Examples/base_entity/Program.cs)

```c#
fsql.Aop.CommandBefore += (s, e) =>
{
e.States["xxx"] = 111;
};

fsql.Aop.CommandAfter += (s, e) =>
{
var xxx = e.States["xxx"];
};

fsql.Aop.TraceBefore += (s, e) =>
{
e.States["xxx"] = 222;
};
fsql.Aop.TraceAfter += (s, e) =>
{
var xxx = e.States["xxx"];
};

fsql.Aop.SyncStructureBefore += (s, e) =>
{
e.States["xxx"] = 333;
};
fsql.Aop.SyncStructureAfter += (s, e) =>
{
var xxx = e.States["xxx"];
};

fsql.Aop.CurdBefore += (s, e) =>
{
e.States["xxx"] = 444;
};
fsql.Aop.CurdAfter += (s, e) =>
{
var xxx = e.States["xxx"];
};

```

### 5. AOP

- [Error Happened](https://github.com/dotnetcore/FreeSql/wiki/AOP)

```c#

```

## 3. FreeSql.DbContext

- [dotnetcore/FreeSql](https://github.com/dotnetcore/FreeSql/wiki/DbContext)

```c#

```
