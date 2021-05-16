# Database

- 内存数据库、关系型数据库和非关系型数据库

- [内存数据库、关系型数据库和非关系型数据库 xwx_100](https://blog.csdn.net/xwx_100/article/details/82259787)
- [Sentinel &mdash; Redis 命令参考](http://redisdoc.com/topic/sentinel.html)
- [222 LevelDB and NCache and RocksDB alternatives](https://db-engines.com/en/systems/LevelDB%3BNCache%3BRocksDB)
- [DB-Engines Ranking](https://db-engines.com/en/ranking)
- [DB-Engines Ranking of Key-value Stores](https://db-engines.com/en/ranking/key-value+store)

## 1. DBMS

- [DB-Engines Ranking](https://db-engines.com/en/ranking)

## 2. 介绍

- [30分钟了解腾讯云数据库产品](https://haokan.baidu.com/v?vid=9573205160445937301&pd=bjh&fr=bjhauthor&type=video)

## 3. 设计

- [大数据量的存储分表常见算法（转） - 一枚程序员 - 博客园](https://www.cnblogs.com/sooner/archive/2013/04/26/3045957.html)
- [大家 mysql 分表的哈希算法是怎样的？ - SegmentFault 思否](https://segmentfault.com/q/1010000012348383)
- [一种分库分表的方法：哈希分库分表 - 土豆条 - 博客园](https://www.cnblogs.com/liushijie/p/5481253.html)
- [一致性哈希算法(分库分表，负载均衡等) - 都市烟火 - 博客园](https://www.cnblogs.com/duhuo/p/4996105.html)
- [分库分表的 hash 算法 - 之乎者也 2011 - 博客园](https://www.cnblogs.com/wrmfw/archive/2011/09/05/2166932.html)
- [php 分库分表 hash 算法](https://www.jb51.net/article/20881.htm)
- [数据库水平分表（hash 算法）\_xie_chao825 的博客-CSDN 博客](https://blog.csdn.net/xie_chao825/article/details/78656545)
- [海量数据分库分表方案（一）算法方案 - 地藏 Kelvin - 博客园](https://www.cnblogs.com/kelvin-cai/p/12793361.html)
- [.Net 下的分库分表帮助类——用分库的思想来分表 - 秋夜 - 博客园](https://www.cnblogs.com/beyondbit/p/6391934.html)
- [海量数据存储--分库分表策略详解](https://www.daimajiaoliu.com/daima/47964b622900403)
- [.net core 基于 Dapper 的分库分表开源框架（core-data） - Jlion - 博客园](https://www.cnblogs.com/jlion/p/12771167.html)
- [常见 hash 算法的原理 - 极客分享](https://www.geek-share.com/detail/2657134693.html)
- [数据库分库分表——扩容无须数据迁移的分片算法 - 尚码园](https://www.shangmayuan.com/a/e29b13f178934b658431d253.html)
- [hash 值生成表后缀（分表方案） - xiaowejie - 博客园](https://www.cnblogs.com/xwjBlog/p/11383444.html)
- [哈希 256 规则分表\_每天进步一点点-CSDN 博客](https://blog.csdn.net/Joyhen/article/details/51324629)
- [java md5 加密,加密后为何一般用 0-9 a-f?? - SegmentFault 思否](https://segmentfault.com/q/1010000014711298)

```c#
// java md5加密,加密后为何一般用  0-9 a-f??

// 1. 分表hash算法有多种，我们原来分0-9，也搞过md5取最后一位0-9a-z,这个没有绝对的好坏只说，看量吧。
// 2. Guid的最后一位是0~9和字母ABCDEF组成，最多只能分16张表
// 3. 代码中 MerchantId 字段上添加了[Submeter(Bit =2)]标注，并且指定了Bit=2，将会分成根据MerchantId字段取二进制进行md5 hash 取前两位分成256张表

// 16
// 256
// 4096

```
