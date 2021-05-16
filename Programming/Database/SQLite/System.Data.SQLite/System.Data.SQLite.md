# System.Data.SQLite

- [System.Data.SQLite 1.0.113.1](https://www.nuget.org/packages/System.Data.SQLite/)
- [C#利用 System.Data.SQLite 实现对 SQLite 的操作 勤能补拙-CSDN 博客](https://blog.csdn.net/weixin_41732430/article/details/83753628)
- [System.Data.SQLite: Downloads Page](http://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki)
- [SQLite 语法 | 菜鸟教程](https://www.runoob.com/sqlite/sqlite-syntax.html)

```c#
The official SQLite database engine for both x86 and x64 along with the ADO.NET provider.  This package includes support for LINQ and Entity Framework 6.
```

## 0. 当前版本

```c#
3.32.1
```

## 0. 自定义 Sqlite 版本

- [自定义 SQLite 版本 - Microsoft.Data.Sqlite](https://docs.microsoft.com/zh-cn/dotnet/standard/data/sqlite/custom-versions?tabs=netcore-cli)

## 0. 排序规则

- [排序规则 - Microsoft.Data.Sqlite](https://docs.microsoft.com/zh-cn/dotnet/standard/data/sqlite/collation)

```c#
// SQLite 在比较 TEXT 值时使用排序序列确定顺序和相等性。 可以指定在 SQL 查询中创建列时或是对每个操作要使用的排序规则。 SQLite 在默认情况下包含三种排序序列。
// 排序规则
// 排序规则 描述
// RTRIM 忽略尾随空格
// NOCASE 对于 ASCII 字符 A-Z 不区分大小写
// BINARY 区分大小写。 直接比较字节

// 自定义排序规则
connection.CreateCollation("NOCASE", (x, y) => string.Compare(x, y, ignoreCase: true));

var queryCommand = connection.CreateCommand();
queryCommand.CommandText =
@"
    SELECT count()
    FROM greek_letter
    WHERE value = 'λ' COLLATE NOCASE
";
var count = (long)queryCommand.ExecuteScalar();

```

## 1. 常用

```c#
// 简单点不要安装 直接拷贝DLL
// SQLite.Interop.dll 到项目目录

System.Data.SQLite
Install-Package System.Data.SQLite -Version 1.0.113.1

// 版本列表:
SQLite version: 3.32.1
```

## 2. SQLite 可视化工具(GUI)

- [SQLite administration | SQLite Expert](http://www.sqliteexpert.com/download.html)

## 3. 操作 Example

- [C# SQLite tutorial - programming SQLite databases in C#](http://zetcode.com/csharp/sqlite/)

```c#
// System.Data.SQLite通用类
// 可以分为以下几种情况：
// 1、创建数据库文件；
// 2、返回DataTable；
// 3、返回DataReader；
// 4、执行增删改，返回受影响的行数；
// 5、执行查询，返回第一行第一列（通常用于带有行函数的查询，如SUM/AVG/COUNT等）；
// 6、返回库中所有的表；
// 因为在System.Data.SQLite中不存在存储过程，所以所有的操作都是基于文本的SQL语句，为了避免SQL注入，所以使用了参数化的SQL语句。
```

### 1. 操作代码

- [SQLite Sample Database And Its Diagram (in PDF format)](https://www.sqlitetutorial.net/sqlite-sample-database/)

```c#
SQLITE TUTORIAL
SQLite Select
SQLite Order By
SQLite Select Distinct
SQLite Where
SQLite Limit
SQLite BETWEEN
SQLite IN
SQLite Like
SQLite IS NULL
SQLite GLOB
SQLite Join
SQLite Inner Join
SQLite Left Join
SQLite Cross Join
SQLite Self-Join
SQLite Full Outer Join
SQLite Group By
SQLite Having
SQLite Union
SQLite Except
SQLite Intersect
SQLite Subquery
SQLite EXISTS
SQLite Case
SQLite Insert
SQLite Update
SQLite Delete
SQLite Replace
SQLite Transaction

// SQLite.NET连接字符串

// 基本的
Data Source=c:\mydb.db;Version=3;
// 内存数据库:SQLite数据库通常存储在磁盘上，但该数据库也可以存储在内存中。在此处阅读有关SQLite内存数据库的更多信息。
Data Source=:memory:;Version=3;New=True;
// 使用UTF16
Data Source=c:\mydb.db;Version=3;UseUTF16Encoding=True;
// 带密码
Data Source=c:\mydb.db;Version=3;Password=myPassword;
// 使用3.3x之前的数据库格式
Data Source=c:\mydb.db;Version=3;Legacy Format=True;
// 使用连接池 默认情况下不启用连接池。使用以下参数来控制连接池机制。
Data Source=c:\mydb.db;Version=3;Pooling=True;Max Pool Size=100;
// 只读连接
Data Source=c:\mydb.db;Version=3;Read Only=True;
// 使用DateTime.Ticks作为日期时间格式 默认值为ISO8601，可激活使用ISO8601日期时间格式
Data Source=c:\mydb.db;Version=3;DateTimeFormat=Ticks;

// 将GUID存储为文本 通常，GUID以二进制格式存储。使用此连接字符串将GUID存储为文本。 请注意，将GUID存储为文本会在数据库中使用更多空间。
Data Source=c:\mydb.db;Version=3;BinaryGUID=False;

// 指定缓存大小 缓存大小值（以字节为单位）
Data Source=c:\mydb.db;Version=3;Cache Size=2000;

// 指定页面大小 页面大小值，以字节为单位
Data Source=c:\mydb.db;Version=3;Page Size=1024;

// 禁止加入分布式交易
Data Source=c:\mydb.db;Version=3;Enlist=N;

// 禁用创建数据库行为
// 如果数据库文件不存在，则默认行为是创建一个新文件。使用以下参数引发错误，而不是创建新的数据库文件。
Data Source=c:\mydb.db;Version=3;FailIfMissing=True;

// 限制数据库的大小
Data Source=c:\mydb.db;Version=3;Max Page Count=5000;

// 禁用日志文件 此选项将完全禁用回滚日志。
Data Source=c:\mydb.db;Version=3;Journal Mode=Off;

// 保留日志文件 提交后，此空白将日志文件保留在磁盘上。默认行为是在每次提交后删除日志文件。
Data Source=c:\mydb.db;Version=3;Journal Mode=Persist;

// 控制文件刷新 完全指定一次完全刷新，以在每次写入后执行操作。正常是默认值。熄灭表示基础操作系统刷新I / O。
Data Source=c:\mydb.db;Version=3;Synchronous=Full;


using (var con = site.Nodes.SiteConfig.MainDatebasePath.SQLiteConnectionFailIfMissing())
{
    con.Open();

    using (var cmd = new System.Data.SQLite.SQLiteCommand(con))
    {

        var items = new List<string>();
        items.Add("CREATE INDEX 'T_Test_Guid_1' ON 'T_Test' ('Guid' COLLATE BINARY DESC)");
        foreach (var item in items)
        {
            try { cmd.CommandText = item; cmd.ExecuteNonQuery(); }
            catch (System.Exception) { }
        }
    }
}


using (var con = new System.Data.SQLite.SQLiteConnection(cs))
{
    con.Open();
    using (var cmd = new System.Data.SQLite.SQLiteCommand(sql, con))
    {
        string version = cmd.ExecuteScalar().ToString();
        System.Console.WriteLine($"SQLite version: {version}");
    }
}

string cs = "Data Source=:memory:";
string stm = "SELECT SQLITE_VERSION()";

using var con = new SQLiteConnection(cs);
con.Open();

using var cmd = new SQLiteCommand(stm, con);
string version = cmd.ExecuteScalar().ToString();

Console.WriteLine($"SQLite version: {version}");
```

### 2. Valid query to check if row exists in SQLite3

- [Valid query to check if row exists in SQLite3](https://stackoverflow.com/questions/9755860/valid-query-to-check-if-row-exists-in-sqlite3)

```c#
SELECT EXISTS(SELECT 1 FROM TestLong WHERE Id=888 LIMIT 1);

// 因此，您提出的查询将是最有效的：(So the query you proposed will be the most efficient:)
SELECT EXISTS(SELECT 1 FROM myTbl WHERE u_tag="tag");

// 如果您对可移植性感到不安，可以增加一个限制。我怀疑大多数DB都会为您提供相同的短路。(If you were nervous about portability, you could add a limit. I suspect most DBs will offer you the same short circuit however.)
SELECT EXISTS(SELECT 1 FROM myTbl WHERE u_tag="tag" LIMIT 1);

```

### 3. SQLite create table

```c#
string cs = @"URI=file:C:\Users\Jano\Documents\test.db";

using var con = new SQLiteConnection(cs);
con.Open();

using var cmd = new SQLiteCommand(con);

cmd.CommandText = "DROP TABLE IF EXISTS cars";
cmd.ExecuteNonQuery();

cmd.CommandText = @"CREATE TABLE cars(id INTEGER PRIMARY KEY,name TEXT, price INT)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Audi',52642)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Mercedes',57127)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Skoda',9000)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Volvo',29000)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Bentley',350000)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Citroen',21000)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Hummer',41400)";
cmd.ExecuteNonQuery();

cmd.CommandText = "INSERT INTO cars(name, price) VALUES('Volkswagen',21600)";
cmd.ExecuteNonQuery();

Console.WriteLine("Table cars created");



// In the example, we create a cars table with eight rows.

cmd.CommandText = "DROP TABLE IF EXISTS cars";
cmd.ExecuteNonQuery();
```

### 4. SQLite prepared statements (SQLite 准备的语句)

```c#
string cs = @"URI=file:C:\Users\Jano\Documents\test.db";

using var con = new SQLiteConnection(cs);
con.Open();

using var cmd = new SQLiteCommand(con);
cmd.CommandText = "INSERT INTO cars(name, price) VALUES(@name, @price)";

cmd.Parameters.AddWithValue("@name", "BMW");
cmd.Parameters.AddWithValue("@price", 36600);
cmd.Prepare();

cmd.ExecuteNonQuery();

Console.WriteLine("row inserted");
```

### 5. SQLiteDataReader

```c#
string cs = @"URI=file:C:\Users\Jano\Documents\test.db";
using var con = new SQLiteConnection(cs);
con.Open();

string stm = "SELECT * FROM cars LIMIT 5";

using var cmd = new SQLiteCommand(stm, con);
using SQLiteDataReader rdr = cmd.ExecuteReader();

while (rdr.Read())
{
    Console.WriteLine($"{rdr.GetInt32(0)} {rdr.GetString(1)} {rdr.GetInt32(2)}");
}


// We get five rows from the cars table and print them to the console.
// 获取5行 打印到控制台
using SQLiteDataReader rdr = cmd.ExecuteReader();

// To create an SQLiteDataReader object, we call the ExecuteReader() method of the SQLiteCommand object.
// 要创建SQLiteDataReader对象，我们调用对象的ExecuteReader()方法SQLiteCommand。
using SQLiteDataReader rdr = cmd.ExecuteReader();

// 该Read()方法将数据读取器前进到下一条记录。如果有更多行，则返回true；否则，返回true。否则为假。我们可以使用数组索引符号来检索值，或者使用特定的方法来访问其本机数据类型中的列值。后者效率更高。

while (rdr.Read())
{
    Console.WriteLine($"{rdr.GetInt32(0)} {rdr.GetString(1)} {rdr.GetInt32(2)}");
}

```

### 6. SQLite column headers (列标题)

### 7. SQLite 加密扩展

- [sqlite3 - 带加密/密码保护的 SQLite - ITranslater](https://www.itranslater.com/qa/details/2325656083488048128)
