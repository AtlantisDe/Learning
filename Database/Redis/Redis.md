# Redis

- Redis 是一个开源（BSD 许可），内存数据结构存储，用作数据库，缓存和消息代理。它支持数据结构，如字符串，散列，列表，集合，带有范围查询的排序集，位图，超级日志，具有半径查询和流的地理空间索引。Redis 具有内置复制，Lua 脚本，LRU 驱逐，事务和不同级别的磁盘持久性，并通过 Redis Sentinel 提供高可用性并使用 Redis Cluster 自动分区。
- [Redis 常用命令](https://blog.csdn.net/hanjun0612/article/details/93513640)
- [关于 Redis 处理高并发 - 伍萬磊 - 博客园](https://www.cnblogs.com/wanlei/p/10464517.html)
- [三、Signalr WebApi 客服-客户链接+Redis（集群扩展） - 十色鹿 - 博客园](https://www.cnblogs.com/fger/p/12119396.html)
- [Redis Dbsize 命令\_返回当前数据库的 key 的数量](https://www.redis.net.cn/order/3671.html)
- [redis 命令手册](https://www.redis.net.cn/order/)
- [Redis 干货分享 | Redis 访问控制列表(ACL)](https://mp.weixin.qq.com/s?__biz=MzUyODQ3MTgwOA==&mid=2247484617&idx=1&sn=fe08c4d06d0e2c960f074269eb55c223&chksm=fa6e86a6cd190fb0bdf066907e1884494e87e76ea5e844f679a07d6a44c55ccbec8acb1703ae&mpshare=1&scene=23&srcid=&sharer_sharetime=1579266625329&sharer_shareid=640265f8528f9fcff9d08d1ab417b576#rd)

## official

- [Redis](https://redis.io/)
- [antirez/redis](https://github.com/antirez/redis)
- [Redis](https://redis.io/download)

## redis 常用类库

```c#
安装CSRedisCore 3.3.0 可以扩展集群的好像
StackExchange.Redis
NewLife.Redis
```

## Redis 教程

- [Redis 简介 | 菜鸟教程](http://www.runoob.com/redis/redis-intro.html)

```c#
// 1 运行cmd

// 到redis安装目录，cmd输入
redis-cli.exe -h 127.0.0.1 -p 6379
redis-cli.exe -h 10.88.60.172 -p 6379

// 2 密码登录

auth 输入密码

// 3 设置和获取 set "hello"   get "hello"

// 4 清空
flushall

// 5 选择数据库
select 1

```

## Redis 优势

```text
性能极高 – Redis能读的速度是110000次/s,写的速度是81000次/s 。
丰富的数据类型 – Redis支持二进制案例的 Strings, Lists, Hashes, Sets 及 Ordered Sets 数据类型操作。
原子 – Redis的所有操作都是原子性的，意思就是要么成功执行要么失败完全不执行。单个操作是原子性的。多个操作也支持事务，即原子性，通过MULTI和EXEC指令包起来。
丰富的特性 – Redis还支持 publish/subscribe, 通知, key 过期等等特性。
```

## 安装 Redis 服务器端

```shell
sudo apt-get install redis-server
```

## Window 下安装

- 3.2.100
- 下载地址 [MSOpenTech/redis/releases](https://github.com/MSOpenTech/redis/releases)

```shell
# Redis 支持 32 位和 64 位。这个需要根据你系统平台的实际情况选择，这里我们下载 Redis-x64-xxx.zip压缩包到 C 盘，解压后，将文件夹重新命名为 redis。
redis-cli.exe -h 127.0.0.1 -p 6379
```
