# CSRedis

- [2881099/csredis](https://github.com/2881099/csredis)
- [Redis 命令参考 &mdash; Redis 命令参考](http://redisdoc.com/)
- [三、Signalr WebApi 客服-客户链接+Redis（集群扩展） - 十色鹿 - 博客园](https://www.cnblogs.com/fger/p/12119396.html)
- [CSRedisCore 3.6.5](https://www.nuget.org/packages/CSRedisCore/3.6.5)
- [SafeObjectPool 2.3.1](https://www.nuget.org/packages/SafeObjectPool/)

```c#
// 安装必要组件:
Install-Package CSRedisCore


//可以不装
Install-Package SafeObjectPool

```

## 1. 常用

```c#
//依赖注册服务


// 使用前请初始化 RedisHelper.Initialization(new CSRedis.CSRedisClient("127.0.0.1:6379,pass=123,defaultDatabase=13,poolsize=50,ssl=false,writeBuffer=10240,prefix=key前辍"));

//Redis 注册
RedisHelper.Initialization(RedisExtenions.CSRedis);
CSRedisCoreDemoUtil.Demo.DebugDemo(true);

RedisHelper.LPush<STD.Module.Demo.Entity.DemosItem.ILogsItem>("ILogsItems", ILogsItems.ToArray());

var NodeServerManagerProvider = RedisHelper.NodeServerManager("info");
var memory = NodeServerManagerProvider.Info(CSRedis.InfoSection.Memory);



public static bool Demo()
{
    var csredis = new CSRedis.CSRedisClient("127.0.0.1:6379,password=,defaultDatabase=3,prefix=app_,testcluster=false");


    var csredis = new CSRedis.CSRedisClient("127.0.0.1:6379,password=,defaultDatabase=3,prefix=app_");

    var csredis = new CSRedis.CSRedisClient("127.0.0.1:6379,password=google,defaultDatabase=3,prefix=app_");

    RedisHelper.Initialization(csredis);

    RedisHelper.Set("aa", "1111999", 60);
    RedisHelper.Get("aa");

    //集合
    RedisHelper.SAdd("Items_0", new string[] { "1", "2", "3", "2", "3" });
    RedisHelper.SAdd("Items_1", new string[] { "1", "2", "3", "4", "5" });

    var count1 = RedisHelper.SCard("Items");

    //列表
    RedisHelper.LPush<string>("mqlist", "10");
    RedisHelper.LPush<string>("mqlist", new string[] { "start" });
    RedisHelper.RPush("mqlist", new string[] { "end"});
    var count2 = RedisHelper.LLen("mqlist");
    var first = RedisHelper.LPop("mqlist");

    return true;
}

```

## 2. 发布订阅

- [Redis 发布订阅 | 菜鸟教程](https://www.runoob.com/redis/redis-pub-sub.html)
- [【由浅至深】redis 实现发布订阅的几种方式 - nicye - 博客园](https://www.cnblogs.com/kellynic/p/9952386.html)

```c#
// 方法一：SUBSCRIBE + PUBLISH
//程序1：使用代码实现订阅端
var sub = RedisHelper.Subscribe(("chan1", msg => Console.WriteLine(msg.Body)));
//sub.Disponse(); //停止订阅

//程序2：使用代码实现发布端
RedisHelper.Publish("chan1", "111");
```

## 3. Set Get 基本数据 字符串(String) 操作

- [Redis 字符串(String) | 菜鸟教程](https://www.runoob.com/redis/redis-strings.html)

```c#
RedisHelper.Set("test1", "123123", 60);
RedisHelper.Get("test1");
```

## 4. List

- [Redis 列表(List) | 菜鸟教程](https://www.runoob.com/redis/redis-lists.html)

```c#
RedisHelper.LPush("MachineCodes", "1");
RedisHelper.LPush("MachineCodes", "2");
RedisHelper.LPush("MachineCodes", "3");

var rst1 = RedisHelper.LPush<UserItem>("001", new UserItem() { Name = "001", Age = 1 });
var rst2 = RedisHelper.LPush<UserItem>("002", new UserItem() { Name = "001", Age = 1 });


/*键名称:002 值:集合*/

var userItem1 = new UserItem() { Name = "001", Age = 1 };
var userItem2 = new UserItem() { Name = "002", Age = 2 };
var userItem3 = new UserItem() { Name = "003", Age = 3 };
var userItem4 = new UserItem() { Name = "004", Age = 4 };
var userItem5 = new UserItem() { Name = "005", Age = 5 };
var userItem6 = new UserItem() { Name = "005", Age = 5 };
var userItem7 = new UserItem() { Name = "007", Age = 7 };
var userItem8 = new UserItem() { Name = "005", Age = 5 };
var userItem9 = new UserItem() { Name = "005", Age = 9 };


var userItems = new List<UserItem>();
userItems.Add(userItem1);
userItems.Add(userItem2);
userItems.Add(userItem3);
userItems.Add(userItem4);
userItems.Add(userItem5);
userItems.Add(userItem6);
userItems.Add(userItem7);
userItems.Add(userItem8);
userItems.Add(userItem9);

var rst3 = RedisHelper.LPush<UserItem>("002", userItem1, userItem2, userItem3, userItem4, userItem5, userItem6, userItem7, userItem8, userItem9);


var rst4 = RedisHelper.LRem("002", 0, userItem5);
```

```c#
redis 127.0.0.1:6379> LPUSH runoobkey redis
redis 127.0.0.1:6379> LPUSH runoobkey mongodb
redis 127.0.0.1:6379> LPUSH runoobkey mysql

redis 127.0.0.1:6379> LRANGE runoobkey 0 10
1) "mysql"
2) "mongodb"
3) "redis"
// 在以上实例中我们使用了 LPUSH 将三个值插入了名为 runoobkey 的列表当中。

LPUSH app_mqlist redis
LPUSH app_mqlist redis
LPUSH app_mqlist redis1
LPUSH app_mqlist redis2
LPUSH app_mqlist redis3

LRANGE app_mqlist 0 10

RPUSH app_mqlist end1


LRANGE app_mqlist 6 11
LRANGE app_mqlist 6 999



```

### 1. 代码

```c#
var machineCodes = RedisHelper.LRange("MachineCodes",0,100);


RedisHelper.LPush("MachineCodes", "1");
RedisHelper.LPush("MachineCodes", "2");
RedisHelper.LPush("MachineCodes", "3");

var rst1 = RedisHelper.LPush<UserItem>("001", new UserItem() { Name = "001", Age = 1 });
var rst2 = RedisHelper.LPush<UserItem>("002", new UserItem() { Name = "001", Age = 1 });


/*键名称:002 值:集合*/

var userItem1 = new UserItem() { Name = "001", Age = 1 };
var userItem2 = new UserItem() { Name = "002", Age = 2 };
var userItem3 = new UserItem() { Name = "003", Age = 3 };
var userItem4 = new UserItem() { Name = "004", Age = 4 };
var userItem5 = new UserItem() { Name = "005", Age = 5 };
var userItem6 = new UserItem() { Name = "005", Age = 5 };
var userItem7 = new UserItem() { Name = "007", Age = 7 };
var userItem8 = new UserItem() { Name = "005", Age = 5 };
var userItem9 = new UserItem() { Name = "005", Age = 9 };


var userItems = new List<UserItem>();
userItems.Add(userItem1);
userItems.Add(userItem2);
userItems.Add(userItem3);
userItems.Add(userItem4);
userItems.Add(userItem5);
userItems.Add(userItem6);
userItems.Add(userItem7);
userItems.Add(userItem8);
userItems.Add(userItem9);

var rst3 = RedisHelper.LPush<UserItem>("002", userItem1, userItem2, userItem3, userItem4, userItem5, userItem6, userItem7, userItem8, userItem9);


var rst4 = RedisHelper.LRem("002", 0, userItem5);

```

### 2. Redis 列表命令

```c#
// 移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
BLPOP key1 [key2 ] timeout

// 移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
BRPOP key1 [key2 ] timeout

// 从列表中弹出一个值，将弹出的元素插入到另外一个列表中并返回它； 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。
BRPOPLPUSH source destination timeout

// 通过索引获取列表中的元素
LINDEX key index

// 在列表的元素前或者后插入元素
LINSERT key BEFORE|AFTER pivot value

// 获取列表长度
LLEN key

// 移出并获取列表的第一个元素
LPOP key

// 将一个或多个值插入到列表头部
LPUSH key value1 [value2]

// 将一个值插入到已存在的列表头部
LPUSHX key value

// 获取列表指定范围内的元素
LRANGE key start stop

// 移除列表元素
LREM key count value

// 通过索引设置列表元素的值
LSET key index value

// 对一个列表进行修剪(trim)，就是说，让列表只保留指定区间内的元素，不在指定区间之内的元素都将被删除。
LTRIM key start stop

// 移除列表的最后一个元素，返回值为移除的元素。
RPOP key

// 移除列表的最后一个元素，并将该元素添加到另一个列表并返回
RPOPLPUSH source destination

// 在列表中添加一个或多个值
RPUSH key value1 [value2]

// 为已存在的列表添加值
RPUSHX key value

```

## 5. set 无序集合

- [Redis 有序集合(sorted set) | 菜鸟教程](https://www.runoob.com/redis/redis-sorted-sets.html)
- [abcbuzhiming/sample-dotnet](https://github.com/abcbuzhiming/sample-dotnet/blob/f71b7515f27d63359c4ad50fad67469b884faf9a/SampleCSRedis/Program.cs)

```c#
// Redis 集合(Set)
// Redis 的 Set 是 String 类型的无序集合。集合成员是唯一的，这就意味着集合中不能出现重复的数据。
// Redis 中集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是 O(1)。
// 集合中最大的成员数为 232 - 1 (4294967295, 每个集合可存储40多亿个成员)。

/// <summary>
/// set操作
/// </summary>
static void testSet(CSRedisClient csredis){
    RedisHelper.Initialization(csredis);
    string key = "set";
    RedisHelper.SAdd(key,"mysql");
    RedisHelper.SAdd(key,"postgresql");
    RedisHelper.SAdd(key,"oracle");
    RedisHelper.SAdd(key,"mysql");
    var arr = RedisHelper.SMembers(key);
    foreach(string value in arr){
        Console.WriteLine("value:" + value);
    }
}

// 如果键已经存在其它类型会这样报错
// WRONGTYPE Operation against a key holding the wrong kind of value
// Command: SADD Fn_MachineCodesTemp 179f933e8cd7bc231f45298fd5709d4e

// 向集合添加一个或多个成员
var rst1 = RedisHelper.SAdd("MachineCodesTemp", Util.MachineCode);

// 返回集合中的所有成员
var rst2 = RedisHelper.SMembers("MachineCodes" );


var rst1 = RedisHelper.SAdd("MachineCodesTemp", Util.MachineCode);
var rst2 = RedisHelper.SAdd("MachineCodes", "Hello World");
var rst3 = RedisHelper.SMembers("MachineCodes");

```

## 6. zset 有序集合

```c#
// Redis 有序集合和集合一样也是 string 类型元素的集合,且不允许重复的成员。
// 不同的是每个元素都会关联一个 double 类型的分数。redis 正是通过分数来为集合中的成员进行从小到大的排序。
// 有序集合的成员是唯一的,但分数(score)却可以重复。
// 集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是 O(1)。 集合中最大的成员数为 232 - 1 (4294967295, 每个集合可存储40多亿个成员)。


```
