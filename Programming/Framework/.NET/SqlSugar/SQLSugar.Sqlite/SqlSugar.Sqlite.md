# SQLSugar.Sqlite

- [What Is SQLite](http://www.sqlite.org/)
- [SQLite source code](https://sqlite.org/src)
- SqlSugar sqlSugarCore
- [SQLite.NET Connection Strings - ConnectionStrings.com](https://www.connectionstrings.com/sqlite-net-provider/)
- [Finisar.SQLite ADO.NET Data Provider Connection Strings - ConnectionStrings.com](https://www.connectionstrings.com/finisar-sqlite-ado-net-data-provider/)
- [sunkaixuan/SqlSugar](https://github.com/sunkaixuan/SqlSugar)
- [用前必看-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1121)

## 1. 安装步骤

- [sqlSugar 5.0.0.15](https://www.nuget.org/packages/sqlSugar)
- [System.Data.SQLite.Core 1.0.113.1](https://www.nuget.org/packages/System.Data.SQLite.Core/1.0.113.1)
- [依赖 dll 版本不一致 常见问题汇总-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1154)

```c#
// SQLite Latest Release :Version 3.33.0 (2020-08-14)


Install-Package sqlSugar -Version 5.0.0.19
Install-Package System.Data.SQLite.Core -Version 1.0.113.1

SQLite.Interop.dll

// 引用
System.Data.SQLite.dll

// SQLite.NET连接字符串

Journal Mode=WAL


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



// 代码
using (var db = GetInstance())
{

}
// 代码
using (var db = GetInstance())
{
    var join1 = db.Queryable<Student, School>((st, sc) => new object[] {JoinType.Left,st.SchoolId==sc.Id
    }).Where(st => st.Id > 0).Select<Student>("*").ToSql();
    base.Check(@"SELECT * FROM `STudent` st Left JOIN `School` sc ON ( `st`.`SchoolId` = `sc`.`Id` )   WHERE ( `st`.`ID` > @Id0 ) ",
        new List<SugarParameter>() {
            new SugarParameter("@Id0",0)
        }, join1.Key, join1.Value, "join 1 Error");
}

db.Ado.GetDataTable("select * from student");
db.Ado.SqlQueryDynamic
```

## 2. TruncateTable (Truncate Table 截断表)

- [drop、truncate 和 delete 的区别 - 支照 - 博客园](https://www.cnblogs.com/zhizhao/p/7825469.html)

```c#
总结：

// 1、在速度上，一般来说，drop> truncate > delete。
// 2、在使用drop和truncate时一定要注意，虽然可以恢复，但为了减少麻烦，还是要慎重。
// 3、如果想删除部分数据用delete，注意带上where子句，回滚段要足够大；
//    如果想删除表，当然用drop；
//    如果想保留表而将所有数据删除，如果和事务无关，用truncate即可；
//    如果和事务有关，或者想触发trigger，还是用delete；
//    如果是整理表内部的碎片，可以用truncate跟上reuse stroage，再重新导入/插入数据。
public static bool TruncateTable()
{
    try
    {
        using (var db = Module.DemoTest.Database.Main.Base.GetInstance())
        {
            db.Ado.GetInt("VACUUM");return true;
        }
    }
    catch (Exception Ex){Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));}finally{    }
    return true;
}
```

## 1. 常用

```c#
SELECT COUNT (Guid) as cnt FROM main.T_demos
```

## 2. InitTables

```c#
db.CodeFirst.InitTables(typeof(UserItem));
db.CodeFirst.InitTables(typeof(Student), typeof(StudentNames));

```

### 1. Code First

- [生成表-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1149)

```c#
// 属性介绍

// 我们会根据字段的属性生成数据库字段
// IsNullable表示表字段是否可空
// IsIgnore 为true表示不会生成字段到数据库
// IsIdentity表示为自增列
// IsPrimaryKey表示为主键
// Length 表示字段长度
// DecimalDigits 表示字段的精度 4.4
// ColumnDataType  强制设置数据库字段的类型（考虑到切换数据库有些类型其它库没有最新版本支持多个以逗号隔离，比如=“number,int”）
dbColumnInfo = new DbColumnInfo() { DbColumnName = "img1", DataType = "text", Length = 1500 }
public class CodeTable
{
        [SugarColumn(IsNullable =false ,IsPrimaryKey =true,IsIdentity =true)]
        public int Id { get; set; }
        [SugarColumn(Length = 21)]
        public string Name{ get; set; }
        [SugarColumn(IsNullable = true)]
        public bool IsOk { get; set; }
        public Guid Guid { get; set; }
        public decimal Decimal { get; set; }
        [SugarColumn(IsNullable = true)]
        public DateTime? DateTime { get; set; }
        [SugarColumn(IsNullable = true)]
        public double? Dob2 { get; set; }
        [SugarColumn(Length =10)]
        public string A { get; set; }
}
public class CodeTable2 {
        public int Id { get; set; }
        public string Name { get; set; }
        [SugarColumn(IsIgnore =true)]
        public string TestId { get; set; }
}
[SqlSugar.SugarTable("T_logs")]
public class logitem
{
    [SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "guid")]
    public string guid { get; set; }
    public string type { get; set; }
    public string log { get; set; }
    public string addtime { get; set; }
}
```

### 2. SugarColumn

```c#
[SugarColumn(IsNullable = true)]
[SugarColumn(IsIgnore = true)]
[SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "guid")]
[SugarColumn(IsPrimaryKey = true, IsIdentity = false, ColumnName = "guid", Length = 32)]
[SugarColumn(Length = 20)]
[SugarColumn(ColumnDataType = "text")]
[SugarColumn(ColumnDataType = "text", IsNullable = true)]
[SugarColumn(ColumnDataType = "text", IsNullable = true, Length = 255)]
[SugarColumn(IsNullable = true, Length = 255)]
[SugarColumn(IsNullable = false, DefaultValue = "0", Length = 2)]
[SugarColumn(ColumnDataType = "text", DefaultValue = "0", IsNullable = true)]
[SugarColumn(ColumnDataType = "text", DefaultValue = "false", IsNullable = true)]

```

### 3. SugarColumn text

- SQLite Text 类型不支持 Length

```c#
[SugarColumn(ColumnDataType = "text", IsNullable = true)]
public string supporttag { get; set; }
```

### 4. SugarColumn 时间

```c#
[SugarColumn(IsNullable = false)]
public DateTime? createtime { get; set; }

[SugarColumn(IsNullable = false)]
public DateTime createtime { get; set; }
```

### 5. SugarColumn INT

- 不能设置默认值否则报错

```c#
[SugarColumn(IsNullable = false, Length = 2)]
public int deployed { get; set; }
```

### 6. SugarColumn bool / Boolean

- SQLite 没有单独的 Boolean 存储类。相反，布尔值被存储为整数 0（false）和 1（true）

```c#
[SugarColumn(IsNullable = true, Length = 1)]
public bool active { get; set; }
// 文本
[SugarColumn(IsNullable = true, Length = 5)]
public bool active { get; set; }
```

### 7. SugarColumn 忽略

```c#
[SugarColumn(IsIgnore=true)]
public bool active { get; set; }

```

### 8. SugarColumn 设计常见问题

```c#
// SQLite error (1): AUTOINCREMENT is only allowed on an INTEGER PRIMARY KEY in
// SQLite错误(1):只允许在INTEGER上自动增量
// 解决:把long类型改为Int类型即可

```

AUTOINCREMENT

## 2. Ado

```c#
try
{
    db.Ado.ExecuteCommand("CREATE UNIQUE INDEX \"Guid_DT_1\" ON \"T_DailyItem\" (  \"Guid\" DESC,  \"DateTime\" DESC )");
    db.Ado.ExecuteCommand("CREATE UNIQUE INDEX \"Guid_1\" ON \"T_DailyItem\" (  \"Guid\" DESC)");
    db.Ado.ExecuteCommand("CREATE INDEX \"main\".\"T_DailyItem_CreateDateOCDiff\" ON \"T_DailyItem\" (  \"CreateDate\" DESC,  \"OCDiff\" ASC);");
    db.Ado.ExecuteCommand("CREATE INDEX \"main\".\"T_DailyItem_NodesText\" ON \"T_DailyItem\" (\"NodesText\" ASC);");
    db.Ado.ExecuteCommand("CREATE INDEX \"main\".\"T_DailyItem_CreateDate\" ON \"T_DailyItem\" (\"CreateDate\" DESC);");
}
catch (Exception){}finally{}
```

## 3. Delete

- [删除-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1128)

### 1. 代码删除

### 2. demo 一

```c#
using (var db = GetInstance_Main_log())
{
    var count = db.Deleteable<logitem>().ExecuteCommand();
    db.Ado.GetInt("VACUUM");

    root.code = 200;
    root.message = string.Format("删除成功!删除数据总量:{0}", count);
}
```

### 3. Official

```c#
// 根据实体删除（实体内主键一定要有值）
var t0 = db.Deleteable<Student>().Where(new Student() { Id = 1 }).ExecuteCommand();
// 根据实体集删除
var  t1 = db.Deleteable<Student>().Where(new List<Student>() { new Student() { Id = 1 } }).ExecuteCommand();
// 使用锁
var t2 = db.Deleteable<Student>().With(SqlWith.RowLock).ExecuteCommand();
// 根据主键删除
var t3 = db.Deleteable<Student>().In(1).ExecuteCommand();
// 根据主键批量删除
var t4 = db.Deleteable<Student>().In(new int[] { 1, 2 }).ExecuteCommand();
// 根据非主键批量删除4.9
var t4 = db.Deleteable<Student>().In(it=>it.SchoolId,new int[] { 1, 2 }).ExecuteCommand();
// 根据表达式删除
var t5 = db.Deleteable<Student>().Where(it => it.Id == 1).ExecuteCommand();//删除等于1的
//批量删除非主键
list<int> list=new list<int>(){1,3};
var t5 = db.Deleteable<Student>().Where(it => !list.Contains(it.Id) ).ExecuteCommand();
// 4.1.0.6 版本之后可以对上面的语法进行优化
db.Deleteable<Student>(1).ExecuteCommand();
db.Deleteable<Student>(it=>it.id==1).ExecuteCommand();
db.Deleteable<Student>(new int[]{1,2,3}).ExecuteCommand();
db.Deleteable<Student>(实体).ExecuteCommand();
```

## 3. Insert

- [插入-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1130)

### 1. demo 一

```c#
var t2 = db.Insertable(insertObj).ExecuteCommand();

db.Insertable<DemoTest.Database.Main.Entity.Models.demo_guiditem>(item).AddQueue();

db.Insertable(demo_Guiditems);


db.Insertable<DemoTest.Database.Main.Entity.Models.urlsguiditem>(item).AddQueue();

```

### 2. demo 二

```c#
db.Utilities.PageEach(demo_Guiditems, 500, list =>
{
    var t2 = db.Insertable(list).ExecuteCommand();
});

```

### 3. 更新或者插入

```c#


var Students = db.Saveable<Student>(entity).ExecuteReturnEntity();

var count = db.Saveable<Student>(entity).ExecuteCommand();

var t0 = db.Saveable<Student>(entity).ExecuteCommand();

```

### 4. 插入速度快慢

```c#
var count = db.Saveable(F1()).ExecuteCommand();
LogsExtenions.Log($"[{i}] 插入成功数量:{count}");
```

### 5. 开启事务

```c#
//count = db.Saveable(items).ExecuteCommand();/*[0] 插入成功数量:10000 用时 38.8440082(秒) 38844.0082(毫秒)*/
count = db.Insertable(items).ExecuteCommand();/*[0] 插入成功数量:10000 用时 21.5714325(秒) 21571.4325(毫秒)*/
/*方式三*/ /*[0] 插入成功数量:10000 用时 3.0299185(秒) 3029.9185(毫秒)*/
FunInsert3(false);

/// <summary>开启事务 Saveable  </summary>
bool FunInsert3(bool IsDebug2 = false)
{
    if (IsDebug2 == false) { return false; }

    try
    {
        db.Ado.BeginTran();

        count = db.Saveable(items).ExecuteCommand();

        db.Ado.CommitTran();
    }
    catch (Exception)
    {
        db.Ado.RollbackTran();

    }
    return true;
}

// 必须开启事务模式不然慢死了
System.Diagnostics.Stopwatch Stopwatch = new System.Diagnostics.Stopwatch();
Stopwatch.Reset();
Stopwatch.Start();

try
{
    db.Ado.BeginTran();

    var t3 = db.Updateable<UserItem>(list).UpdateColumns(it => new { it.Title, it.Keywords, it.Description }).ExecuteCommand();
    SerilogApp.Log.ConsoleLogger.Information($"已经更新入库数量:{t3}");
    db.Ado.CommitTran();
}
catch (Exception)
{
    db.Ado.RollbackTran();
}

Stopwatch.Stop();
SerilogApp.Log.ConsoleLogger.Information($"[流程运行用时: {Stopwatch.Elapsed.TotalSeconds}(秒) {Stopwatch.Elapsed.TotalMilliseconds}(毫秒)");
```

## 4. select

### 0. SQL 语句中, asc 是指定列按升序排列，desc 则是指定列按降序排列

```c#
// 建立索引
roboter
"roboter" COLLATE BINARY DESC


CREATE INDEX "main"."roboter"
ON "T_Demourls" (
  "roboter" COLLATE BINARY DESC
);

```

### 1. 返回指定列匿名类集合

- [.Select 用法-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1159)
- [SqlSugar 常用查询实例-拉姆达表达式 - 天马 3798 - 博客园](https://www.cnblogs.com/tianma3798/p/6093088.html)

```C#
string sql;
var JArray1 = Newtonsoft.Json.JsonConvert.DeserializeObject<Newtonsoft.Json.Linq.JArray>(Newtonsoft.Json.JsonConvert.SerializeObject(db.Ado.SqlQuery<dynamic>(sql)));
var ILogsItems = db.Ado.SqlQuery<ILogsItem>(sql).ToList();
var ILogsItem = db.Ado.SqlQuerySingle<ILogsItem>(sql);

db.Ado.GetDataTable("select * from student");

var data = db.Queryable<Student>()
    .Select(f => new
    {
      f.ID,
      f.Name
    }).ToList();
/*
生成SQL:
SELECT  [ID] AS [ID] , [Name] AS [Name]  FROM [Student]
其它数据库类似, 不一一列举
*/
```

### 2. 排序

```c#
// - SQL 语句中, asc 是指定列按升序排列，desc 则是指定列按降序排列。
// desc 降序
// Asc 升序

var getAllOrder = db.Queryable<Student>().OrderBy(it => it.ID, OrderByType.Desc).ToList(); //收到设置为DESC排序
var getAllOrder = db.Queryable<Student>().OrderBy(it => it.ID, OrderByType.Asc).ToList(); //收到设置为Asc排序

var getAllOrder = db.Queryable<Student>().OrderBy(it => it.ID).ToList(); //默认为ASC排序
/*
生成SQL:
SQL Server:
SELECT [ID],[Name] FROM [Student] ORDER BY [ID] ASC

其它数据库类似
*/

// .OrderBy(it => it.createtime, OrderByType.Desc)

var getAllOrder = db.Queryable<Student>().OrderBy(it => it.ID, OrderByType.Desc).ToList(); //收到设置为DESC排序
/*
生成SQL:
SQL Server:
SELECT [ID],[Name] FROM [Student] ORDER BY [ID] DESC
*/
```

### 3. 多个字段

```c#
var getAllOrder = db.Queryable<Student>().OrderBy(it => it.ID).ToList(); //默认为ASC排序
/*
生成SQL:
SQL Server:
SELECT [ID],[Name] FROM [Student] ORDER BY [ID] ASC

其它数据库类似
*/

var getAllOrder = db.Queryable<Student>().OrderBy(it => it.ID, OrderByType.Desc).ToList(); //收到设置为DESC排序
/*
生成SQL:
SQL Server:
SELECT [ID],[Name] FROM [Student] ORDER BY [ID] DESC
*/
```

### 4. 取前 5 条

```c#
var top5 = db.Queryable<Student>().Take(5).ToList();
/*
生成SQL:
SQL Server:
SELECT * FROM (SELECT [ID],[Name],ROW_NUMBER() OVER( ORDER BY GetDate() ) AS RowIndex  FROM [Student] ) T WHERE RowIndex BETWEEN 1 AND 5
SQL虽长但是性能和TOP5方式是一样的ORM保证了写法统一改成ROW方式

MySQL:
SELECT `ID`,`Name` FROM `Student` LIMIT 0,5

Oracle:
SELECT * FROM (SELECT "ID","Name",ROW_NUMBER() OVER( ORDER BY sysdate ) AS RowIndex  FROM "Student" ) T WHERE RowIndex BETWEEN 1 AND 5

Sqlite:
SELECT `ID`,`Name` FROM `Student` LIMIT 0,5
*/
```

### 5. 条件查询

```c#
var getByWhere = db.Queryable<Student>().Where(it => it.Id == 1 || it.Name == "a").ToList();
/*
生成SQL:
SQL Server:
SELECT [ID],[Name] FROM [Student]  WHERE (( [ID] = @ID0 ) OR ( [Name] = @Name1 ))
其中@ID0值为1, @Name1值为a

MySQL:
SELECT `ID`,`Name` FROM `Student`  WHERE (( `ID` = @ID0 ) OR ( `Name` = @Name1 ))
其中@ID0值为1, @Name1值为a

Oracle:
SELECT "ID","NAME" FROM "STUDENT"  WHERE (( "ID" = :ID0 ) OR ( "NAME" = :Name1 ))
其中:ID0值为1, :Name1值为a

Sqlite:
SELECT `ID`,`Name` FROM `Student`  WHERE (( `ID` = @ID0 ) OR ( `Name` = @Name1 ))
其中@ID0值为1, @Name1值为a
*/
```

### 6. 统计

```c#
// 大数据别用这个查询卡死
root.allcount = db.Queryable<UserItem>().Count();
SELECT COUNT (*)   as   总计   FROM "main"."T_demousers_guid"

```

### 7. 判断是否存根据主键查询

```c#

```

### 8. 判断记录是否存

```c#
// 推荐 耗时 少
var isAny = db.Ado.GetScalar("SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '0086' LIMIT 1)").ToBoolean();



var isAny1 = db.Ado.GetScalar("SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '世界与我无关' LIMIT 1)");
var isAny2 = db.Ado.GetScalar("SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '007' LIMIT 1)");
var isAny3 = db.Ado.GetScalar("SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '0086' LIMIT 1)");

var isAny4 = db.Ado.SqlQuerySingle<bool>("SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '世界与我无关' LIMIT 1)");
var isAny5 = db.Ado.SqlQuerySingle<bool>("SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '007' LIMIT 1)");
var isAny6 = db.Ado.SqlQuerySingle<bool>("SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '0086' LIMIT 1)");

bool exists = db.Queryable<Contents001Item>().Any(it => it.Guid == guid);

return db.Queryable<UserItem>().Any(it => it.guid == aitem.hrefmd5);

var exists = db.Queryable<Contents001Item>().Any(it => it.Guid == guid);

```

### 8. Valid query to check if row exists in SQLite3

- [Valid query to check if row exists in SQLite3](https://stackoverflow.com/questions/9755860/valid-query-to-check-if-row-exists-in-sqlite3)

```c#
SELECT EXISTS(SELECT 1 FROM T_OneValues WHERE Value = '世界与我无关' LIMIT 1)

SELECT EXISTS(SELECT 1 FROM TestLong WHERE Id=888 LIMIT 1);

// 因此，您提出的查询将是最有效的：(So the query you proposed will be the most efficient:)
SELECT EXISTS(SELECT 1 FROM myTbl WHERE u_tag="tag");

// 如果您对可移植性感到不安，可以增加一个限制。我怀疑大多数DB都会为您提供相同的短路。(If you were nervous about portability, you could add a limit. I suspect most DBs will offer you the same short circuit however.)
SELECT EXISTS(SELECT 1 FROM myTbl WHERE u_tag="tag" LIMIT 1);

```

### 9. 随机查询出 10 条数据

```c#
UserItems = db.Queryable<UserItem>().OrderBy(it => SqlSugar.SqlFunc.GetRandom()).Take(3).ToList();

UserItems = db.Queryable<UserItem>().Where(it => it.used == 0).OrderBy(it => SqlSugar.SqlFunc.GetRandom()).Take(3).ToList();

var UserItems = db.Queryable<Module.siteitem.Main.Entity.DB.Models.UserItem>().Where(it => it.linktype == DemoCore.Module.siteitem.Main.Const.UserItemtype.article).OrderBy(it => SqlSugar.SqlFunc.GetRandom()).Take(50).ToList();
```

### 10. 特殊符号查询

```SQL
SELECT T_demos.url
FROM   T_demousers
WHERE  T_demos.url LIKE '%/news/%'


```

### 11. SqlSugar 常用查询实例-拉姆达表达式

#### 1. 查询列表

```c#
//查询列表
SqlSugarClient db = SugarContext.GetInstance();
List<teacher> tList = db.Queryable<teacher>().ToList();
Console.WriteLine(tList.Count);

var studentDynamic = db.Queryable<student>().ToDynamic();
Console.WriteLine(studentDynamic);

string teaJson = db.Queryable<teacher>().ToJson();
Console.WriteLine(teaJson);

//Json序列化的DateTime处理
db.SerializerDateFormat = "yyyy年MM月dd日";
string teacher1 = db.Queryable<teacher>().OrderBy("tbirthday desc").Take(2).ToJson();
string teacher2 = db.Sqlable().From<teacher>("t").SelectToJson(" top 1 *");
string teacher3 = db.SqlQueryJson("select top 1 * from teacher;");
Console.WriteLine(teacher1);
Console.WriteLine(teacher2);
Console.WriteLine(teacher3);
Console.WriteLine(tList.First().tbirthday.Value.ToString("yyyy-MM-dd"));
```

#### 2. 常用查询

```c#
//查询单条
SqlSugarClient db = SugarContext.GetInstance();
teacher tea1 = db.Queryable<teacher>().Single(t => t.tno == "804");//如果查询数据库没有数据，抛出异常
Console.WriteLine(tea1.tname);
//根据主键查询单条
teacher tea2 = db.Queryable<teacher>().InSingle("814");//如果查询数据为空，返回null
Console.WriteLine(tea2.ToJsonString());// 输出：null
/***考虑查询为空的情况***/
teacher tea3 = db.Queryable<teacher>().SingleOrDefault(t => t.tno == "814");
Console.WriteLine(tea3.ToJsonString());// 输出：null
teacher tea4 = db.Queryable<teacher>()
    .Where(q => q.tno == "814")
    .FirstOrDefault(); //此处扩展方法仿EF First()/FirstOrDefault()
Console.WriteLine(tea4.ToJsonString()); // 输出：null


/*****常用查询******/
//1.判断是否存在
bool exists1 = db.Queryable<teacher>().Any(q => q.tno == "814");
Console.WriteLine(exists1);
//2.模糊查询，含有
List<teacher> contains1 = db.Queryable<teacher>()
    .Where(q => q.tname.Contains("李"))
    .ToList();
Console.WriteLine(contains1.ToJsonString());
//以xxx结尾
List<teacher> end1 = db.Queryable<teacher>()
        .Where(q => q.tname.EndsWith("成"))
        .ToList();
Console.WriteLine(end1.ToJsonString());
//3. in关键词查询
string[] idList = new string[] { "804", "825" };
List<teacher> in1 = db.Queryable<teacher>()
    .In(q => q.tno, idList)  //如果不支持拉姆达表达式，默认为主键
    .ToList();
Console.WriteLine(in1.ToJsonString());
List<teacher> in2 = db.Queryable<teacher>()
    .Where(q => idList.Contains(q.tno))
    .ToList();
Console.WriteLine(in2.ToJsonString());


/*********汇总查询等***********/
//1.获取总数
int count = db.Queryable<teacher>()
    .Where(q => q.tsex == "男")
    .Count();
Console.WriteLine("count=" + count);
//2.获取最大值
decimal maxDegree = db.Queryable<score>()
    .Where(q => q.cno == "3-105")
    .Max(q => q.degree) //此处Max返回的结果为Object需要拆箱
    .ObjToDecimal();
Console.WriteLine("maxDegree:" + maxDegree);
//3.获取最小值
decimal minDegree = db.Queryable<score>()
    .Where(q => q.cno == "3-105")
    .Min(q => q.degree)
    .ObjToDecimal();
Console.WriteLine("minDegree:" + minDegree);
//4.平均值
//SqlSugar 不支持 平均值的扩展方法

/***复杂的查询可以使用Sql字符串实现***/
//var list = db.Queryable<InsertTest>().Where("id=@id and name=@name", new { id = 1, name = xxx }).ToList();
```

#### 3. 分页查询

```c#
//分页查询处理
SqlSugarClient db = SugarContext.GetInstance();
//分页方式1
Queryable<teacher> query = db.Queryable<teacher>();
query = query.Where(q => q.tno.StartsWith("8"));
//排序
//query = query.OrderBy("tbirthday desc"); //排序说明，如果是倒叙，需要传入排序的sql片段
query = query.OrderBy(q => q.tbirthday);    //如果是正序，可以指定拉姆达表达式
int allCount = query.Count();
//分页
//List<teacher> list1 = query.Skip(1).Take(2).ToList();
//或者
List<teacher> list1 = query.ToPageList(1, 2);
Console.WriteLine("list1-count:" + allCount);
Console.WriteLine("list1:" + list1.ToJsonString());


//分页方式2+符合查询 多where是and拼接
Queryable<student> query2 = db.Queryable<student>();
query2 = query2.Where(q => q.ssex == "男");
query2 = query2.Where(q => q.sname.EndsWith("军"));


//排序
query2 = query2.OrderBy(q => q.sbirthday);
int allCount2 = 0;
//分页
List<student> list2 = query2.ToPageList(1, 2, ref allCount2);
Console.WriteLine("list2-count:" + allCount2);
Console.WriteLine("list2:" + list2.ToJsonString());
```

#### 4. 汇总查询 2

```c#
//分组，查询汇总
SqlSugarClient db = SugarContext.GetInstance();
dynamic result1 = db.Queryable<student>()
    .GroupBy(q => q.ssex)
    .Select("ssex,count(*) Count")
    .ToDynamic();
foreach (var item in result1)
{
    Console.WriteLine(item.ssex + "----" + item.Count);
}

string result2 = db.Queryable<score>()
    .GroupBy(q => q.sno)
    .Select("sno,isnull(sum(degree),0)")
    .ToJson();
Console.WriteLine(result2);
```

#### 5. 关联表查询

```c#
static void QueryFive()
{
    //关联表查询，筛选等
    SqlSugarClient db = SugarContext.GetInstance();
    //将结果转换成其他对象
    var result = db.Queryable<score>()
        .JoinTable<student>((s1, s2) => s1.sno == s2.sno)
        .OrderBy(s1 => s1.degree)
        .Take(1)
        .Select<score, student, Score_Student>((s1, s2) => new Score_Student
        {
            sno = s1.sno,
            sname = s2.sname,
            cno = s1.cno,
            degree = s1.degree
        }).ToList();
    Console.WriteLine(result.ToJsonString());
    //输出结果
    //[{"sno":"101","sname":"李军","degree":64.0,"cno":"3-105"}]

    //关联查询
    //特别说明：如果指定了关联表代表参数s1,s2,那么在后边的筛选等操作中需要使用表字段的地方，必须使用s1或s2
    var result2 = db.Queryable<score>()
        .JoinTable<student>((s1, s2) => s1.sno == s2.sno)
        .Where(s1 => s1.degree > 64)
        .Where(s1 => s1.degree < 70)
        .ToJson();
    Console.WriteLine(result2);
    //输出结果：
    //[{"sno":"109","cno":"3-245","degree":68.0,
    //"sno1":"109","sname":"王芳","ssex":"女","sbirthday":"\/Date(161193600000)\/","class":"95031"}]


    //获取单个表的投影
    //特别说明，如果想获取单个表的投影，需要先将查询结果.ToList(),然后在创建匿名对象
    //或者 Select()中使用sql指定列名
    var result3 = db.Queryable<student>()
        .OrderBy(q => q.sbirthday)
        .Take(1)
        .ToList()
        .Select(q => new
        {
            sno = q.sno,
            sname = q.sname
        });
    Console.WriteLine(result3.ToJsonString());
    //输出结果：
    //[{"sno":"103","sname":"陆军"}]


    //获取多个表，投影
    var result4 = db.Queryable<score>()
        .JoinTable<student>((s1, s2) => s1.sno == s2.sno)
        .OrderBy(s1 => s1.degree)
        .Take(1)
        .Select("s1.*,s2.sname as sname")
        .ToJson();
    Console.WriteLine(result4);
    //输出结果：
    //[{"sno":"101","cno":"3-105","degree":64.0,"sname":"李军","row_index":1}]
}
public class Score_Student
{
    public string sno { get; set; }
    public string sname { get; set; }
    public decimal degree { get; set; }
    public string cno { get; set; }
}
```

#### 6. Between 查询 尝试时间查询失败记录

```c#
// it.createtime >= DateTime.Now.AddMinutes(-1) && it.createtime <= DateTime.Now
bool exists2 = db.Queryable<demo>().Any(it => it.UniqueId == apirequestpackagetaskqueueinstanttask.websiteNewsUpdate.host && SqlFunc.Between(it.createtime, DateTime.Now.AddMinutes(-1), DateTime.Now));
```

#### 7. 根据主键查询

```c#
var getByPrimaryKey = db.Queryable<Student>().InSingle(2);
```

#### 8. 是否存在这条记录

```c#
var isAny = db.Queryable<Student>().Where(it => it.Id == -1).Any();
var isAny2 = db.Queryable<Student>().Any(it => it.Id == -1);
```

#### 9. 查询返回值

- [.Select 用法-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1159)

```c#
var isAny = db.Queryable<Student>().Where(it => it.Id == -1).Any();
var isAny2 = db.Queryable<Student>().Any(it => it.Id == -1);
```

##### 1. 返回指定类集合

- [.Select 用法-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1159)

```c#
List<ResultModel> data = db.Queryable<Student>()
    .Select(f => new ResultModel
    {
      ID = f.ID,
      StudentName = f.Name
    }).ToList();
```

##### 2. 使用字符串代替 Lambda 表达进行查询

##### 3. 只查询某列

- [.Select 用法-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1159)

```c#
List<Student> list = db.Queryable<Student>().Select("guid").ToList();

List<Student> list = db.Queryable<Student>().Select("*").ToList(); //查询所有列, 并返回List<Student>

List<ResultModel> list = db.Queryable<Student>().Select<ResultModel>("ID, Name").ToList(); //查询ID和Name两个列, 并转成List<ResultModel>
/*
ResultModel里面的属性无需和Select方法里面的列名字符串一一对应, 只会映射对应的列和属性
如ResultModel里面只有一个ID属性, 则只会匹配ID, Name不会引发异常
同时, 如果ResultModel里面的属性多, 只会是默认值, 也不会引发异常
*/
```

##### 4. 查询单条

- [.Select 用法-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1123)

```c#
// 查询单条没有数据返回NULL, Single超过1条会报错，First不会

var getSingleOrDefault = db.Queryable<Student>().Single();
var getFirstOrDefault = db.Queryable<Student>().First();
```

#### 10. 执行 SQL

- [执行 SQL](http://www.codeisbug.com/Doc/8/1121)

```c#
// (int pageIndex, int pageSize);

// 非常卡,高延迟,低性能: 随机值不要sql里做:

Students = db.SqlQueryable<Student>("SELECT * FROM Student LIMIT 1 OFFSET ABS(RANDOM()) % MAX((SELECT COUNT(*) FROM Student), 1)").ToList();

// 分布操作获取偏移值:
SELECT  *  FROM T_demousers WHERE T_demos.used = 0 LIMIT 1 OFFSET r
SELECT  *  FROM T_demousers WHERE T_demos.used = 0 LIMIT 1 OFFSET 2
SELECT  *  FROM T_demousers WHERE T_demos.used = 0 LIMIT 1 OFFSET 3

var t12 = db.SqlQueryable<Student>("select * from student").Where(it=>it.id>0).ToPageList(1, 2);
var t12 = db.SqlQueryable<dynamic>("select * from student").ToPageList(1, 2);
var t12 = db.SqlQueryable<Student>(Sql).Take(Amount).ToList();
var t12 = db.SqlQueryable<dynamic>("SELECT COUNT (guid)   as   cnt   FROM \"main\".\"T_demousers\"").ToPageList(1, 2);
root.allcount = Convert.ToInt32(t12[0].cnt);

// Sqlqueryable sqlueryable只支持查询操作，并且支持拉姆达分页
var t12 = db.SqlQueryable<Student>("select * from student").Where(it=>it.id>0).ToPageList(1, 2);
var t12 = db.SqlQueryable<dynamic>("select * from student").ToPageList(1, 2);//返回动态类型

// Ado方法
// 1.重载：object parameters
var dt=db.Ado.SqlQuery<Student>("select * from table where id=@id and name=@name",new {id=1,name="a"});
var dt=db.Ado.SqlQuery<Student>("select * from table where id=@id and name=@name",字典);

// 2.重载： List<SugarParameter> parameters
var dt=db.Ado.GetDataTable("select * from table where id=@id and name=@name",new List<SugarParameter>(){
  new SugarParameter("@id",1),
  new SugarParameter("@name",2)
});

// 3.重载：params SugarParameter[] parameters
var dt=db.Ado.GetDataTable("select * from table");
var dt=db.Ado.GetDataTable("select * from table where id=@id",new SugarParameter("@id",1));
var dt=db.Ado.GetDataTable("select * from table where id=@id and name=@name",new SugarParameter []{
  new SugarParameter("@id",1),
  new SugarParameter("@name",2)
});

// 全部函数

// 1.获取DataTable (如是.Net Core版本, DataTable是Sqlsugar自定义的DataTable, 因为以前的Core 1.x不支持DataTable, 后遗症, 效率不用担心)

db.Ado.GetDataTable(string sql, object parameters);
db.Ado.GetDataTable(string sql, params SugarParameter[] parameters);
db.Ado.GetDataTable(string sql, List<SugarParameter> parameters);

// 2.获取DataSet

db.Ado.GetDataSetAll(string sql, object parameters);
db.Ado.GetDataSetAll(string sql, params SugarParameter[] parameters);
db.Ado.GetDataSetAll(string sql, List<SugarParameter> parameters);


// 3.获取DataReader

db.Ado.GetDataReader(string sql, object parameters);
db.Ado.GetDataReader(string sql, params SugarParameter[] parameters);
db.Ado.GetDataReader(string sql, List<SugarParameter> parameters);

// 4.获取首行首列返回object类型

db.Ado.GetScalar(string sql, object parameters);
db.Ado.GetScalar(string sql, params SugarParameter[] parameters);
db.Ado.GetScalar(string sql, List<SugarParameter> parameters);

// 5.执行数据库返回受影响行数

int ExecuteCommand(string sql, object parameters);
int ExecuteCommand(string sql, params SugarParameter[] parameters);
int ExecuteCommand(string sql, List<SugarParameter> parameters);


// 6.获取首行首列更多重载

//以下为返回string
string GetString(string sql, object parameters);
string GetString(string sql, params SugarParameter[] parameters);
string GetString(string sql, List<SugarParameter> parameters);

//返回int
int GetInt(string sql, object pars);
int GetInt(string sql, params SugarParameter[] parameters);
int GetInt(string sql, List<SugarParameter> parameters);

//返回double
db.Ado.GetDouble(string sql, object parameters);
db.Ado.GetDouble(string sql, params SugarParameter[] parameters);
db.Ado.GetDouble(string sql, List<SugarParameter> parameters);

//返回decimal
db.Ado.GetDecimal(string sql, object parameters);
db.Ado.GetDecimal(string sql, params SugarParameter[] parameters);
db.Ado.GetDecimal(string sql, List<SugarParameter> parameters);

//返回DateTime
db.Ado.GetDateTime(string sql, object parameters);
db.Ado.GetDateTime(string sql, params SugarParameter[] parameters);
db.Ado.GetDateTime(string sql, List<SugarParameter> parameters);


// 7.查询并返回List<T>

db.Ado.SqlQuery<T>(string sql, object whereObj = null);
db.Ado.SqlQuery<T>(string sql, params SugarParameter[] parameters);
db.Ado.SqlQuery<T>(string sql, List<SugarParameter> parameters);


// 8.查询返回单条记录

db.Ado.SqlQuerySingle<T>(string sql, object whereObj = null);
db.Ado.SqlQuerySingle<T>(string sql, params SugarParameter[] parameters);
db.Ado.SqlQuerySingle<T>(string sql, List<SugarParameter> parameters);


// 9.查询返回动态类型(该类型为Newtonsoft.Json里面的JObject类型, 使用方法自行百度)

db.Ado.SqlQueryDynamic(string sql, object whereObj = null);
db.Ado.SqlQueryDynamic(string sql, params SugarParameter[] parameters);
db.Ado.SqlQueryDynamic(string sql, List<SugarParameter> parameters);
```

##### 1. Like

```c#

// Sqlite like
SELECT * FROM T_demousers_guid WHERE T_demousers_guid.url LIKE '%163.com%' AND
T_demousers_guid.url LIKE '%.html%' AND
T_demousers_guid.url LIKE '%/%'

```

## 5. Update

- [更新-Update](http://www.codeisbug.com/Doc/8/1129)

```c#
// SqlSugar更新分为2大类写法，1种是传实体对象的方式 这种是以实体对象为核心进行更新，不传实体对象这种是以表达式为核心进行更新

//传实体对象写法（支持批量对象）
db.Updateable(updateObj)

//不传实体对象写法
db.Updateable<T>()

// 传对象的用法  根据实体更新（主键要有值，主键是更新条件）
var t1 = db.Updateable(updateObj).ExecuteCommand(); //这种方式会以主键为条件

// 4.2.3添加了WhereColumns 虽然XId不是主键但是 XId作为更新条件
var t1 = db.Updateable(updateObj).WhereColumns(it=>new{it.XId}).ExecuteCommand();//单列可以用 it=>it.XId

//需要注意 当WhereColumns和UpdateColumns一起用时，需要把wherecolumns中的列加到UpdateColumns中
var update = db.Updateable(updateObj).UpdateColumns(s => new { s.RowStatus,s.Id }).WhereColumns(it => new { it.Id });

// 只更新实体里面的Name列(主键要有值，主键是更新条件)
var t3 = db.Updateable(updateObj).UpdateColumns(it => new { it.Name }).ExecuteCommand();

// 更新 Name和 TestId 以外的所有列 (主键要有值，主键是更新条件)

var t4 = db.Updateable(updateObj)
.IgnoreColumns(it => new { it.Name, it.TestId }).ExecuteCommand();


// 更新NAME 以外的所有列
var t5 = db.Updateable(updateObj)
.IgnoreColumns(it => it=="name" ).ExecuteCommand(); //name列不更新

var t5 = db.Updateable(updateObj)
.IgnoreColumns(it => list.Contains(it)  ).ExecuteCommand(); //List中所有列不更新

// 使用锁
var t6 = db.Updateable(updateObj).With(SqlWith.UpdLock).ExecuteCommand();

// 批量更新(主键要有值，主键是更新条件)
List<Students> list=GetList();
var t7 = db.Updateable(list).ExecuteCommand();

// 实体更新，并且给Name重新赋值 ，其它列也会更新
var t8 = db.Updateable(updateObj)
.ReSetValue(it => it.Name == (it.Name + 1)).ExecuteCommand();

// 只更新Name并且 Name的值等于Name+1, 如果updateObj值为NULL一定要加WHERE才可以

//写法1
var t8 = db.Updateable(updateObj)
.UpdateColumns(it=>new {it.Name}).ReSetValue(it => it.Name == (it.Name + 1)).ExecuteCommand();

// 第一种updateable()有参数的，下面二种是没参数的注意下区别
// 更新实体，更新条件是根据表达式
var t9 = db.Updateable(updateObj).Where(it => it.Id == 1).ExecuteCommand();

// 是NULL的列不更新
db.Updateable(updateObj).IgnoreColumns(ignoreAllNullColumns:true).ExecuteCommand();

// 4.6.4.8 版本支持了不需要泛型的字典
//如果initKey.Systemtable方是写法
var dt = new Dictionary<string,object>();
dt.Add("id", 1);
dt.Add("name", "1");
var t66 = db.Updateable(dt).AS("student").ExecuteCommand();
//UPDATE STUDENT  SET  NAME=@name  WHERE ID=@ID

//如果initkey.Attribute方式是拿不出主键信息的需要写成这样
var dt = new Dictionary<string,object>();
dt.Add("id", 1);
dt.Add("name", "1");
var t66 = db.Updateable(dt).AS("student").WhereColumns("id").With(SqlWith.UpdLock).ExecuteCommand()

//没有WhereColumns(string)去下载最新的
//也支持List<Dictionary<string,object>>


4.2.2 更新 匿名对象和字典的支持

 var t13 = db.Updateable<Student>(new { Name = "a", id=1 }).ExecuteCommand();
 //UPDATE [STudent]  SET [Name]='a' WHERE [Id]=1
 var t14 = db.Updateable<Student>(new Dictionary<string, object>() { { "id", 1 }, { "name", "a" } }).ExecuteCommand();
 //UPDATE [STudent]  SET [Name]='a' WHERE [Id]=1




不传对象的用法

根据表达式中的列更新   ，只更新 Name和CreateTime 条件是id=11，比较常用

//正确写法
 var t10 = db.Updateable<Student>()
.UpdateColumns(it => new Student() { Name = "a", CreateTime = DateTime.Now })
.Where(it => it.Id == 11).ExecuteCommand();

//错误写法
var st=new Student() { Name = "a", CreateTime = DateTime.Now };
var t10 = db.Updateable<Student>()
.UpdateColumns(it => st)
.Where(it => it.Id == 11).ExecuteCommand();


别名表

db.Updateable<School>().AS("Student")
.UpdateColumns(it => new School() { Name = "jack" })
.Where(it => it.Id == 1).ExecuteCommand();
//Update Student set Name='jack' Where Id=1


4.6.0.7 联表更新


var t17 = db.Updateable<Student>().UpdateColumns(it =>
       new Student(){
        SchoolId = SqlFunc.Subqueryable<School>().Where(s => s.Id == it.SchoolId).Select(s => s.Id),
        Name = "newname"
       }).Where(it => it.Id == 1).ExecuteCommand();
UPDATE [STudent]  SET
            [SchoolId] = (SELECT TOP 1 [Id] FROM [School] WHERE ( [Id] =[STudent].[SchoolId] )) ,
            [Name] = @Const0   WHERE ( [ID] = @Id1 )


只更新Name并且 Name的值等于Name+1

//写法1
var t8 = db.Updateable<Student>().UpdateColumns(it => new Student() { Name = it.Name+1}).Where(it => it.Id == 11).ExecuteCommand();

//写法2 (注意：4.5.9.8以上版本支持) 如果只有一列可以简化成这种写法
var t8= db.Updateable<Student>().UpdateColumns(it => it.Name == it.Name+1).Where(it => it.Id == 11).ExecuteCommand();




技巧功能

//根据不同条件执行更新不同的列
var t3 = db.Updateable(updateObj)
                .UpdateColumnsIF(caseValue=="1",it => new { it.Name })
                .UpdateColumnsIF(caseValue=="2", it => new { it.Name,it.CreateTime })
                .ExecuteCommand();
```

### 1. 只更新某列

```c#
// 只更新实体里面的 Name 列(主键要有值，主键是更新条件)
var t3 = db.Updateable(updateObj).UpdateColumns(it => new { it.Name }).ExecuteCommand();
```

### 2. 更新代码 1

```c#
db.Utilities.PageEach(urlsguiditems_PageEach, 200, list =>
{
    var t2 = db.Updateable(list).UpdateColumns(it => new { it.status }).ExecuteCommand();
});
```

## 6. page 分页查询

- [更新-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1129)

```c#
public static bool ReleaseResources()
{
    Thread oThread = new Thread(delegate ()
    {

        System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
        stopwatch.Reset();
        stopwatch.Start();

        var pageIndex = 1;
        var pageSize = 1000;
        var totalCount = 0;
        var totalPage = 1;

        object lockObj_lock = new object();
        var SuccessTotalCount = 0;

        using (var db = GetInstance_Main_UserItems())
        {
            var UserItems = db.Queryable<UserItem>().ToPageList(pageIndex, pageSize, ref totalCount, ref totalPage);
        }

        Parallel.For(0, totalPage, new ParallelOptions() { MaxDegreeOfParallelism =60 }, (i, loopState) =>
        {
            using (var db = GetInstance_Main_UserItems())
            {
                var UserItems = db.Queryable<UserItem>().Select("guid").ToPageList(i+1, pageSize);
                lock (lockObj_lock)
                {
                    SuccessTotalCount += UserItems.Count;
                }

            }
        });

        stopwatch.Stop();
        Console.WriteLine("总数据量:{0}", totalCount);
        Console.WriteLine("成功遍历{0}条数据 ，用时{1}秒。", SuccessTotalCount, stopwatch.Elapsed.TotalSeconds);
        Console.WriteLine("总页数:{0}", totalPage);

    });
    oThread.IsBackground = true;
    oThread.Start();
    return true;
}
```

## 7. PageEach 与 Paginate 实现分页

- [Error Happened](https://gist.github.com/qjuanp/8957151)

### 0. 常用

```c#
var newItems = items.Paginate<CategoryInfo>(pageIndex, pageSize).ToList();
return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<CategoryInfo>(pageIndex, pageSize, items.Count, newItems));

var newItems0 = items.Paginate<IDtem>(1, 10);
var newItems1 = items.Paginate<IDtem>(2, 10);
var newItems3 = items.Paginate<IDtem>(3, 10);

public static class PaginateExtension
    {
        public static IEnumerable<T> Paginate<T>(this IEnumerable<T> query, int page = 1, int rows = 20)
        {
            return query.Skip((page - 1) * rows).Take(rows);
        }
    }
```

```c#
// Redis
var startIndex = (root.Pagination.PageIndex - 1) * root.Pagination.PageSize;
var endIndex = startIndex + root.Pagination.PageSize;

// SQL
var startIndex = (root.Pagination.PageIndex - 1) * root.Pagination.PageSize;
var endIndex = root.Pagination.PageSize;
```

### 1. PageEach

```c#
ExtenionsPage.PageEach(items, 10, list =>
{
    try
    {
        var items0 = list;
    }
    catch (Exception ex)
    {
    }
});


PageExtenions.PageEach(1000, 20, CurrentExecutCount =>
{
    try
    {
    catch (Exception ex)
    {
    }
});

ExtenionsPage.PageEach

ExtenionsPage.PageEach(urlsguiditems, 2, list =>
  {
      try
      {
      }
      catch (Exception ex)
      {
      }
  });



PageExtenions.PageEach(GoCount, 1000, CurrentExecutCount =>
{
  ListStrings = new List<string>();
  for (int i = 0; i < CurrentExecutCount; i++)
  {

  }
});
```

### 2. 分页总页数计算公式

- [分页总页数计算公式 - 迟迟年月日 - 博客园](https://www.cnblogs.com/chicymd/p/5828180.html)
- [分页列表计算总页数 面向编程 专栏-CSDN 博客](https://blog.csdn.net/u012760900/article/details/78965903)
- [c# 后台拼接分页 Html - 痱子﹑ - 博客园](https://www.cnblogs.com/feizianquan/p/9720873.html)
- [C#生成分页页码 - 莫球名堂 - 博客园 推荐 PageSplit()](https://www.cnblogs.com/yanjc/p/7056043.html)

```c#
//total : 总数
//pageSize : 每页显示数
//totalPage : 共页数
var totalPage = (total + pageSize - 1)/pageSize;

/// web端分页 推荐这个类
PageSplit


var pageSplit = new PageSplit(100, 2, 25);
pageSplit.SetSplitLength = 25;

pageSplit.DefaultTemplate = "<li class=\"page-item\"><a class=\"page-link\" data-type=\"mip\" href=\"[分页链接]\">[分页页码]</a></li>";
pageSplit.DefaultTemplate = pageSplit.DefaultTemplate.Replace("[分页链接]", $"/Car/p/{{pageindex}}");

pageSplit.DefaultTemplate = pageSplit.DefaultTemplate.Replace("[分页页码]", "{pageindex}");


pageSplit.ActiveTemplate = "<li class=\"page-item\"><a class=\"active page-link\" data-type=\"mip\" href=\"[分页链接]\">[分页页码]</a></li>";
pageSplit.ActiveTemplate = pageSplit.ActiveTemplate.Replace("[分页链接]", $"/Car/p/{{pageindex}}");

pageSplit.ActiveTemplate = pageSplit.ActiveTemplate.Replace("[分页页码]", "{pageindex}");


var SplitHtml = pageSplit.SplitHtml;
```

### 3. 分批入库数据 分页

```c#


        /// <summary>推送网址日志缓存队列容器</summary>
        public static ConcurrentQueue<ILogsItem> LogItems = new ConcurrentQueue<ILogsItem>();

       /// <summary>推送日志入库,限定单次入库数量</summary>
        public static bool LogItemsDequeueToDB()
        {

            if (SqliteDataTmpContainer.LogItems.Count > 0)
            {
                var Logitems = new List<ILogsItem>();

                for (int i = 0; i < 1000; i++)
                {

                    if (SqliteDataTmpContainer.LogItems.TryDequeue(out ILogsItem Logitem))
                    {
                        Logitems.Add(Logitem);
                    }
                    else
                    {
                        break;
                    }
                }

                if (Logitems.Count == 0) { return false; }

                using (var db = Google.Module.Common.Database.Main.Base.GetInstance_By_Guid(Google.Module.Common.Database.Main.Enum.DBType.main_URLPushsLogs))
                {
                    var result = db.Ado.UseTran(() =>
                    {
                        db.Insertable(Logitems).ExecuteCommand();
                    });

                }
            }
            return true;
        }

```

## 8. Read only connection 只读模式

- [SQLite.NET Connection Strings - ConnectionStrings.com](https://www.connectionstrings.com/sqlite-net-provider/)
- [How to open a Sqlite3 database in read-only mode with persistent?](https://stackoverflow.com/questions/31345498/how-to-open-a-sqlite3-database-in-read-only-mode-with-persistent)

```c#
Data Source=c:\mydb.db;Version=3;Read Only=True;
```
