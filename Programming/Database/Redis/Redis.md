# Redis

- Redis 是一个开源（BSD 许可），内存数据结构存储，用作数据库，缓存和消息代理。它支持数据结构，如字符串，散列，列表，集合，带有范围查询的排序集，位图，超级日志，具有半径查询和流的地理空间索引。Redis 具有内置复制，Lua 脚本，LRU 驱逐，事务和不同级别的磁盘持久性，并通过 Redis Sentinel 提供高可用性并使用 Redis Cluster 自动分区。
- [Ubuntu16.04 安装 Redis](https://www.cnblogs.com/zongfa/p/7808807.html)
- [Redis 常用命令](https://blog.csdn.net/hanjun0612/article/details/93513640)
- [关于 Redis 处理高并发 - 伍萬磊 - 博客园](https://www.cnblogs.com/wanlei/p/10464517.html)
- [三、Signalr WebApi 客服-客户链接+Redis（集群扩展） - 十色鹿 - 博客园](https://www.cnblogs.com/fger/p/12119396.html)
- [Redis Dbsize 命令 返回当前数据库的 key 的数量](https://www.redis.net.cn/order/3671.html)
- [redis 命令手册](https://www.redis.net.cn/order/)
- [Redis 干货分享 | Redis 访问控制列表(ACL)](https://mp.weixin.qq.com/s?__biz=MzUyODQ3MTgwOA==&mid=2247484617&idx=1&sn=fe08c4d06d0e2c960f074269eb55c223&chksm=fa6e86a6cd190fb0bdf066907e1884494e87e76ea5e844f679a07d6a44c55ccbec8acb1703ae&mpshare=1&scene=23&srcid=&sharer_sharetime=1579266625329&sharer_shareid=640265f8528f9fcff9d08d1ab417b576#rd)

## 0. 常用

```c#
// 关键文件：
window 解压redis 安装包 文件信息
redis-benchmark.exe         #基准测试
redis-check-aof.exe         # aof
redischeck-dump.exe        # dump
redis-cli.exe               # 客户端
redis-server.exe            # 服务器
redis.windows.conf          # 配置文件




```

## 1. official

- [Redis](https://redis.io/)
- [antirez/redis](https://github.com/antirez/redis)
- [Redis](https://redis.io/download)
- [redis - Installing and running Redis Server on Windows | redis Tutorial](https://riptutorial.com/redis/example/29962/installing-and-running-redis-server-on-windows)

```c#
// 注意： Redis项目不正式支持Windows。
// 但是，Microsoft Open Tech组开发并维护了针对Win64的Windows端口。

// Note: The Redis project does not officially support Windows.
// However, the Microsoft Open Tech group develops and maintains this Windows port targeting Win64. Official redis.io/download

// 当前最新版本:
// Unstable 不稳定版本
// Stable 稳定版本
// Docker 容器..版

Redis 6.0
子版本号:redis-6.0.6

// 这是源码下载
http://download.redis.io/releases/redis-6.0.6.tar.gz

// 实际使用版本是编译好的安装包
当前版本:Redis-x64-3.2.100.msi

https://github.com/microsoftarchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.msi

D:\Soft\Redis

```

## 2. redis 常用类库

```c#
// 安装CSRedisCore 3.3.0 可以扩展集群的好像
// StackExchange.Redis
// NewLife.Redis
```

## 3. Redis 教程

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

## 4. Redis 优势

```c#
性能极高 – Redis能读的速度是110000次/s,写的速度是81000次/s 。
丰富的数据类型 – Redis支持二进制案例的 Strings, Lists, Hashes, Sets 及 Ordered Sets 数据类型操作。
原子 – Redis的所有操作都是原子性的，意思就是要么成功执行要么失败完全不执行。单个操作是原子性的。多个操作也支持事务，即原子性，通过MULTI和EXEC指令包起来。
丰富的特性 – Redis还支持 publish/subscribe, 通知, key 过期等等特性。
```

## 5. 安装 Redis 服务器端

```shell
sudo apt-get install redis-server
```

## 6. Window 下安装 (Redis Windows)

- 3.2.100
- 下载地址 [MSOpenTech/redis/releases](https://github.com/MSOpenTech/redis/releases)
- [安装 window 下的 redis，redis 可视化管理工具（Redis Desktop Manager）安装，基础使用，实例化项目](https://www.cnblogs.com/chengxs/p/9090819.html)
- [ServiceStack/redis-windows](https://github.com/ServiceStack/redis-windows)

- 当前稳定版:3.2

```c#
https://github.com/microsoftarchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.msi


# Redis 支持 32 位和 64 位。这个需要根据你系统平台的实际情况选择，这里我们下载 Redis-x64-xxx.zip压缩包到 C 盘，解压后，将文件夹重新命名为 redis。
redis-cli.exe -h 127.0.0.1 -p 6379
```

## 7. Redis GUI 工具

- Redis Desktop Manager
- [quick123official/quick_redis_blog](https://github.com/quick123official/quick_redis_blog)

### 1. Redis Desktop Manager

- [Install - Redis Desktop Manager](https://docs.redisdesktop.com/en/0.9/install/)
- [Redis Desktop Manager Activity](https://sourceforge.net/p/redisdesktopmanager/activity/?page=0&limit=100#5bbf2792f0d3470a6b4b9bbf)

```c#
// Windows
// Install Microsoft Visual C++ 2015 (If you have not already)
// Download Windows Installer from http://redisdesktop.com/download (Requires subscription)
// Run downloaded installer

https://github-production-release-asset-2e65be.s3.amazonaws.com/11892946/d2e73b14-4a17-11e8-80bd-30e6810bf9a1?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20201020%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20201020T162729Z&X-Amz-Expires=300&X-Amz-Signature=40e21470126cb7ac8a73167a0831090198f76e05bb4e211505bd266a585659fc&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=11892946&response-content-disposition=attachment%3B%20filename%3Dredis-desktop-manager-0.9.3.817.exe&response-content-type=application%2Foctet-stream
```

## 8. Redis 修改密码和更改端口

- [Redis 修改密码和更改端口 - 雪剑无影 - 博客园](https://www.cnblogs.com/xuey/p/7787970.html)

```c#
// windows下redis修改密码和更改端口

修改的文件是: redis.windows-service.conf 而不是这个文件:redis.windows.conf

// 修改端口：
// 在redis的安装目录下找到 redis.windows-service.conf 文件。用文本编辑器打开，然后找到 port 所在行，把默认的端口更改，比如更改为8888。这样端口就修改了
# If port 0 is specified Redis will not listen on a TCP socket.
port 6379

// 修改密码：
// 找到 requirepass所在行，回车另起一行，输入 requirepass 017fe5e8-ad51  ，这样就设置了redis的密码为：017fe5e8-ad51 ，设置好保存后，若要使设置起作用，需要重启redis服务。
requirepass 017fe5e8

// 启动redis：


```

## 9. 配置 redis 外网可访问,并只允许指定的 ip 可访问 redis

- [配置 redis 外网可访问,并只允许指定的 ip 可访问 redis - Likwo - 博客园](https://www.cnblogs.com/likwo/p/5903377.html)
- [redis 设置外网可访问\_H.CF 的博客-CSDN 博客](https://blog.csdn.net/qq_27631797/article/details/79062574)

```c#
// 由于redis采用的安全策略，默认会只准许本地访问。

// 更改redis.conf 文件

bind 127.0.0.1
protected-mode yes

// 更改为
# bind 127.0.0.1
protected-mode no
```

## 限制内存大小

- [Redis 内存大小限制 - 江湖小小白 - 博客园](https://www.cnblogs.com/jhxxb/p/13677348.html)

```c#
# 指定Redis最大内存限制，Redis在启动时会把数据加载到内存中，达到最大内存后，Redis会先尝试清除已到期或即将到期的Key，移除规则可以通过maxmemory-policy来指定，当处理后，仍然到达最大内存，将无法再进行写入操作，但仍然可以进行读取操作
# Redis新的vm机制，会把Key存放内存，Value会存放在swap区
# maxmemory <bytes>
# 3GB = 3*1024*1024*1024=3221225472
maxmemory 3221225472

# 当内存使用达到最大值时，redis使用的清除策略：
# LRU表示最近最少使用，LFU意味着最少使用
# volatile-lru -> 利用LRU算法移除设置过过期时间的key
# allkeys-lru -> 利用LRU算法移除任何key
# volatile-lfu -> 利用LFU算法移除设置过过期时间的key
# allkeys-lfu -> 利用LFU算法移除任何key
# volatile-random -> 移除设置过过期时间的随机key
# allkeys-random -> 移除随机key
# volatile-ttl -> 移除即将过期的key(minor TTL)
# noeviction -> 不移除任何key，只是返回一个写错误 ，默认选项
maxmemory-policy noeviction

# LRU，LFU和最小TTL算法不是精确的算法，而是近似算法（为了节省内存），默认Redis将检查五个键并选择最近使用的键，可以配置指令更改样本大小获得速度或精度。默认值5会产生足够好的结果，10非常接近真实的LRU但耗CPU，3更快但不是很准确。
maxmemory-samples 5
```
