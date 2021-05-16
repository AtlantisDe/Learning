# Redis 列表(List)

## 常用

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
