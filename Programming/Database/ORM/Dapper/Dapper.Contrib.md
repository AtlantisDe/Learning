# Dapper.Contrib

- Dapper.Contrib - more extensions for dapper
- [Dapper.Contrib](https://www.nuget.org/packages/Dapper.Contrib/)
- [Dapper.Contrib - more extensions for dapper](https://github.com/StackExchange/Dapper/tree/main/Dapper.Contrib)

## 1. 安装

- [SQLite.Interop.dll 1.0.103](https://www.nuget.org/packages/SQLite.Interop.dll/)

```c#
Install-Package Dapper.Contrib -Version 2.0.35

Install-Package SQLite.Interop.dll -Version 1.0.103
```

## 2. 字段特性/Special Attributes

```c#
[Dapper.Contrib.Extensions.Table("T_Users")]
[Dapper.Contrib.Extensions.Key]
//不是自动增长主键时使用ExplicitKey
[Dapper.Contrib.Extensions.ExplicitKey]

[Write(true/false)]
// this property is (not) writeable 此属性是（不可写的）
[Dapper.Contrib.Extensions.Write(true)]
[Dapper.Contrib.Extensions.Write(false)]

[Dapper.Contrib.Extensions.Computed]
// this property is computed and should not be part of updates 此属性是计算得出的，不应作为更新的一部分
```

## 3. 使用

- [Dapper.Contrib——更加优雅地使用 Dapper 进行增删改查 - huanent - 博客园](https://www.cnblogs.com/huanent/p/7762698.html)

```c#
 string cs = "Data Source=:memory:";
cs = @"Data Source=D:\Tmp\Sqlite\SqliteTest002.db3";

using (var con = new System.Data.SQLite.SQLiteConnection(cs))
{
    con.Open();
    var res = con.QueryFirst("select SQLITE_VERSION() AS Version");
    Console.WriteLine(res.Version);

    var res1 = con.QueryFirst<string>("select SQLITE_VERSION() AS Version");
    Console.WriteLine(res1);

    var rst2 = con.Execute("CREATE TABLE 'T_Users' ( 'Id' INTEGER NOT NULL, 'Name' TEXT, 'Age' INTEGER, PRIMARY KEY ( 'Id' ) );");

    //Get one specific entity based on id
    /*Null*/
    var get1 = con.Get<UserItem>(1);

    //or a list of all entities in the table.
    /*count = 0*/
    var get2 = con.GetAll<UserItem>().ToList();

    //Insert methods

    //Insert one entity
    var rst3 = con.Insert(new UserItem { Name = "Volvo3", Age = 3 });
    var rst4 = con.Insert(new UserItem { Name = "Volvo4", Age = 4 });
    var rst5 = con.Insert(new UserItem { Name = "Volvo5", Age = 5 });

    //or a list of entities.
    var UserItems = new List<UserItem>();
    UserItems.Add(new UserItem { Name = "Volvo6", Age = 6 });
    UserItems.Add(new UserItem { Name = "Volvo7", Age = 7 });
    UserItems.Add(new UserItem { Name = "Volvo8", Age = 8 });

    var rst6 = con.Insert(UserItems);

    //Update methods
    //Update one specific entity
    var rst7 = con.Update<UserItem>(new UserItem() { Id = 1, Name = "John" });

    //or update a list of entities.
    var UserItems1 = new List<UserItem>();
    UserItems1.Add(new UserItem { Id = 2, Name = "John2" });
    UserItems1.Add(new UserItem { Id = 3, Name = "John3" });
    var rst8 = con.Update<List<UserItem>>(UserItems1);

    //Delete methods
    //Delete an entity by the specified[Key] property
    var rst9 = con.Delete(new UserItem() { Id = 1 });


    //a list of entities
    var rst10 = con.Delete(UserItems1);

    //or ALL entities in the table.
    var rst11 = con.DeleteAll<UserItem>();



}
```

## 4. Limitations and caveats 扩展冲突解决

```c#
// SQLiteConnection exposes an Update event that clashes with the Update extension provided by Dapper.Contrib. There are 2 ways to deal with this.
// Call the Update method explicitly from SqlMapperExtensions

SqlMapperExtensions.Update(_conn, new Employee { Id = 1, Name = "Mercedes" });

// Make the method signature unique by passing a type parameter to Update

connection.Update<Car>(new Car() { Id = 1, Name = "Maruti" });
```

## 5. Dapper 分页

- [[Dapper].NET/C#使用 Dapper 如何实现查询的分页功能&#xFF1F; | 码友网](https://codedefault.com/s/how-can-i-use-dapper-paging-in-csharp-application)
- [C# SQL Database pagination using Dapper ORM](https://andypalmer.dev/posts/pagination-with-dapper/)
- [jinweijie/Dapper.PagingSample](https://github.com/jinweijie/Dapper.PagingSample)

```c#
//Pages
var UserItems2 = new List<UserItem>();
for (int i = 0; i < 100; i++)
{
    UserItems2.Add(new UserItem { Name = $"John{i}", Age = i });
}
var rst12 = con.Insert(UserItems2);


//Pages Query
var rst13 = con.Query<UserItem>("SELECT T_Users.* FROM T_Users LIMIT 10 OFFSET 10 * (1-1)").ToList();

var pager = new Dot.Net.Common.Engine.Page.Pager(2, 10);
var results = con.Query<UserItem>("SELECT T_Users.* FROM T_Users LIMIT @PageSize OFFSET @PageSize * (@Page-1)", pager);

```

## 6. 线程下事务 错误示例

```c#
        /// <summary>非聚集索引 千万级测试</summary>
        public static bool DebugDemoUnclustered(bool IsDebugging = false)
        {
            if (IsDebugging == false) { return false; }


            var dbPath = @"D:\Tmp\System.Data.SQLite\SQLite001.Unclustered.db";

            var Keywords = (@"D:\Tmp\Words\Words.txt".ReadDocument()).Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries).ToList();

            Thread oThread = new Thread(delegate ()
            {

                using (var con = dbPath.AdminSQLiteConnection())
                {
                    var rst2 = con.Execute("CREATE TABLE 'T_TagItems' ( 'Name' TEXT NOT NULL,'Guid' TEXT NOT NULL);");
                    var rst3 = con.Execute("CREATE INDEX 'T_TagItems_Name_1' ON 'T_TagItems' ('Name' COLLATE BINARY ASC);");


                    using (var transaction = con.BeginTransaction())
                    {
                        try
                        {

                            for (int i = 0; i < 500; i++)
                            {
                                var tagItems = new List<TagItem>();
                                for (int j = 0; j < 10000; j++)
                                {
                                    tagItems.Add(new TagItem { Name = Keywords.GetRandomOneElement(), Guid = ExtenionsGuid.N });
                                }
                                con.Insert(tagItems);
                                transaction.Commit();
                            }

                        }
                        catch (Exception) { transaction.Rollback(); }
                    }

                }

            })
            {
                IsBackground = true
            };
            oThread.Start(); 

            return true;
        }

```
