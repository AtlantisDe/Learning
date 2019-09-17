# Query Optimizer

- [The SQLite Query Optimizer Overview](https://www.sqlite.org/optoverview.html)
- [批量打包 Sql-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1174)
- [事务-SqlSugar4-文档园](http://www.codeisbug.com/Doc/8/1135)
- [SQLite3 性能优化 - 郭友的专栏 - CSDN 博客](https://blog.csdn.net/guofuyou/article/details/24487073)
- [SQLite 的性能优化 - Ming Tong - CSDN 博客](https://blog.csdn.net/cuit/article/details/21971225)
- [sqlite3 多线程和锁 ，优化插入速度及性能优化 - majiakun1 的专栏 - CSDN 博客](https://blog.csdn.net/majiakun1/article/details/79193658)
- [提升 SQLITE 插入、查询效率的方法 - 小麒麟的成长之路 - CSDN 博客](https://blog.csdn.net/lijinqi1987/article/details/51852721)

## 优化篇

### 1. 写性能篇

- [sqlite 性能优化 - 习惯成就伟大 - CSDN 博客](https://blog.csdn.net/qingzhuyuxian/article/details/79768032)

#### 0. 开启整体事务

- SQLite 在执行一条 SQL 语句的时候，会默认开启一个事务，所以要写个 for 循环插入 30 万条数据的话，就要执行 30 万次事务，也就是 30 万次 IO 操作，这是很夸张的。

```c#
// 所以在做批量插入操作的时候，务必要开启一个整体事务，也就是像这样：
Begin Transaction

Insert operation 1

Insert operation 2

Insert operation 3

Insert operation n

...
End Transaction

// 而不是开启N次事务：
Begin Transaction

Insert operation 1

End Transaction

Begin Transaction

Insert operation 2

End Transaction

Begin Transaction

Insert operation 3

End Transaction

Begin Transaction

Insert operation n

End Transaction
```

#### 1. 批量更新数据的场景

- 批量更新数据的场景，使用数据库事务，批量更新数据是非常快的。

```c#
//
```

#### 2. 单条更新数据的场景

- sqlite 有两种实现事务的模式 rollback journal 和 wal（3.7.0 版本开始支持）
- WAL 的全称是 Write Ahead Logging，它是很多数据库中用于实现原子事务的一种机制，SQLite 在 3.7.0 版本引入了该特性。
- 在引入 WAL 机制之前，SQLite 使用 rollback journal 机制实现原子事务。
- 总结一下原理：简单说 rollback journal 原子更新数据到数据库，wal 是定期批量更新数据到数据库。
- [Write-Ahead Logging](http://www.sqlite.org/draft/wal.html)
- [SQLite 的 WAL 机制 - 萌萌的 It 人 www.itmmd.com - CSDN 博客](https://blog.csdn.net/dyllove98/article/details/8841973)
- [Sqlite 学习笔记(四)&amp;&amp;SQLite-WAL 原理 - 天士梦 - 博客园](https://www.cnblogs.com/cchust/p/4754619.html)

```c#
//
```

#### 3. 数据安全性不高的场景:磁盘同步

- 数据安全性不高的场景，可以考虑更改 syncchronous = off 的模式；（写数据的速度 50 倍+的提升）
- 数据安全性较高的场景，可以考虑更改 syncchronous = nomal 的模式；（写数据的性能也有 5 倍+的提升）
- 注意：sqlite 默认是 syncchronous = full。
- [pragma](http://www.sqlite.org/pragma.html)
- [pragma](http://blog.csdn.net/qinlicang/article/details/6079453)

```c#
// ps：有人会觉得  nomal  模式下数据安全性不够，当初我也有这样顾虑，就写了demo模式多次模拟测试了程序崩溃等场景，没有发现 nomal 模式下数据丢失的情况，后续就在项目中日志记录使用的 off 模式，元数据记录使用了 nomal 模式。到现在已经几个月了（我们的产品已发布，已有大量的用户每天都在使用），使用off 模式和使用 nomal 模式都没有发现数据丢失、数据库损坏的情况。官网的描述也是，如果 nomal 模式下数据库损坏了，那么你的硬盘也很可能坏了。

PRAGMA synchronous;

PRAGMA synchronous = FULL; (2)
PRAGMA synchronous = NORMAL; (1)
PRAGMA synchronous = OFF; (0)

PRAGMA synchronous = 0;

// - 建议：如果有定期备份的机制，而且少量数据丢失可接受，用OFF。

```

#### 4. 更改 sqlite 的各种参数提升性能

- ps：在我的 demo 性能测试中，更改 cache_size = 8000 会有一定的性能提升。更改其他参数没有明显提升。
- [SQLite PRAGMA | 菜鸟教程](https://www.runoob.com/sqlite/sqlite-pragma.html)

##### 1. 缓存大小查询

- 查询 SQLite 一次存储在内存中的数据库文件页数
- 标记含义：每页使用约 1.5K 内存，缺省的缓存大小是 2000. 若需要使用改变大量多行的 UPDATE 或 DELETE 命令，并且不介意 SQLite 使用更多的内存的话，可以增大缓存以提高性能
- 如何设置: PRAGMA cache_size = Number-of-pages;修改 SQLite 一次存储在内存中的数据库文件页数。
- 注意事项：当使用 cache_size pragma 改变缓存大小时，改变仅对当前对话有效，当数据库关闭重新打开时缓存大小恢复到缺省大小。要想永久改变缓存大小，使用 default_cache_size pragma.

```c#
//当前会话有效
// 查询
PRAGMA cache_size
// 设置
PRAGMA cache_size = 8000

// 永久配置
PRAGMA default_cache_size
PRAGMA default_cache_size = 8000

```

##### 2. LIKE 运算符

- case_sensitive_like Pragma
- case_sensitive_like Pragma 控制内置的 LIKE 表达式的大小写敏感度。默认情况下，该 Pragma 为 false，这意味着，内置的 LIKE 操作符忽略字母的大小写。语法如下：
- 目前没有办法查询该 Pragma 的当前状态。
- 标记含义：LIKE 运算符的缺省行为是忽略 latin1 字符的大小写。因此在缺省情况下'a' LIKE 'A'的值为真。可以通过打开 case_sensitive_like pragma 来改变这一缺省行为。当启用 case_sensitive_like，'a' LIKE 'A'为假而 'a' LIKE 'a'依然为真。

```c#

PRAGMA case_sensitive_like = [true|false];
PRAGMA case_sensitive_like;
PRAGMA case_sensitive_like = 0 | 1;
PRAGMA case_sensitive_like = false
PRAGMA case_sensitive_like = 0
// 1.注意事项：
// SQLite3.6.22版本不支持。
// 2.建议：
// 打开。也就是执行命令“PRAGMA case_sensitive_like = 1;”命令。不然搜索中文字串会出错。
```

##### 3. 内存模式

-- 参数含义：
--- 当 temp_store 设置为 DEFAULT (0),使用编译时的 C 预处理宏 TEMP_STORE 来定义储存临时表和临时索引的位置。
--- 当设置为 FILE (1)，则存放于文件中。temp_store_directorypragma 可用于指定存放该文件的目录。
--- 当设置为 MEMORY (2)，临时表和索引则存放于内存中。
--- 注意事项：
--- 当改变 temp_store 设置，所有已存在的临时表，索引，触发器及视图将被立即删除。

```c#
// 如何查询：
PRAGMA temp_store;
// 如何设置：
PRAGMA temp_store = DEFAULT; (0)
PRAGMA temp_store = FILE; (1)
PRAGMA temp_store = MEMORY; (2)

PRAGMA temp_store = 2;
// 建议：
// 使用2，即内存模式。
```

##### 4. 让分页文件在内存中 / 接下 WAL

-- 参数含义：
--- 让分页文件在内存中，PRAGMA journal_mode = MEMORY 缺点同 3. PRAGMA synchronous = OFF

```c#
// 默认
PRAGMA journal_mode = delete

// 内存
PRAGMA journal_mode = MEMORY

// 不保留任何日志记录。
PRAGMA journal_mode = OFF
PRAGMA database.journal_mode = OFF;


```

##### 4. 使用 WAL 模式

-- [Sqlite 学习笔记(四)&amp;&amp;SQLite-WAL 原理 - 天士梦 - 博客园](https://www.cnblogs.com/cchust/p/4754619.html)
-- WAL 模式主要有两个优点:
--- WAL:Write Ahead Logging,他是数据库中用于实现原子事务的一种机制，从 3.7.0 版本后引入
--- 1、读写可以完全并发进行，不会互相阻塞（但是写之间仍然不能并发）
--- 2、WAL 在大多情况下，拥有更好的性能（因为无需每次写入时都要写两个文件）

```c#
// 开启WAL模式的方法：
sqlite3_exec(db, "PRAGMA journal_mode=WAL; ", 0,0,0);

PRAGMA journal_mode=WAL

// WAL劣势

//开启WAL后，每次读取page，都需要通过wal-index来确认page是否在WAL中，这个会产生一定的性能损耗。另外，会引入WAL文件，这个文件如果使用不当，可能会急剧膨胀，WAL文件变大后，意味着检索wal-index的代价也变高。而且由于SQLite一般用于端设备，空间也比较稀缺，因此要严格控制好WAL文件的大小。此外，WAL的索引文件采用共享内存实现，因此访问SQlite的进程不能跨机器


```

### 2. 读性能篇

#### 1. 建立索引

- [Error Happened](http://www.cnblogs.com/stephen-liu74/archive/2012/02/17/2322335.html)

```c#
//
```

#### 2. 根据具体的使用场景，进行分表、分库

- [Error Happened](http://www.cnblogs.com/stephen-liu74/archive/2012/02/17/2322335.html)

```c#
//
```

### 3. 附指令表集

#### 1. 参考

```c#
| 1 | auto_vacuum         | 空间释放      | 0                    |
|---|---------------------|-----------|----------------------|
| 2 | cache_size          | 缓存大小      | 2000                 |
| 3 | case_sensitive_like | LIKE大小写敏感 | （注意：SQLite3.6.22不支持） |
| 4 | count_changes       | 变更行数      | 0                    |
| 5 | page_size           | 页面大小      | 1024                 |
| 6 | synchronous         | 硬盘大小      | 2                    |
| 7 | temp_store;         | 内存模式      | 0                    |
```
