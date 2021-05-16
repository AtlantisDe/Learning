# MongoDB Help

## 1. 常用

- [Documents 请跟官方文档走](https://docs.mongodb.com/manual/tutorial/insert-documents/)

```c#
// 插入文档
db.AA.insert({"name":"我是新手"})

// MongoDB状态查询：
db.serverStatus().mem

```

### 0. 入门/索引

- [MongoDB 索引 | 菜鸟教程](https://www.runoob.com/mongodb/mongodb-indexing.html)

```c#
db.currentOp() //查看索引的构建时间 如果数据集很大时，构建索引将会花费很长的时间，且会影响程序性能，可通过
db.values.reIndex()  // 当使用 mongorestore 时会重新构建索引。当曾经执行过大规模的删除时，可使用

// 分析慢查询
db.values.find({}).sort({close:-1}).limit(1).explain()

// 插入语法
db.users.insert({username:"smith"})
db.users.save({username:"smith"})

// 查找语法
db.users.find()
db.users.count()

// count ({})方法已弃用。如果要计算集合中的文档数 (例如count ({})), 请改用estimatedDocumentCount() 函数。否则, 请改用countDocuments()函数。

db.T_ArticleContent.count()

db.values.createIndex({open: 1, close: 1}, {background: true})


// 仅创建索引
db.AA.createIndex({"Rawurl":1})

db.AA.insert({"Rawurl":"www.baidu.com","Title":"百度"})
db.AA.insert({"Rawurl":"www.Google.com","Title":"谷歌"})

// 创建唯一索引
db.AA.createIndex({"Rawurl":1}, {unique: true})

// 创建索引
db.AA.createIndex({"Rawurl":1}, {unique: false})

// 创建唯联合索引
db.AA.createIndex({"Rawurl":1,"Title":1}, {unique: true})

// 索引冲突
db.AA.insert({"Rawurl":"www.baidu.com","Title":"百度"})

// 插入数组
db.AA.insert({"Rawurl":"www.gg.com","Title":"谷歌","Imgs":["image1","image2"]})

//修改数组元素
db.getCollection("AA").update( { _id: ObjectId("5f293709fa2a0000ab000f2a") }, { $set: { "Imgs.1": "image22" } } )
db.getCollection("AA").update( { _id: ObjectId("5f293709fa2a0000ab000f2a") }, { $set: { "Imgs.2": "image31" } } )

// 更新元素
db.getCollection("T_KeyValueDemo").update( { _id: ObjectId("5f3014b7d6900197a72b7d3f") }, { $set: { "Value.vendorid": NumberInt("1000") } } )

// 新增数组元素 如果序号中间无元素 数据 这行命令会自动新建中间的元素数据
db.getCollection("AA").update( { _id: ObjectId("5f293709fa2a0000ab000f2a") }, { $set: { "Imgs.6": "image6" } } )


// 实现查询
// 等于 查询 / 等值查询
- [mongo-查询（1）——选择显示列 - 醇酒醉影 - 博客园](https://www.cnblogs.com/yuechaotian/archive/2013/02/04/2891457.html)
db.AA.find({"Title":"谷歌"})

// 只显示某列



// 查询某列并排序
db.T_DailyItems.count()

db.T_DailyItems.find({"OCDiff":0},{"DateTime":1,"Symbol":1,"OCDiff":1,"F1":1}).sort({"DateTime":-1})

db.T_DailyItems.find({"OCDiff":0.01},{"DateTime":1,"Symbol":1,"OCDiff":1,"F1":1}).sort({"DateTime":-1})

db.T_DailyItems.find({"OCDiff":0.02},{"DateTime":1,"Symbol":1,"OCDiff":1,"F1":1}).sort({"DateTime":-1})

db.T_DailyItems.find({"OCDiff":0.03},{"DateTime":1,"Symbol":1,"OCDiff":1,"F1":1}).sort({"DateTime":-1})


db.T_DailyItems.find({"OCDiff":0.1},{"DateTime":1,"Symbol":1,"OCDiff":1,"F1":1}).sort({"DateTime":-1})

db.T_DailyItems.find({"OCDiff":0.2},{"DateTime":1,"Symbol":1,"OCDiff":1,"F1":1}).sort({"DateTime":-1})

db.T_DailyItems.find({"OCDiff":0.3},{"DateTime":1,"Symbol":1,"OCDiff":1,"F1":1}).sort({"DateTime":-1})




// null查询
db.T_ArticleContent.findOne({"Keywords":"http://zm.news.so.com/c14464a685063a21752f55e33330a045"})
db.T_ArticleContent.findOne({"Keywords":null})

// 演示内部多层
db.AA.insert({"Rawurl":"www.baidu.com","Title":"百度"})


// 创建集合 查询数组
- Query an Array
- [Query an Array](https://docs.mongodb.com/manual/tutorial/query-arrays/)

db.createCollection("AA")
db.AA.insert({"Rawurl":"www.Google.com","Title":"谷歌"})
db.AA.findOne({"Title":"谷歌"})
db.AA.insert({"Rawurl":"www.Google.com","Title":"谷歌","Array":["1","2","aa","bb"]})
db.AA.createIndex({"Array":1})
db.AA.find({"Array":{ $gt: "1" }})
db.AA.insert({"Rawurl":"www.Google.com","Title":"谷歌","Array":["1","2","aa","bb"]})
db.AA.insert({"Rawurl":"www.Bing.com","Title":"必应","Array":["6","2","aa","bb"]})
db.AA.insert({"Rawurl":"www.Facebook.com","Title":"脸书","Array":["1","8","aa","cc"]})
db.AA.insert({"Rawurl":"www.Microsoft.com","Title":"微软","Array":["a123","989","aacc","qqq"]})

db.AA.find({"Array":{ $gt: "bb" }})/*查询不到 只查到一条 为啥 应该是这个只能查询整数型数据数组 猜测*/
db.AA.find({"Array":{ $gt: "aa" }})/*查询不到 可查询到多条*/
db.AA.find({"Array":{ $gt: "2" }})/*查询不到 可查询到多条*/

db.AA.find({Array:"bb"})/*查询到 应该有的数据*/
db.AA.find({Array:"cc"})/*查询到 应该有的数据*/
db.AA.find({Array:"1"})/*查询到 应该有的数据*/
db.AA.find({Array:"qqq"})/*查询到 应该有的数据*/


db.AA.getIndexes()/*查看当前集合所有所有*/
db.myColl.createIndex( { category: 1 }, { collation: { locale: "fr" } } )

db.AA.find().batchSize(10)/*每批返回的文档数*/
db.AA.find().forEach( function(myDoc) { print( "Title: " + myDoc.Title ); } );
```

### 1. cursor 遍历

- [C# mongodb driver 2.2.3 how to set batchSize for cursor](https://stackoverflow.com/questions/36391848/c-sharp-mongodb-driver-2-2-3-how-to-set-batchsize-for-cursor)
- [cursor.forEach() — MongoDB Manual 中文文档教程](https://s0docs0mongodb0com.icopy.site/manual/reference/method/cursor.forEach/)
- [db.collection.find() &mdash; MongoDB Manual](https://docs.mongodb.com/manual/reference/method/db.collection.find/index.html)
- [如何高效地遍历 MongoDB 超大集合？ - Fundebug - 博客园](https://www.cnblogs.com/fundebug/p/how-to-visit-all-documents-in-a-big-collection-of-mongodb.html)
- [Cursor Methods &mdash; MongoDB Manual](https://docs.mongodb.com/manual/reference/method/js-cursor/)
- [推荐 Quick Start: C# and MongoDB - Read Operations | MongoDB Blog](https://www.mongodb.com/blog/post/quick-start-c-and-mongodb--read-operations)

```c#
// 错误方法：find()
// 正确方法：find().cursor()与 eachAsync()

// FindAsync返回不会立即加载所有文档的游标，并提供了从DB游标一个接一个地检索文档的界面。当查询结果很大时很有用。

// Find通过方法为您提供更简单的语法，ToListAsync其中该方法在内部从光标中检索文档并立即返回所有文档。

// FindAsync returns cursor which doesn't load all documents at once and provides you interface to retrieve documents one by one from DB cursor. It's helpful in case when query result is huge.

// Find provides you more simple syntax through method ToListAsync where it inside retrieves documents from cursor and returns all documents at once.

var cursor = collection.FindAsync(x => true, new FindOptions<TestItem> { BatchSize = 3, NoCursorTimeout = true }).Result;
while (cursor.MoveNextAsync().Result)
{
    var listOfUsers = cursor.Current;
}


var cursor = collection.FindAsync(x => x.Age != 8, new FindOptions<TestItem> { BatchSize = 2 }).Result;
while (cursor.MoveNextAsync().Result)
{
    var listOfUsers = cursor.Current;
}

var user = await collection.Find(x => x.UserName != userName).FirstAsync();

var cursor = collection.FindAsync(x => x.Age != 8).Result;
while (cursor.MoveNextAsync().Result)
{
    var listOfUsers = cursor.Current;


}

// PS: Find - returns result, FindAsync - returns cursor


db.AA.find().forEach( function(myDoc) { print( "Title: " + myDoc.Title ); } );


var filter = new BsonDocument();
var options = new FindOptions<BsonDocument>
{
    // Get 100 docs at a time
    BatchSize = 100
};

using (var cursor = await test.FindAsync(filter, options))
{
    // Move to the next batch of docs
    while (await cursor.MoveNextAsync())
    {
        var batch = cursor.Current;
        foreach (var doc in batch)
        {
            // process doc
        }
    }
}

using (var cursor = await test.FindAsync(filter, options))
{
    await cursor.ForEachAsync(doc =>
    {
        // process doc
    });
}
```

## 1. 演示代码

### 1. 演示区分大小写

```c#
db.AA.insert({"name":"我是新手"})

db.AA.insert({"age":"我18"})

db.AA.insert({"name":"我是女生","age":"我20"})

db.AA.insert({"name":"我是男生","Age":"我21"})

db.AA.insert({"name":"我是男生 演示数据库区分大小写完毕","Age":"我21"})
```

### 2. mongodb group by

- [mongodb group by 操作 raquelle 的记忆宫殿-CSDN 博客](https://blog.csdn.net/y_f_raquelle/article/details/83821281)
- [mongodb MongoDB 聚合 group - shaomine - 博客园](https://www.cnblogs.com/shaosks/p/5760819.html)
- [MongoDB group()分组操作](https://www.jianshu.com/p/206f036bdfc5)

```c#
// 1. Group and Count example
// Group by “source”, and count the total number of “source”.
db.AA.aggregate([{"$group" : {_id:"$source", count:{$sum:1}}}])
db.AA.aggregate([{"$group" : {_id:"$Title", count:{$sum:1}}}])
db.AA.aggregate([{"$group" : {_id:"$Title", "Count":{$sum:1}}}])

// 2. Group by multiple ids example
db.whois_range.aggregate([{"$group" : {_id:{source:"$source",status:"$status"}, count:{$sum:1}}}])])

// 3. Group, Count, and Sort example

/*聚合分组*/
db.AA.aggregate([{"$group" : {Category:"$Category"}}])
db.AA.aggregate([{"$group" : {_id:"$Category"}}])
db.AA.aggregate([{"$group" : {_id:"$Category", "Count":{$sum:1}}}])
```

### 2. Group 聚合分组查询解决内存限制问题

- [Getting Title at 27:37](https://stackoverflow.com/questions/44161288/robomongo-exceeded-memory-limit-for-group)

```c#
db.getCollection('RAW_COLLECTION').aggregate([
  // Group on unique value storing _id values to array and count
  { "$group": {
    "_id": { RegisterNumber: "$RegisterNumber", Region: "$Region" },
    "ids": { "$push": "$_id" },
    "count": { "$sum": 1 }
  }},
  // Only return things that matched more than once. i.e a duplicate
  { "$match": { "count": { "$gt": 1 } } }
], { allowDiskUse: true } )
```

### 3. mongodb number/numberlong 采坑

- [mongodb 采坑记录-number/numberlong_Himly_Zhang mongodb long 类型坑](https://blog.csdn.net/Himly_Zhang/article/details/104967146)

### 4. 文档子数据集合 建立索引

```c#
// 暂时放弃研究似乎...有些问题
db.AA.insert({"Rawurl":"www.Google.com","Title":"谷歌","Users":{"Id":"1"}})

db.AA.createIndex({"Array":1}, {unique: true})

```

### 5. 所以 数组字段上建立唯一性索引 保证的是 不同文档之间 数组元素之间不能有相同的

- [请教个问题 MongoDB 能对文档 内 List&lt;string&gt; 集合元素 创建唯一索引么 ?-CSDN 论坛](https://bbs.csdn.net/topics/397412741)

### 6. 查询综合

- [mongodb 只查询某列值](https://blog.csdn.net/xu962336414/article/details/105141276/)
- [mongoDB 查询-----返回指定字段 捕影世界-CSDN 博客 mongodb 查询指定字段](https://blog.csdn.net/QMW19910301/article/details/85069692)
- [查询固定字段](https://blog.csdn.net/qq_27093465/article/details/84395875)

```c#
/*统计*/
db.T_ArticleContent1.count()

/*等值查询*/

db.T_ArticleContent1.find({"Category":"篮球"})
db.T_ArticleContent1.find({"Keywords":"北京男篮"})

db.T_ArticleContent1.count({"Keywords":"北京男篮"})

/*创建索引 关键词*/
db.T_ArticleContent1.createIndex({"Keywords":1}, {unique: false})

/*分组*/
db.T_ArticleContent1.aggregate([{"$group" : {_id:"$Category"}}])
db.T_ArticleContent1.aggregate([{"$group" : {_id:"$Keywords"}}])
db.T_ArticleContent1.aggregate([{"$group" : {_id:"$Keywords"}}], { allowDiskUse: true })

/*只查询某列*/

// 查询某列，在查询条件后加,{“列名”:1}
// 不想要某列，在查询条件后加,{“列名”:0}
db.getCollection('es_member').find({"_id":"110"},{"name":1})

//只输出id和title字段，第一个参数为查询条件，空代表查询所有
db.news.find( {}, { id: 1, title: 1 } )
//如果需要输出的字段比较多，不想要某个字段，可以用排除字段的方法
//不输出内容字段，其它字段都输出
db.news.find( {}, {content: 0 } )


```

### 7. mongodb 用户密码设置

- [mongodb 用户密码设置 我可能只是个小白-CSDN 博客](https://blog.csdn.net/weixin_43958804/article/details/84856249)
- [手把手教你设置 MongoDB 密码 - 无尽函数 - 博客园](https://www.cnblogs.com/zilongmao/p/11428864.html)

```c#

```

### 8. 更新

```c#


//重置使用状态 multi : 可选，mongodb 默认是false,只更新找到的第一条记录，如果这个参数为true,就把按条件查出来多条记录全部更新。
db.getCollection("T_ArticleContent").update({}, { $set: { UsedStates: NumberInt("0") } },{multi:true} )


```

### 8. 更新/批量更新

```c#
db.getCollection("T_Sites").find({"Nodes.Hostitem.Deployment": 1}).forEach(
   function(item){
       db.getCollection("T_Sites").update({"_id":item._id},{ $set: { "Nodes.WebConfig.FileNameStylesText": "[--超级随机|长度(8,10)--]" }})
   }
)

//2020/11/08 网站 更新
db.getCollection("T_Sites").find({}).forEach(
   function(item){
       db.getCollection("T_Sites").update({"_id":item._id},{ $set: { "Nodes.Hostitem.TotalUpdateToday": NumberInt("0") }});
   }
)



```

### 9. 批量更新字段名称

```c#
// 加条件
db.getCollection("T_Sites").find({"Nodes.Hostitem.Deployment": 1}).forEach(
   function(item){
       db.T_Sites.update({"_id":item._id}, {"$rename":{"Nodes.WebConfig.WebsiteCustomPictureGalleryText":"Nodes.WebConfig.WebsiteCustomPictureGallerysText"}})
   }
)
// 全部盲修改
db.T_Sites.updateMany({}, {"$rename":{"Nodes.WebConfig.WebsiteCustomPictureGalleryText":"Nodes.WebConfig.WebsiteCustomPictureGallerysText"}})
```

### 10. 删除值字段属性名称

```c#
db.getCollection("T_Sites").update( { _id: ObjectId("5fc220a0693fb978c9e494e0") }, { $unset: { "Nodes.SiteConfig.CurrentTagsDBPath": "" } } )
```

### 11. mongodb 使用 like 模糊查询

- [mongodb 使用 like 模糊查询\_彭世瑜的博客-CSDN 博客](https://blog.csdn.net/mouday/article/details/103344698)

```c#
>db.posts.find({post_text:{$regex:"runoob"}})

// # 以上查询也可以写为：

>db.posts.find({post_text:/runoob/})
```
