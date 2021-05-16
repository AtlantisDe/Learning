# Redis

- [redis 命令手册](https://www.redis.net.cn/order/)
- [Sentinel &mdash; Redis 命令参考](http://redisdoc.com/topic/sentinel.html)
- [Redis 性能问题排查解决手册(七) - 蘑菇先生 - 博客园](https://www.cnblogs.com/mushroom/p/4738170.html#three)
- [redis cli 命令 - Time。时光 - 博客园](https://www.cnblogs.com/helloworld6379/p/9976264.html)

```c#
// Redis 管道技术
// Redis是一种基于客户端-服务端模型以及请求/响应协议的TCP服务。这意味着通常情况下一个请求会遵循以下步骤：

// 客户端向服务端发送一个查询请求，并监听Socket返回，通常是以阻塞模式，等待服务端响应。
// 服务端处理命令，并将结果返回给客户端。
```

## 0. 常用命令

```c#
redis-cli.exe -h 127.0.0.1 -p 6379
redis-cli.exe -h 192.168.3.6 -p 6379
Redis-cli --latency -h 127.0.0.1 -p 6379

AUTH "password"
ECHO message
PING
// 如果连接正常就返回一个 PONG ，否则返回一个连接错误。
QUIT

info server
info clients
info memory
info persistence
info stats
info replication
info cpu
info commandstats
info cluster
info keyspace

SELECT index
SET db_number 0
SELECT 1
GET db_number
SET db_number 1
GET db_number
SELECT 3
SELECT 2

CLIENT LIST


// 删除所有数据库的所有key
FLUSHALL

// 删除当前数据库的所有key
FLUSHDB


// 返回最近一次 Redis 成功将数据保存到磁盘上的时间，以 UNIX 时间戳格式表示
LASTSAVE
// 以下实例演示了发布订阅是如何工作的。在我们实例中我们创建了订阅频道名为 redisChat:
SUBSCRIBE redisChat
PUBLISH redisChat "Redis is a great caching technique"
PUBLISH redisChat "Learn redis by runoob.com"
config get maxclients
KEYS
// 可以看到所有库的key数量
info
// 则是当前库key的数量
dbsize
// 这种数据量小还可以，大的时候可以直接搞死生产环境。
keys *
// dbsize和keys *统计的key数可能是不一样的，如果没记错的话，keys *统计的是当前db有效的key，而dbsize统计的是所有未被销毁的key（有效和未被销毁是不一样的，具体可以了解redis的过期策略）
redis-benchmark -h 127.0.0.1 -p 6379 -t set,lpush -n 10000 -q
RPUSH list1 "foo"
RPUSH list1 "bar"
LLEN list1

LINDEX list1 -1
LINDEX list1 0
LINDEX list1 1

LRANGE list1 0 -1


KEYS app_ILogsItems
LLEN app_ILogsItems
LRANGE app_ILogsItems 0 -1
LTRIM app_ILogsItems 0 10000
LTRIM app_ILogsItems 1000 50000
LLEN app_ILogsItems

LLEN KEY_NAME

LTRIM mylist 1 -1

PTTL KEY_NAME
// 返回值
// 当 key 不存在时，返回 -2 。 当 key 存在但没有设置剩余生存时间时，返回 -1 。 否则，以毫秒为单位，返回 key 的剩余生存时间。
// 注意：在 Redis 2.8 以前，当 key 不存在，或者 key 没有设置剩余生存时间时，命令都返回 -1 。
-2
-1
PTTL key

Expire KEY_NAME TIME_IN_SECONDS
// 设置了过期时间为 1 分钟
EXPIRE runooobkey 60
KEYS *
KEYS w3c*

SET key "value"
GET key
SET key "new-value"
```

### 1. 发布订阅机制

- [Redis 发布订阅 | 菜鸟教程](https://www.runoob.com/redis/redis-pub-sub.html)
- [Redis 发布订阅机制 - yitudake - 博客园](https://www.cnblogs.com/yitudake/p/6747995.html)

### 2. CLI

```c#
redis-cli -h 127.0.0.1 -p 6379 get hello
redis-cli -h 127.0.0.1 -p 6379 -n 0 get hello
redis-cli -h 127.0.0.1 -p 6379 -n 3 get hello
redis-cli -h 127.0.0.1 -p 6379 GET db_number
```
