# RocksDB

- [RocksDB: A Persistent Key-Value Store for Flash and RAM Storage](https://github.com/facebook/rocksdb/)
- [FAQ](https://rocksdb.org/docs/support/faq.html)
- [facebook/mysql-5.6](https://github.com/facebook/mysql-5.6)
- [RocksDB | A persistent key-value store](https://rocksdb.org/)
- [NuGet Gallery | Packages matching rocksdb](https://www.nuget.org/packages?q=rocksdb)
- [rocksdb 6.11.4.12240](https://www.nuget.org/packages/RocksDB/)

```c#
// RocksDB是用于快速存储的可嵌入持久键值存储。RocksDB也可以作为客户端-服务器数据库的基础，但是我们当前的重点是嵌入式工作负载。
// RocksDB建立在LevelDB之上，具有可扩展性，可以在具有多个CPU内核的服务器上运行，可以有效地使用快速存储，支持IO绑定，内存中和一次写入的工作负载，并且可以灵活地进行创新。
// RocksDB是一个嵌入式存储引擎，已在Facebook的许多后端系统中使用。在Facebook新闻提要的后端，它替换了另一个称为Centrifuge的内部存储引擎，并且是使用的许多组件之一。ZippyDB是Facebook产品使用的分布式键值存储服务，它依赖RocksDB。

// RocksDB作为数据库存储引擎有多好？

// 我们在Facebook的工程团队坚信RocksDB作为数据库的存储引擎具有巨大的潜力。它已经在MongoDB的生产中得到证明：MongoRocks是MongoDB 的基于RocksDB的存储引擎。

// MyRocks是基于RocksDB的MySQL存储引擎。与我们现有的MySQL设置相比，使用RocksDB可以使基准测试的压缩率提高2倍，写入放大率降低10倍。根据我们目前的结果，目前正在着手将MyRocks开发为可用于Web级MySQL工作负载的生产就绪解决方案。

```

## 常用
