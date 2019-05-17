# Redis

- Redis 是一个开源（BSD 许可），内存数据结构存储，用作数据库，缓存和消息代理。它支持数据结构，如字符串，散列，列表，集合，带有范围查询的排序集，位图，超级日志，具有半径查询和流的地理空间索引。Redis 具有内置复制，Lua 脚本，LRU 驱逐，事务和不同级别的磁盘持久性，并通过 Redis Sentinel 提供高可用性并使用 Redis Cluster 自动分区。

## official

-[Redis](https://redis.io/)

## Redis 教程

- [Redis 简介 | 菜鸟教程](http://www.runoob.com/redis/redis-intro.html)

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

- 下载地址 [MSOpenTech/redis/releases](https://github.com/MSOpenTech/redis/releases)

```shell
# Redis 支持 32 位和 64 位。这个需要根据你系统平台的实际情况选择，这里我们下载 Redis-x64-xxx.zip压缩包到 C 盘，解压后，将文件夹重新命名为 redis。
redis-cli.exe -h 127.0.0.1 -p 6379
```
