# MongoDB Packages

- [mongodb/mongo-csharp-driver](https://github.com/mongodb/mongo-csharp-driver)
- [NuGet Gallery | Packages matching MongoDB](https://www.nuget.org/packages?q=MongoDB)
- [mongodb/mongo-csharp-driver](https://docs.mongodb.com/drivers/csharp)
- [MongoDB Developer Community Forums - MongoDB Developer Community Forums](https://developer.mongodb.com/community/forums/)
- [Topics tagged dot-net](https://developer.mongodb.com/community/forums/tag/dot-net/)

## 0. Packages

```c#
Install-Package MongoDB.Driver -Version 2.11.2
Install-Package MongoDB.Driver.Core -Version 2.11.2
Install-Package MongoDB.Bson -Version 2.11.2
Install-Package MongoDB.Libmongocrypt -Version 1.0.0

DnsClient
Install-Package DnsClient -Version 1.3.2
Install-Package DnsClient -Version 1.3.1

```

## 1. 常用

- [Mongodb 文件存储 - 过客非归 - 博客园 GridFS 是直接与数据库打交道 与 collection 集合无关](https://www.cnblogs.com/tranw/p/6694383.html)

### 0. 创库

```c#
server.GetDatabase("myDB");
```

### 0. 语句 LT、LE、EQ、NE、GE、GT 的意思

```c#
// Mybatis-plus中sql语句LT、LE、EQ、NE、GE、GT的意思
lt：less than 小于
le：less than or equal to 小于等于
eq：equal to 等于
ne：not equal to 不等于
ge：greater than or equal to 大于等于
gt：greater than 大于


// mongodb
AnyGte 大于等于
AnyLte 小于等于


// Builders is really flexible class, it also has overridden operators "& = AND" and "| = OR"

// Your example will be

var filter = Builders<User>.Filter.Eq(x => x.A, "1");
filter &= (Builders<User>.Filter.Eq(x => x.B, "4") | Builders<User>.Filter.Eq(x => x.B, "5"));

```

### 1. 索引

```c#
// 普通索引
var GuidBuilder = Builders<TestItem>.IndexKeys;
var indexModel = new CreateIndexModel<TestItem>(GuidBuilder.Ascending(x => x.Guid));
collection.Indexes.CreateOneAsync(indexModel).Wait();

// Unique
var GuidBuilder = Builders<TestItem>.IndexKeys;
var indexModel = new CreateIndexModel<TestItem>(GuidBuilder.Ascending(x => x.Guid), new CreateIndexOptions { Unique = true });
collection.Indexes.CreateOneAsync(indexModel).Wait();

// 常用
collection.Indexes.CreateOneAsync(new CreateIndexModel<TestItem>(Builders<TestItem>.IndexKeys.Ascending(x => x.Guid), new CreateIndexOptions { Unique = true }));

collection.Indexes.CreateOneAsync(new CreateIndexModel<TestItem>(Builders<TestItem>.IndexKeys.Ascending(x => x.Guid).IndexKeys.Ascending(x => x.Guid2), new CreateIndexOptions { Unique = true }));

collection.Indexes.CreateOneAsync(new CreateIndexModel<TestItem>(Builders<TestItem>.IndexKeys.Ascending(x => x.Guid), new CreateIndexOptions { Unique = true })).Wait();

```

### 2. 是否存在

- [MongoDB how to check for existence](https://stackoverflow.com/questions/6411280/mongodb-how-to-check-for-existence)
- [Checking if a document exists - MongoDB slow findOne vs find](https://blog.serverdensity.com/checking-if-a-document-exists-mongodb-slow-findone-vs-find/)
- [db.collection.findOne() &mdash; MongoDB Manual](https://docs.mongodb.com/manual/reference/method/db.collection.findOne/)

```c#
bool exists = ArticleContent.Find(s => s.Rawurl == resItem.Rawurl).Any();

return ArticleContent.AsQueryable().FirstOrDefault(s => s.Rawurl == resItem.Rawurl) != null;


db.collection.find({_id: "myId"}, {_id: 1}).limit(1)

bool exists = collection.Find(_ => _.~~Name~~ == applicationName).Any();

bool exists = await collection.Find(_ => _.Name == applicationName).AnyAsync();;

var collection = database.GetCollection<ApplicationViewModel>("Applications");
var exists = collection.AsQueryable().Any(avm => avm.Name == applicationName);

var collection = database.GetCollection<ApplicationViewModel>("Applications");
var exists = collection.AsQueryable().FirstOrDefault(avm => avm.Name == applicationName) != null;
```

### 3. 统计 CountDocuments EstimatedDocumentCount

- [Mongoose - count 和 countDocuments 方法 seaalan](https://blog.csdn.net/seaalan/article/details/89217162)

```c#
// count ({})方法已弃用。如果要计算集合中的文档数 (例如count ({})), 请改用estimatedDocumentCount() 函数。否则, 请改用countDocuments()函数。
items = TListensFileChanges.Find(x => true).Skip((pageIndex - 1) * pageSize).Limit(pageSize).ToList();
var count = TListensFileChanges.EstimatedDocumentCount();

// 当前方法
var ArticleCount = TArticleContent.CountDocuments(x => x.Keywords.Contains(item.Name));
var count = (int)TStockCategoryStockKVs.CountDocuments(x => x.NodeId.Equals(stockCategorie.NodeId));

var result = TArticleContent.AsQueryable().GroupBy(x => x.Category).Select(g => new { g.Key, count = g.Count() }).OrderBy(a => a.Key).Take(1).ToList();

var stages = new List<IPipelineStageDefinition>();
stages.Add(new JsonPipelineStageDefinition<MongoDB.Bson.BsonDocument, MongoDB.Bson.BsonDocument>("{\"$group\" : {_id:\"$Category\"}}"));
var pipeline = new PipelineStagePipelineDefinition<MongoDB.Bson.BsonDocument, MongoDB.Bson.BsonDocument>(stages);


// 高版本已经弃用的方法
var count = BB.CountDocuments(x => true);
```

### 4. C# and MongoDB - Update

-[Quick Start: C# and MongoDB - Update Operations | MongoDB Blog](https://www.mongodb.com/blog/post/quick-start-csharp-and-mongodb--update-operation)

```c#

```

### 5. ReplaceOneAsync 更新替换

- [Who would save() me now? MongoDB 2.0 C#Driver deprecates save()](https://www.plusnconsulting.com/post/Who-would-save-me-now-MongoDB-2-0-C-Driver-deprecates-save/)
- [使用 c#对 MongoDB 进行查询(1) - 莫问今朝· - 博客园](https://www.cnblogs.com/yan7/p/8603640.html)

```c#
var filter = Builders<WebConfig>.Filter.Eq(p => p.Guid, webConfig.Guid);
var task = TWebConfigs.ReplaceOneAsync(filter, webConfig, new ReplaceOptions { IsUpsert = true });


FilterDefinitionBuilder<newItem> builderFilter = Builders<newItem>.Filter;
FilterDefinition<newItem> filter = builderFilter.And(builderFilter.Eq("Symbol", newItem.Symbol), builderFilter.Eq("DateTime", newItem.Symbol));
var task = TItems.ReplaceOneAsync(filter, newItem, new ReplaceOptions { IsUpsert = true });

//创建约束生成器
FilterDefinitionBuilder<newItem> builderFilter = Builders<newItem>.Filter;
//约束条件
FilterDefinition<newItem> filter = builderFilter.And(builderFilter.Gt("Sum", "2"), builderFilter.Eq("DepartmentName", "运维"));



//不存在新增 存在替换写法
public bool Replace(newItem newItem)
{
    try
    {
        FilterDefinitionBuilder<newItem> builderFilter = Builders<newItem>.Filter;
        FilterDefinition<newItem> filter = builderFilter.And(builderFilter.Eq("Symbol", newItem.Symbol), builderFilter.Eq("DateTime", newItem.DateTime));

        var oldItem = TItems.Find(filter).FirstOrDefault();
        if (oldItem == null)
        {
            TItems.InsertOneAsync(newItem);
        }
        else
        {
            // 有问题报错写法
            //var task = TItems.ReplaceOneAsync(filter, newItem, new ReplaceOptions { IsUpsert = true }).Result;
            //var count = task.MatchedCount;

            var task = TItems.ReplaceOneAsync(Builders<newItem>.Filter.Eq(p => p.MongoId, oldItem.MongoId), newItem, new ReplaceOptions { IsUpsert = true });
            //var count = task.MatchedCount;
        }



    }
    catch (Exception ex)
    {

        LogsExtenions.ExLog(System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message);
    }
    finally
    {

    }

    return true;
}

```

### 6. Aggregate Group

- [MongoDB aggregate query count](https://stackoverflow.com/questions/54316447/mongodb-aggregate-query-count)
- [C# Mongodb. Sum field for all documents](https://stackoverflow.com/questions/46294868/c-sharp-mongodb-sum-field-for-all-documents)
- [Mongodb group aggregation using ProjectionDefinition with c# driver](https://stackoverflow.com/questions/41272936/mongodb-group-aggregation-using-projectiondefinition-with-c-sharp-driver/41274776#41274776)

```c#
db.T_ArticleContent.aggregate([{"$group" : {_id:"$Category"}}])
db.getCollection("T_ArticleContent").find({"Category" : "国内"})
db.getCollection("T_ArticleContent").find({"Category" : "国内"}).count()


/*正确做法 建立索引 分步查询*/
var result = TArticleContent.AsQueryable().GroupBy(x => x.Category).Select(g => new { g.Key }).ToList();
items = new List<CategoryInfo>();
foreach (var item in result)
{
    items.Add(new CategoryInfo {  Name = item.Key, Count = (int)TArticleContent.CountDocuments(x => x.Category.Equals(item.Key)) });
}



/*分类分组统计 卡死查询 方式*/
items = TArticleContent.Aggregate().Group(x => x.Category, g => new { Count = g.Count() }).As<CategoryInfo>().ToList();

items = TSites.Aggregate()
    .Group(x => x.Nodes.Hostitem.Category, g => new
    {
        Count = g.Count()
    }).As<CategoryInfo>().ToList();


// 应该建立索引 分开查询 遍历然后count


// 实现分组聚合统计
public class GenreStats
{
    [BsonElement("_id")]
    public string Genre { get; set; }
    public int Count { get; set; }
}

database.GetCollection<Movie>("Movies")
    .Aggregate()
    .Unwind<Movie, Movie>(x => x.Genres)
    .Group(x=>x.Genres, g => new
    {
        Count = g.Count()
    }).As<GenreStats>().ToList();

// 统计
var x = MongoCollection.Aggregate()
                    .Group(
                            doc => doc.clientId,
                            group => new
                            {
                                clientId = group.Key,
                                Total = group.Sum(y => y.sum)
                            }
                    ).ToList().FirstOrDefault(c => c.clientId == 2).Total;
// 最大值
var result = TSites.Aggregate()
                        .Group(
                            x => x.Nodes.Hostitem.Category,
                            g => new {
                                Result = g.Select(
                                           x => x.Guid
                                           ).Max()
                            }
                        ).ToList();

                result.ForEach(doc => Console.WriteLine(doc.ToJson()));
```

### 6. Aggregate Group Match

```c#
items = TVisitInfos.Aggregate().Match(x => x.Yymmdd == Yymmdd)
.Group(x => x.VisitorName, g => new
{
    Count = g.Count()
}).As<CategoryInfo>().ToList();
```

### 7. Atomic integer count in MongoDB using the C# Drivers

- [Atomic integer count in MongoDB using the C# Drivers](https://stackoverflow.com/questions/46284884/atomic-integer-count-in-mongodb-using-the-c-sharp-drivers)

```c#
var idCollection = database.GetCollection<BsonDocument>("CardIdObj");

var filter = Builders<BsonDocument>.Filter.Eq("Key", 1);
var update = Builders<BsonDocument>.Update.Inc("LatestCardId", 1);
var result = idCollection.UpdateOne(filter, update);


// Inc
// Creates an increment operator. 创建一个增量运算符。
```

### 8. 只查询某列

- [Get only a specified field in MongoDB with C#](https://stackoverflow.com/questions/7704290/get-only-a-specified-field-in-mongodb-with-c-sharp)
- [Error Happened](https://mongodb.github.io/mongo-csharp-driver/2.7/reference/driver/definitions/)

```c#
var server = MongoServer.Create(connectionString);
var db = _server.GetDatabase("dbName");
db.GetCollection("users");

var cursor = Photos.FindAs<DocType>(Query.EQ("age", 33));
cursor.SetFields(Fields.Include("a", "b"));
var items = cursor.ToList();
```

### 8. FilterDefinitionBuilder | Build query | SelectMany 查询 多条件

- [Filters in Mongo DB with C#](https://digitteck.com/mongo-csharp/filters-in-mongo-csharp/)
- [Error Happened](https://mongodb.github.io/mongo-csharp-driver/2.8/apidocs/html/T_MongoDB_Driver_FilterDefinitionBuilder_1.htm)
- [Error Happened](https://mongodb.github.io/mongo-csharp-driver/2.7/reference/driver/definitions/)
- [How to chain FilterDefinitionBuilders in Mongo.Net Driver](https://stackoverflow.com/questions/55477711/how-to-chain-filterdefinitionbuilders-in-mongo-net-driver)
- [How to build a query with MongoDB C# Driver v2?](https://stackoverflow.com/questions/34954371/how-to-build-a-query-with-mongodb-c-sharp-driver-v2)
- [MongoDb c# driver consecutive SelectMany](https://stackoverflow.com/questions/46438101/mongodb-c-sharp-driver-consecutive-selectmany)
- [MongoDB: Build query in C# driver](https://stackoverflow.com/questions/15415850/mongodb-build-query-in-c-sharp-driver)
- [FilterDefinitionBuilder C# (CSharp)代码示例 - HotExamples](https://csharp.hotexamples.com/zh/examples/-/FilterDefinitionBuilder/-/php-filterdefinitionbuilder-class-examples.html)

```c#
// 正式版 2.0
var builder = Builders<TestItem>.Filter;
var qItems = new List<MongoDB.Driver.FilterDefinition<TestItem>>
{

    builder.Where(x => x.DateTime >= SDateTime),
    builder.Where(x => x.DateTime <= EDateTime),

    builder.Where(x => x.MAUIstyle.Equals(mAUIstyle)),

    builder.Where(x => x.OCDiff >= MinOCDiff),
    builder.Where(x => x.OCDiff <= MaxOCDiff),


    builder.Where(x => x.TurnoverRatio1 >= MinTurnoverRatio1),
    builder.Where(x => x.TurnoverRatio1 <= MaxTurnoverRatio1),

    builder.Where(x => x.NodesText.Contains("60") || x.NodesText.Contains("382") ),


};

// 正式版  Or 2.0
 var builder = Builders<TestItem>.Filter;
var qItems = new List<MongoDB.Driver.FilterDefinition<TestItem>>
{
    builder.Where(x => x.DateTime >= SDateTime),
    builder.Where(x => x.DateTime <= EDateTime),

    builder.Where(x => x.MAUIstyle.Equals(mAUIstyle)),

    builder.Where(x => x.OCDiff >= MinOCDiff),
    builder.Where(x => x.OCDiff <= MaxOCDiff),

    builder.Where(x => x.TurnoverRatio1 >= MinTurnoverRatio1),
    builder.Where(x => x.TurnoverRatio1 <= MaxTurnoverRatio1),
};


var qItemsOr = new List<MongoDB.Driver.FilterDefinition<TestItem>>
{
    builder.Where(x => x.NodesText.Contains("60")),
    builder.Where(x => x.NodesText.Contains("382")),
};

qItems.Add(builder.Or(qItemsOr));

var combineFilters = builder.And(qItems);

// 正式版
var items = new List<TestDemo>();
var builder = Builders<TestDemo>.Filter;
var qItems = new List<MongoDB.Driver.FilterDefinition<TestDemo>>();
qItems.Add(builder.AnyGte("SDateTime", SDateTime));
var combineFilters = builder.And(qItems);
items = TTestDemoItems.Find(combineFilters).Skip((pageIndex - 1) * pageSize).Limit(pageSize).ToList();



 var filter = new FilterDefinitionBuilder<Sharelinker>().In(s => s.Id, linkedUserIds.ToArray());
     var collection = Client.GetDatabase("Sharelink").GetCollection<Sharelinker>("Sharelinker");
     var linkedUsers =await (await collection.FindAsync(filter)).ToListAsync();
     if (useNoteName)
     {
         var linkMap = links.ToDictionary(lu => lu.SlaveUserObjectId.ToString());
         foreach (var item in linkedUsers)
         {
             item.NoteName = linkMap[item.Id.ToString()].SlaveUserNoteName;
         }
     }


FilterDefinition<BsonDocument> filter = "{ x: 1 }";
// or
FilterDefinition<BsonDocument> filter = new BsonDocument("x", 1);

var builder = Builders<BsonDocument>.Filter;
var filter = builder.Eq("x", 10) & builder.Lt("y", 20);

var builder = Builders<Widget>.Filter;
var filter = builder.Eq(widget => widget.X, 10) & builder.Lt(widget => widget.Y, 20);


var filter = builder.Eq("X", 10) & builder.Lt("Y", 20);
// or
var filter = builder.Eq("x", 10) & builder.Lt("y", 2

var filter = Builders<Post>.Filter.AnyEq(x => x.Tags, "mongodb");

// This will NOT compile:
// var filter = Builders<Post>.Filter.Eq(x => x.Tags, "mongodb");



var arrayFilter = Builders<BsonDocument>.Filter.Eq("student_id", 10000)
 & Builders<BsonDocument>.Filter.Eq("scores.type", "quiz");


var builder = Builders<BsonDocument>.Filter;
var baseFilter = builder.Eq("deleted", false) &
                 builder.Eq("another query", BsonNull.Value);



var filterBuilder = new FilterDefinitionBuilder<WorkerSession>();
var filter = filterBuilder.Empty;

if (query.IsOngoing.HasValue)
{
    filter = filterBuilder.And(query.IsOngoing.Value
        ? new ExpressionFilterDefinition<WorkerSession>(session => session.CompletedOn == null)
        : new ExpressionFilterDefinition<WorkerSession>(session => session.CompletedOn != null));
}

var filtered = await workerSessions.Find(filter).ToListAsync();


var models = collection.AsQueryable()
 .SelectMany(g => g.Brands)
 .Select(y => y.Models)
 .SelectMany(x=> x);

Console.WriteLine(models.Count());


// create the $elemMatch with Type and Value
// as we're just trying to make an expression here,
// we'll use $elemMatch as the property name
var qType1 = Query.EQ("$elemMatch",
    BsonValue.Create(Query.And(Query.EQ("Type", 1),
                     Query.EQ("Value", "a"))));
// again
var qType2 = Query.EQ("$elemMatch",
    BsonValue.Create(Query.And(Query.EQ("Type", 2),
                     Query.EQ("Value", "b"))));
// then, put it all together, with $all connection the two queries
// for the Properties field
var query = Query.All("Properties",
    new List<BsonValue> {
        BsonValue.Create(qType1),
        BsonValue.Create(qType2)
    });

```

### 9. Page Select PageList

```c#
var items = TNewItems.PageList(x => true, a => a.Desc(b => b.DateTime), pageIndex, pageSize);


var list = database.GetCollection<BlogPost>("BlogPost")
    .Find(e => e.Deleted == false)
    .SortByDescending(e => e.CreatedOn)
    .Limit(20)
    .ToList();

items = TListensFileChanges.Find(x => true).Skip((pageIndex - 1) * pageSize).Limit(pageSize).SortByDescending(e => e.DateTime).ToList();
var count = TListensFileChanges.EstimatedDocumentCount();

var items = TVisitInfos.FindAsync(x => x.Yymmdd.Equals(Yymmdd)).Result.ToList();
var items = TVisitInfos.Find(x => x.Yymmdd.Equals(Yymmdd)).Skip((pageIndex - 1) * pageSize).Limit(pageSize).ToList();
var count = TVisitInfos.CountDocuments(x => x.Yymmdd.Equals(yymmdd) && x.VisitorName.Equals(visitorName));

var items = TStockCategoryStockKVs.Find(x => x.NodeId.Equals(nodeId)).Skip((pageIndex - 1) * pageSize).Limit(pageSize).ToList();
var count = TStockCategoryStockKVs.CountDocuments(x => x.NodeId.Equals(nodeId));


var fields = Builders<ResItem>.Projection.Include(p => p.MongoId)
            .Include(p => p.Title)
            .Include(p => p.Category)
            .Include(p => p.UsedStates)
            .Include(p => p.PublishDate)
            .Include(p => p.CreateDate)
            ;

var items = TArticleContent.Find(x => x.Keywords.Equals(category)).Project<ResItem>(fields).Skip((pageIndex - 1) * pageSize).Limit(pageSize).ToList();

var count = TArticleContent.CountDocuments(x => x.Keywords.Equals(category));

return ServiceResult.IsSuccess($"查询完成!", new Dot.Net.Common.Engine.Service.Models.PageList<ResItem>(pageIndex, pageSize, count, items));
```

### 10. Select FirstOrDefault

```c#
var webConfigs = TWebConfigs.Find<WebConfig>(a => a.Guid == guid);
var webConfig = webConfigs.FirstOrDefault();
return _users.Collection.Find(x => true).Limit(10).ToList();
```

### 11. InsertManyAsync

```c#
try
{
    TUserItems.InsertManyAsync(hrefInfos);
}
catch (Exception ex)
{
    LogsExtenions.ExLog(System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message);
}
finally
{

}
```

### 12. SortOrder

- [How to specify an Order or Sort using the C# driver for MongoDB?](https://stackoverflow.com/questions/2123529/how-to-specify-an-order-or-sort-using-the-c-sharp-driver-for-mongodb)
- [MongoDB 插入数据的 3 种方法 - Still water run deep - 博客园](https://www.cnblogs.com/xiaotengyi/p/6392661.html?utm_source=itdadao&utm_medium=referral)%

```c#
var client = new MongoClient("mongodb://localhost:27017");

var database = client.GetDatabase("Blog");

var list = database.GetCollection<BlogPost>("BlogPost")
    .Find(e => e.Deleted == false)
    .SortByDescending(e => e.CreatedOn)
    .Limit(20)
    .ToList();

// Sort By Descending
// 按降序排序

// SortBy
// 排序方式

// ThenByDescending
// 然后降序

collection.Find(bson => true).SortBy(bson => bson["SortByMeAscending"]).ThenByDescending(bson => bson["ThenByMeDescending"]).ToListAsync()
var items = TVisitInfos.Find(x => x.Yymmdd.Equals(yymmdd) && x.VisitorName.Equals(visitorName)).Skip((pageIndex - 1) * pageSize).SortBy(x => x.Createtime).ThenByDescending(x => x.Createtime).Limit(pageSize).ToList();

```

### 13. UpdateOne Set 只更新目标对象

- [Dynamically updating multiple fields in MongoDb using C#](https://stackoverflow.com/questions/39257150/dynamically-updating-multiple-fields-in-mongodb-using-c-sharp)
- [c# mongodb update multiple fields Code Example](https://www.codegrepper.com/code-examples/csharp/c%23+mongodb+update+multiple+fields)

```c#
var filter = Builders<Site>.Filter.Eq("Guid", guid);
var update = Builders<Site>.Update.Set("Nodes.Hostitem.TotalLinks", count);
var result = TSites.UpdateOne(filter, update);



db.getCollection("T_Sites").find({"Nodes.Hostitem.Deployment": 1}).forEach(
   function(item){
       db.getCollection("T_Sites").update({"_id":item._id},{ $set: { "Nodes.WebConfig.FileNameStylesText": "[--超级随机|长度(8,10)--]" }})
   }
)

// 更新多个值 updating multiple fields
Builders<BsonDocument>.Update.Set("key1","value1").Set("key2","value2")

//更新修改结果
var result = Driver.TSites.UpdateOneAsync(filter, update).Result;
if (result.IsModifiedCountAvailable == true) { success++; } else { failed++; }

var result = TStocks.UpdateOneAsync(filter, update).Result;
if (result.IsModifiedCountAvailable == true) { return ServiceResult.IsSuccess($"更新XXX,成功!"); }
else { return ServiceResult.IsSuccess($"更新XXX,失败!"); }

```

### 15. 清空删除表数据

- [How to Delete a Mongodb collection using collection name in c#](https://stackoverflow.com/questions/20696113/how-to-delete-a-mongodb-collection-using-collection-name-in-c-sharp)

```c#
var test = db.GetCollection("test");
test.Drop();


db.DropCollection("test");
```

### 16. 使用 explain()

- [MongoDB：4-MongoDB 的索引和查询分析(explain) 琦彦-CSDN 博客](https://blog.csdn.net/fly910905/article/details/78184302)

```c#
db.getCollection("T_StockCategoryStockKVs").find({"NodeId" : 0}).count()
db.getCollection("T_StockCategoryStockKVs").find({"NodeId" : 1}).count()
db.getCollection("T_StockCategoryStockKVs").find({"NodeId" : 1}).explain()
```

### 17. 获取将指向文档的所有随机数（不是列表中的元素）

- [Finding a random document in MongoDB (with benchmarks)](http://bdadam.com/blog/finding-a-random-document-in-mongodb.html)
- [Random MongoDB Record](https://stackoverflow.com/questions/17681993/random-mongodb-record)

```c#
var count = db.collection.find({DomainClass: "aClass"}).count();
var random = Math.floor(Math.random() * count);
var randomDoc = db.collection.find({DomainClass: "aClass"}).skip(random).limit(1);


// 随机读取数据
ResItem resItem;
var resItems = TArticleContent.Find<ResItem>(a => a.Category == category).Skip(10).Limit(1).ToList();
if (resItems.Count > 0)
{
resItem = resItems[0]; return ServiceResult<ResItem>.IsSuccess("读取成功!", resItem);
}
else { return ServiceResult<ResItem>.IsFailed("读取失败!", null); }
```

### 18. 删除一个属性或者说是字段值

- [How to unset field for loads of documents?](https://stackoverflow.com/questions/20857452/how-to-unset-field-for-loads-of-documents)

```c#
IMongoQuery query = Query.EQ("Activity", 1);
UpdateBuilder ub = Update.Unset("two");
MongoUpdateOptions options = new MongoUpdateOptions {
    Flags = UpdateFlags.Multi
};
var updateResults = examples.Update(query, ub, options);
```

### 19. 游标遍历示例

```c#
var cursor = Driver.TUserItems.FindAsync(x => true, new FindOptions<Models.HrefInfo> { BatchSize = 100, NoCursorTimeout = true }).Result;

while (cursor.MoveNextAsync().Result)
{
    var listOfUsers = cursor.Current.ToList();

    if (StopTask)
    {
        break;
    }
}


```

### 20. 分页查询

```c#
// 普通
var items = TStockNewItems.PageList(x => true, a => a.Desc(b => b.DateTime), pageIndex, pageSize);
// 其它
var items = new List<StockNewItem>();
var count = 0;

items = TStockNewItems.Find(combineFilters).Skip((pageIndex - 1) * pageSize).Limit(pageSize).ToList();
count = (int)TStockNewItems.CountDocuments(combineFilters);


```

## 2. 错误解决方案

### 0. MongoDB.Bson.ObjectId

- [MongoDB deserialization in C# when custom id field](https://stackoverflow.com/questions/36690313/mongodb-deserialization-in-c-sharp-when-custom-id-field)
- [JSON.NET cast error when serializing Mongo ObjectId](https://stackoverflow.com/questions/16651776/json-net-cast-error-when-serializing-mongo-objectid)
- [geersch/MySinglePageApplication](https://github.com/geersch/MySinglePageApplication/blob/master/MvcApplication/Models/ObjectIdConverter.cs)
- [Introduction to MongoDb with .NET part 14: object serialisation in the .NET driver](https://dotnetcodr.com/2016/04/21/introduction-to-mongodb-with-net-part-14-object-serialisation-in-the-net-driver/)
- [ObjectId.TryParse Method](https://api.mongodb.com/csharp/current/html/M_MongoDB_Bson_ObjectId_TryParse.htm)

```c#
/// <summary>MongoDB特有的字段</summary>
[MongoDB.Bson.Serialization.Attributes.BsonElement("_id")]
[JsonConverter(typeof(MongoDB.Net.Base.ObjectIdConverter))]
public MongoDB.Bson.ObjectId MongoId { get; set; }

var MongoId = MongoDB.Bson.ObjectId.Parse("5f3fb340b23ffb51b6bebfbc");
(a => a.MongoId == MongoDB.Bson.ObjectId.Parse(id));

// 最后发现还是保持这个类型 MongoDB.Bson.ObjectId

/// <summary>MongoDB特有的字段</summary>
[MongoDB.Bson.Serialization.Attributes.BsonElement("_id")]
public string MongoId { get; set; }

// 需要改为String否则反系列化时候出问题

/// <summary>MongoDB特有的字段</summary>
[MongoDB.Bson.Serialization.Attributes.BsonElement("_id")]
public MongoDB.Bson.ObjectId MongoId { get; set; }


MongoDB.Bson.ObjectId.GenerateNewId().ToString();
MongoId = MongoDB.Bson.ObjectId.GenerateNewId(),
MongoId = MongoDB.Bson.ObjectId.GenerateNewId();
webConfig.MongoId = MongoDB.Bson.ObjectId.GenerateNewId();

```

### 1. 查询数据异常(【MongoDB】Element ' id' does not match any field or property of class MongoDBDemo.Student.)

- [【MongoDB】Element id does not match any field or property of class MongoDBDemo.Student. GreAmbWang](https://blog.csdn.net/weixin_38211198/article/details/100716198)

```c#
[MongoDB.Bson.Serialization.Attributes.BsonIgnoreExtraElements]
public class Student


[BsonDateTimeOptions(Kind = DateTimeKind.Local)]

// C# MongoDB - binding object properties, _id null on insert
public class SimpleTask
{
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; }
    public string Subject { get; set; }
}
```

### 2. MongoDB C# Driver MongoCredential object

- [MongoDB C# Driver MongoCredential object](https://stackoverflow.com/questions/19574589/mongodb-c-sharp-driver-mongocredential-object)

```c#

```

### 3. 反序列化 XX 类的任何字段或属性都不匹配

```c#
原因:实体类属性被删除.MongoDB 只能新增数据属性,不能缺少否则序列化失败.一定切记.
```

### 4. 弃用 类型改变

```c#
// Obsolete("Use the overload that takes a ReplaceOptions instead of an UpdateOptions.")

// 已过时（“使用需要ReplaceOptions而不是UpdateOptions的重载。”）
```

### 5. An error occurred while deserializing the Nodes property of class

```c#
// An error occurred while deserializing the Nodes property of class
原因:如数据库中有字段 IsTimeStampDynamic 但是实体类中没有 IsTimeStampDynamic 或者已经修改为其它如 IsTimeStampDynamicTimeIsNow 就会系列化报错
解决方案:把实体字段一一对应同步即可

```

### 6. A write operation resulted in an error

- [MongoWriteException: A write operation resulted in an error. The positional operator did not find the match needed from the query](https://stackoverflow.com/questions/54302343/mongowriteexception-a-write-operation-resulted-in-an-error-the-positional-oper)

```c#
{"A write operation resulted in an error.\r\n  After applying the update, the (immutable) field '_id' was found to have been altered to _id: ObjectId('5fb222c0697df89a8bb237bf')"}

// {“写操作导致错误。\ r \ n应用更新后，发现（不可变的）字段“ _id”已更改为_id：ObjectId（'5fb222c0697df89a8bb237bf'）”}}



// 你是对的。如果没有找到UnitCode，我想插入该数组。如何做到这一点。为此，我启用了IsUpsert = true
// 您需要在条件检查之前不放！x.Units.Any（u => u.UnitCode == unit.UnitCode）
// 我认为插入或更新仅适用于ID，如果ID存在，则它将更新，否则将插入。它不会按照您尝试的方式工作。

最后的解决方案是:
// 把即将插入的数据,修改MongoId 同步为已存在的数据MongoId,然后执行替换操作.

if (oldItem == null)
{
    TItems.InsertOneAsync(newItem);
}
else
{
    //var task = TItems.ReplaceOneAsync(filter, newItem, new ReplaceOptions { IsUpsert = true }).Result;
    //var count = task.MatchedCount;

    newItem.MongoId = oldItem.MongoId;
    var task = TItems.ReplaceOneAsync(Builders<newItem>.Filter.Eq(p => p.MongoId, oldItem.MongoId), newItem, new ReplaceOptions { IsUpsert = true });
    var count = task.Result.MatchedCount;
}

```
