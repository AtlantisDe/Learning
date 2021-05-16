# Dapper.Sqlite

- [Dapper](https://github.com/StackExchange/Dapper)
- [Dapper](https://stackexchange.github.io/Dapper/)
- [Dapper - a simple object mapper for .Net](https://github.com/StackExchange/Dapper/blob/main/Readme.md)

```c#

```

## 0. 安装

- [Dapper 2.0.35](https://www.nuget.org/packages/Dapper/)
- [NuGet Gallery | Packages matching System.Data.SQLite.Core](https://www.nuget.org/packages?q=System.Data.SQLite.Core)
- [System.Data.SQLite.x64](https://www.nuget.org/packages/System.Data.SQLite.x64/)
- [Dapper.Contrib 2.0.35](https://www.nuget.org/packages/Dapper.Contrib/)

```c#
Install-Package Dapper.Contrib -Version 2.0.35

Install-Package Dapper -Version 2.0.35
Install-Package System.Data.SQLite.Core -Version 1.0.113.1

// The official SQLite database engine for both x86 and x64 along with the ADO.NET provider.
// 包含X86和X64库
// OR

Install-Package System.Data.SQLite.x64 -Version 1.0.113
```

## 0. 特性

```c#
[Dapper.Contrib.Extensions.Table("T_Users")]
[Dapper.Contrib.Extensions.Key]

```

## 1. 常用

```c#
// dotnet add package System.Data.SQLite.Core
// dotnet add package Dapper

string cs = "Data Source=:memory:";

using (var con = new System.Data.SQLite.SQLiteConnection(cs))
{
    con.Open();
    var res = con.QueryFirst("select SQLITE_VERSION() AS Version");
    Console.WriteLine(res.Version);

    var res1 = con.QueryFirst<string>("select SQLITE_VERSION() AS Version");
    Console.WriteLine(res1);

    var rst2 = con.Execute("CREATE TABLE 'T_Users' ( 'Id' INTEGER NOT NULL, 'Name' TEXT, 'Age' INTEGER, PRIMARY KEY ( 'Id' ) );");

    var rst3 = con.Execute("INSERT INTO \"main\".\"T_Users\"(\"Id\", \"Name\", \"Age\") VALUES (1, '1', 1)");
}

```

## 2. 使用 Dapper 执行插入和更新

- [Performing Inserts and Updates with Dapper](https://stackoverflow.com/questions/5957774/performing-inserts-and-updates-with-dapper)

```c#
// 方法1：当您插入来自不同实体的值时，使用此方法。
using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["myDbConnection"].ConnectionString))
{
    string insertQuery = @"INSERT INTO [dbo].[Customer]([FirstName], [LastName], [State], [City], [IsActive], [CreatedOn]) VALUES (@FirstName, @LastName, @State, @City, @IsActive, @CreatedOn)";

    var result = db.Execute(insertQuery, new
    {
        customerModel.FirstName,
        customerModel.LastName,
        StateModel.State,
        CityModel.City,
        isActive,
        CreatedOn = DateTime.Now
    });
}
// 方法2：当您的实体属性与SQL列具有相同的名称时，使用此方法。因此，作为ORM的Dapper将实体属性与匹配的SQL列进行映射。
using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["myDbConnection"].ConnectionString))
{
    string insertQuery = @"INSERT INTO [dbo].[Customer]([FirstName], [LastName], [State], [City], [IsActive], [CreatedOn]) VALUES (@FirstName, @LastName, @State, @City, @IsActive, @CreatedOn)";

    var result = db.Execute(insertQuery, customerViewModel);
}

// CRUD的代码：
using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["myDbConnection"].ConnectionString))
{
    string selectQuery = @"SELECT * FROM [dbo].[Customer] WHERE FirstName = @FirstName";

    var result = db.Query(selectQuery, new
    {
        customerModel.FirstName
    });
}
// CRUD的代码：
using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["myDbConnection"].ConnectionString))
{
    string updateQuery = @"UPDATE [dbo].[Customer] SET IsActive = @IsActive WHERE FirstName = @FirstName AND LastName = @LastName";

    var result = db.Execute(updateQuery, new
    {
        isActive,
        customerModel.FirstName,
        customerModel.LastName
    });
}
// CRUD的代码：
using (IDbConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["myDbConnection"].ConnectionString))
{
    string deleteQuery = @"DELETE FROM [dbo].[Customer] WHERE FirstName = @FirstName AND LastName = @LastName";

    var result = db.Execute(deleteQuery, new
    {
        customerModel.FirstName,
        customerModel.LastName
    });
}

```

## 3. 事务

```c#
using (var cmd = new SQLiteCommand(conn))
using (var transaction = conn.BeginTransaction())
{
    for (int y = 0; y < castarraylist.Count; y++)
    {
        //Add your query here.
        cmd.CommandText = "INSERT INTO TABLE (Field1,Field2) VALUES ('A', 'B');";
        cmd.ExecuteNonQuery();
    }
    transaction.Commit();
}

// 不知道对没 这么用
using (var con = item.Path2.AdminSQLiteConnection())
{
    con.Open();
    using (var transaction = con.BeginTransaction())
    {
        try
        {
            transaction.Commit();

        }
        catch (Exception) { transaction.Rollback(); }
    }
}
```
