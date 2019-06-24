# select

## 返回指定列匿名类集合

- [.Select 用法-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1159)

```C#
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

### 排序

```c#
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

### 排序 多个字段

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

### 取前 5 条

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

### 条件查询

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

### 随机查询出 10 条数据

```c#
var urlitems = db.Queryable<Module.siteitem.Main.Entity.DB.Models.urlitem>().Where(it => it.linktype == Aleseocore.Module.siteitem.Main.Const.urlitemtype.article).OrderBy(it => SqlFunc.GetRandom()).Take(50).ToList();
```
