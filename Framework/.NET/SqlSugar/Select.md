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
