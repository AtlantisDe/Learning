# LevelDB

```c#
//LevenDB.Net的写入速度非常高效,在单线程写入的情况都可以达到接近5W/秒的效率,而在获取上的效率更高5线程的并发读竟然可以达到15W/秒的能力....这读效果是相当的可观.
// 支持多线程，并发安全
// 实测不支持多进程共享数据库
LevelDB的默认打开文件数为1000，低于linux默认的1024最大文件打开数。
Leveldb是一个google实现的非常高效的kv数据库，目前的版本1.2能够支持billion级别的数据量了。 在这个数量级别下还有着非常高的性能，主要归功于它的良好的设计。特别是LSM算法。
Level DB包含一下几种文件：

// 文件结构
// 文件类型  说明
dbname/MANIFEST-[0-9]+    清单文件
dbname/[0-9]+.log  db日志文件
dbname/[0-9]+.sst  dbtable文件
dbname/[0-9]+.dbtmp  db临时文件
dbname/CURRENT   记录当前使用的清单文件名
dbname/LOCK    DB锁文件
dbname/LOG  info log日志文件
dbname/LOG.old  旧的info log日志文件

// SSTable是Bigtable中至关重要的一块，对于LevelDb来说也是如此，对LevelDb的SSTable实现细节的了解也有助于了解Bigtable中一些实现细节。

有没有支持多进程的 key/value 数据库？
找了一圈，都是单进程的
TokyoCabinet
KyotoCabinet
leveldb
```

- [google/leveldb](https://github.com/google/leveldb)
- [有没有支持多进程的 key/value 数据库？ - V2EX](https://www.v2ex.com/t/113147)
- [LevelDB 原理探究与代码分析 houzengjiang 的专栏-CSDN 博客 leveldb 原理](https://blog.csdn.net/houzengjiang/article/details/7718548)
- [数据分析与处理之二（Leveldb 实现原理） - Haippy - 博客园](https://www.cnblogs.com/haippy/archive/2011/12/04/2276064.html)
- [leveldb 性能分析和表现 - tudou@NorthWind - 博客园](https://www.cnblogs.com/ylqmf/archive/2011/08/02/2125414.html)
- [C#中使用多款 LevelDB.Net 封装测试性能 - 宋兴柱 - 博客园](https://www.cnblogs.com/songxingzhu/p/6009556.html)
- [LevelDB.NET 性能测试 - 泥水佬的个人页面 - OSCHINA](https://my.oschina.net/ikende/blog/304924?p={{currentPage-1}})
- [给 C# .NET 兄弟们做点小贡献 - NoSql LevelDB .net 移植版 普通 PC 100 万条数据插入不超过 4 秒-CSDN 论坛](https://bbs.csdn.net/topics/390448297)
- [leveldb 之 log 文件 chenglinhust 的专栏-CSDN 博客 leveldb log](https://blog.csdn.net/chdhust/article/details/82823766)
- [leveldb(ssdb)性能、使用场景评估 - LittlePeng - 博客园](https://www.cnblogs.com/lulu/p/4231810.html)
- [leveldb option.max_open_files](https://blog.csdn.net/lionzl/article/details/39802347/)

## boost

> 1. boost 1.59.0
> 2. [Version 1.59.0](https://www.boost.org/users/history/version_1_59_0.html)

## 常用

```c#
// log文件在LevelDb中的主要作用是系统故障恢复时，能够保证不会丢失数据。因为在将记录写入内存的Memtable之前，会先写入Log文件，这样即使系统发生故障，Memtable中的数据没有来得及Dump到磁盘的SSTable文件，LevelDB也可以根据log文件恢复内存的Memtable数据结构内容，不会造成系统丢失数据.
```
