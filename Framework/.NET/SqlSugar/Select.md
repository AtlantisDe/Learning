# select

## 返回指定列匿名类集合

- [.Select 用法-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1159)
- [SqlSugar 常用查询实例-拉姆达表达式 - 天马 3798 - 博客园](https://www.cnblogs.com/tianma3798/p/6093088.html)

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

### 统计

```c#
root.allcount = db.Queryable<Module.DemoTest.Database.Main.Entity.Models.urlitem>().Count();
SELECT COUNT (*)   as   总计   FROM "main"."T_urls_guid"

```

### 判断是否存根据主键查询

```c#

```

### 判断记录是否存

```c#
bool exists1 = db.Queryable<Module.DemoTest.Database.Main.Entity.Models.urlitem>().Any(it => it.guid == aitem.hrefmd5);
return db.Queryable<Module.DemoTest.Database.Main.Entity.Models.urlitem>().Any(it => it.guid == aitem.hrefmd5);
```

### 随机查询出 10 条数据

```c#
var urlitems = db.Queryable<Module.siteitem.Main.Entity.DB.Models.urlitem>().Where(it => it.linktype == DemoCore.Module.siteitem.Main.Const.urlitemtype.article).OrderBy(it => SqlFunc.GetRandom()).Take(50).ToList();
```

### 特殊符号查询

```c#
SELECT
T_urls.url
FROM
T_urls
WHERE
T_urls.url LIKE '%/NH79X/%'

```

### SqlSugar 常用查询实例-拉姆达表达式

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

#### 10. 执行 SQL

```c#
var t12 = db.SqlQueryable<Student>("select * from student").Where(it=>it.id>0).ToPageList(1, 2);
var t12 = db.SqlQueryable<dynamic>("select * from student").ToPageList(1, 2);
```

##### 1. Like

```c#

// Sqlite like
SELECT * FROM T_urls_guid WHERE T_urls_guid.url LIKE '%163.com%' AND
T_urls_guid.url LIKE '%.html%' AND
T_urls_guid.url LIKE '%/%'

```
