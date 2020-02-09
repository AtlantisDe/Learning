# CSRedis

- [2881099/csredis](https://github.com/2881099/csredis)
- [Redis 命令参考 &mdash; Redis 命令参考](http://redisdoc.com/)
- [三、Signalr WebApi 客服-客户链接+Redis（集群扩展） - 十色鹿 - 博客园](https://www.cnblogs.com/fger/p/12119396.html)

## 常用

```c#
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
