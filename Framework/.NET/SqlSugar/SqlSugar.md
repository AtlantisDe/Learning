# SqlSugar

- [sunkaixuan/SqlSugar](https://github.com/sunkaixuan/SqlSugar)

## DOC

- [用前必看-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1121)

## 安装

```C#
Install-Package sqlSugar
Install-Package sqlSugarCore
```

## Using 代码

```C#
// 代码
using (var db = GetInstance())
{

}
// 代码
using (var db = GetInstance())
{
    var join1 = db.Queryable<Student, School>((st, sc) => new object[] {
                JoinType.Left,st.SchoolId==sc.Id
    }).Where(st => st.Id > 0).Select<Student>("*").ToSql();
    base.Check(@"SELECT * FROM `STudent` st Left JOIN `School` sc ON ( `st`.`SchoolId` = `sc`.`Id` )   WHERE ( `st`.`ID` > @Id0 ) ",
        new List<SugarParameter>() {
            new SugarParameter("@Id0",0)
        }, join1.Key, join1.Value, "join 1 Error");
}
```
