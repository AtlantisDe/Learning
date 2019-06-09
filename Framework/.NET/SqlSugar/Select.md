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
