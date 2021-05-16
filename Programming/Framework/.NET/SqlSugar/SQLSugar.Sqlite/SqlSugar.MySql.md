# SqlSugar.MySql

- [sunkaixuan/SqlSugar](https://github.com/sunkaixuan/SqlSugar/tree/SqlSugar5/Src/Asp.NetCore2/SqlSeverTest/MySqlTest/Demo)
- [sunkaixuan/SqlSugar](https://github.com/sunkaixuan/SqlSugar/blob/SqlSugar5/Src/Asp.NetCore2/SqlSeverTest/MySqlTest/Demo/Demo3_Insertable.cs)
- [sunkaixuan/SqlSugar](https://github.com/sunkaixuan/SqlSugar/blob/SqlSugar5/Src/Asp.NetCore2/SqlSeverTest/MySqlTest/Config.cs)

## 1. QuickStart

- [MySQL :: MySQL Community Downloads](https://dev.mysql.com/downloads/)

```c#
Install-Package MySql.Data -Version 8.0.22

```

### 1. 连接字符串

```c#

/// <summary>
/// Setting up the database name does not require you to create the database
/// 设置好数据库名不需要你去手动建库
/// </summary>
public class Config
{
    /// <summary>
    /// Account have permission to create database
    /// 用有建库权限的数据库账号
    /// </summary>
    public static string ConnectionString = "server=localhost;Database=SqlSugar4xTest;Uid=root;Pwd=haosql";
    /// <summary>
    /// Account have permission to create database
    /// 用有建库权限的数据库账号
    /// </summary>
    public static string ConnectionString2 = "server=localhost;Database=SqlSugar4xTest2;Uid=root;Pwd=haosql";
    /// <summary>
    /// Account have permission to create database
    /// 用有建库权限的数据库账号
    /// </summary>
    public static string ConnectionString3 = "server=localhost;Database=SqlSugar4xTest3;Uid=root;Pwd=haosql";
}


SqlSugarClient db = new SqlSugarClient(new ConnectionConfig()
{
    DbType = DbType.MySql,
    ConnectionString = Config.ConnectionString,
    InitKeyType = InitKeyType.Attribute,
    IsAutoCloseConnection = true,
    AopEvents = new AopEvents
    {
        OnLogExecuting = (sql, p) =>
        {
            Console.WriteLine(sql);
            Console.WriteLine(string.Join(",", p?.Select(it => it.ParameterName + ":" + it.Value)));
        }
    }
});

var insertObj = new Order() { Id = 1, Name = "order1",Price=0 };
var updateObjs = new List<Order> {
        new Order() { Id = 11, Name = "order11", Price=0 },
        new Order() { Id = 12, Name = "order12" , Price=0}
};

```

### 2. 字段类型

- [MySQL 数据类型 | 菜鸟教程](https://www.runoob.com/mysql/mysql-data-types.html)

```c#
[SugarColumn(ColumnDataType = "text", IsNullable = true)]

[SugarColumn(IsPrimaryKey = true, IsIdentity = false, Length = 32)]
/// <summary>Id</summary>
public string Guid { get; set; }

public class CodeFirstTable1
{
    [SugarColumn(IsIdentity = true, IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    [SugarColumn(ColumnDataType = "Nvarchar(255)")]//custom
    public string Text { get; set; }
    [SugarColumn(IsNullable = true)]
    public DateTime CreateTime { get; set; }
}
```

### 3. MySQL 索引

- [MySQL 索引 | 菜鸟教程](https://www.runoob.com/mysql/mysql-index.html)
- [btree 索引和 hash 索引的区别 - 秋天的林子 - 博客园](https://www.cnblogs.com/ziqiumeng/p/7680204.html)
- [Mysql 索引类型 Btree 和 Hash 的区别以及使用场景\_一点 PHP](https://www.yidianphp.com/archives/811)

```c#
// 创建索引 这是最基本的索引，它没有任何限制。它有以下几种创建方式：
CREATE INDEX indexName ON table_name (column_name)

CREATE INDEX `Category_1` ON `t_contents001` (`Category`)
db.Ado.ExecuteCommand($"CREATE INDEX `Category_1` ON `t_contents001` (`Category`)");

// 如果是CHAR，VARCHAR类型，length可以小于字段实际长度；如果是BLOB和TEXT类型，必须指定 length。
```
