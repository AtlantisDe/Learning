# Insert

- [插入-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1130)

## 代码插入

### demo 一

```c#
var t2 = db.Insertable(insertObj).ExecuteCommand();

db.Insertable<DemoTest.Database.Main.Entity.Models.demo_guiditem>(item).AddQueue();

db.Insertable(demo_Guiditems);


db.Insertable<DemoTest.Database.Main.Entity.Models.urlsguiditem>(item).AddQueue();

```

### demo 二

```c#
db.Utilities.PageEach(demo_Guiditems, 500, list =>
{
    var t2 = db.Insertable(list).ExecuteCommand();
});

```

### 更新或者插入

```c#
db.Saveable<Student>(entity).ExecuteReturnEntity();
var count = db.Saveable<Urlitem>(urlitem).ExecuteCommand();
```
