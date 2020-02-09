# Delete

- [删除-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1128)

## 代码删除

### demo 一

```c#
using (var db = GetInstance_main_log())
{
    var count = db.Deleteable<logitem>().ExecuteCommand();
    db.Ado.GetInt("VACUUM");

    root.code = 200;
    root.message = string.Format("删除成功!删除数据总量:{0}", count);
}
```

### Official

```c#
根据实体删除（实体内主键一定要有值）

var t0 = db.Deleteable<Student>().Where(new Student() { Id = 1 }).ExecuteCommand();


根据实体集删除

var  t1 = db.Deleteable<Student>().Where(new List<Student>() { new Student() { Id = 1 } }).ExecuteCommand();


使用锁

var t2 = db.Deleteable<Student>().With(SqlWith.RowLock).ExecuteCommand();




根据主键删除

var t3 = db.Deleteable<Student>().In(1).ExecuteCommand();


根据主键批量删除

var t4 = db.Deleteable<Student>().In(new int[] { 1, 2 }).ExecuteCommand();


根据非主键批量删除4.9

var t4 = db.Deleteable<Student>().In(it=>it.SchoolId,new int[] { 1, 2 }).ExecuteCommand();




根据表达式删除

var t5 = db.Deleteable<Student>().Where(it => it.Id == 1).ExecuteCommand();//删除等于1的

//批量删除非主键
list<int> list=new list<int>(){1,3};
var t5 = db.Deleteable<Student>().Where(it => !list.Contains(it.Id) ).ExecuteCommand();




4.1.0.6 版本之后可以对上面的语法进行优化

db.Deleteable<Student>(1).ExecuteCommand();
db.Deleteable<Student>(it=>it.id==1).ExecuteCommand();
db.Deleteable<Student>(new int[]{1,2,3}).ExecuteCommand();
db.Deleteable<Student>(实体).ExecuteCommand();


```
