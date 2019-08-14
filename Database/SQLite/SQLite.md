# SQLite

- SQLite.Interop.dll (X86 X64)
- 本教程帮助您了解什么是 SQLite，它与 SQL 之间的不同，为什么需要它，以及它的应用程序数据库处理方式。
- SQLite 是一个软件库，实现了自给自足的、无服务器的、零配置的、事务性的 SQL 数据库引擎。SQLite 是一个增长最快的数据库引擎，这是在普及方面的增长，与它的尺寸大小无关。SQLite 源代码不受版权限制。
- [SQLite 的并发处理 - Ming Tong - CSDN 博客](https://blog.csdn.net/cuit/article/details/21975807)
- [Sqlite3并发读写注意事项](http://www.bubuko.com/infodetail-765226.html)

```txt
总结
最后我们来总结一下


1.当有写操作时，其他读操作会被驳回
2.当有写操作时，其他写操作会被驳回
3.当开启事务时，在提交事务之前，其他写操作会被驳回
4.当开启事务时，在提交事务之前，其他事务请求会被驳回
5.当有读操作时，其他写操作会被驳回
6.读操作之间能够并发执行
```

```txt
使用SQLite经常会遇到并发处理，要处理好多线程或多进程之间的并发，就得搞清楚SQLite的机制，尤其是Sqlite的锁机制。
因为SQLite是文件数据库，所以它的锁也基本是和文件一致，也即：写独占，读共享。这意味是在读取数据库的时候，是可以多个线程共享的，而如果有增删改的操作，则会独占此文件，其他线程会进程都会被阻塞。
```

## Official

- [SQLite Download Page](https://www.sqlite.org/download.html)

## Wiki

- [SQLite 简介 | 菜鸟教程](http://www.runoob.com/sqlite/sqlite-intro.html)
- [SQLite 性能 - 它不是内存数据库，不要对 IN-MEMORY 望文生意。 - bbqz007 - 博客园](https://www.cnblogs.com/bbqzsl/p/6066851.html)
- [C#操作 SQLite 数据库 - 阿凡卢 - 博客园](https://www.cnblogs.com/luxiaoxun/p/3784729.html)
- [[sqlite] db-journal 文件产生原因及说明 - Boffi - CSDN 博客](https://blog.csdn.net/mozart_cai/article/details/26815339)
- [SQLite 库级锁简介和“database is locked”异常的解决方法 - time 式的博客 - CSDN 博客](https://blog.csdn.net/WZh0316/article/details/81188451)

### 性能

- [sqlite3 数据库最大可以是多大？可以存放多少数据？读写性能怎么样？ - DerekHan - 博客园](https://www.cnblogs.com/derekhan/p/10897421.html)

### 读写/锁

```text
SQLite 是一个软件库，实现了自给自足的、无服务器的、零配置的、事务性的 SQL 数据库引擎。SQLite允许多个进程/线程同时进行读操作，但在同一时刻只允许一个线程进行写操作。SQLite在进行写操作时，数据库文件会被锁定，此时任何其他的读/写操作都会被阻塞，如果阻塞超过5秒钟（默认是5秒，可通过重新编译SQLite进行修改），就会抛出描述为“database is locked”的异常。

出现上述现象的原因是SQLite只支持库级锁，不支持并发执行写操作，即使是不同的表，同一时刻也只能进行一个写操作。例如，事务T1在表A新插入一条数据，事务T2在表B中更新一条已存在的数据，这两个操作是不能同时进行的，只能顺序进行。

SQLite尽量延迟了申请X锁，直到数据块真正写盘时才申请X锁，再加上被阻塞的操作有等待时间，所以当SQLite作为客户端嵌入数据库被使用时时，一般情况下不会抛出“database is locked”的异常。但是，在高并发的环境下，还是很有可能抛出异常的。避免这种异常的最简单有效的方法，就是在进行写操作时实现互斥锁，并保证写操作按顺序执行。
```

## SQLite 与 SQLite 区别

- 尽管是一个网站，但是，是两个产品。前者可用于 C#,后者可以直接使用。前者的安装目录包含的文件很多，后者包含很少。详细差别可以自行查找。

  - Robert SQLite
  - SQLite

- [System.Data.SQLite: Home](http://system.data.sqlite.org/index.html/doc/trunk/www/index.wiki)
- [SQLite Download Page](https://www.sqlite.org/download.html)

## VS 上安装插件

- [【SQLite】SqlLite 在 VisualStudio2017 中 C#的使用 - Kevin's life - CSDN 博客](https://blog.csdn.net/ght886/article/details/83791418)
- 使用 VS 连接 SQLite 数据库
- VS 扩展上联机安装
- 1.SQLite/SQL Server Compact ToolBox
- 2.dotConnect for SQLite
- [安装包](https://www.devart.com/dotconnect/sqlite/dcsqlitefree.exe)

## 代码

```C#

```

## 无法加载 DLL“SQLite.Interop.dll”: 找不到指定的模块。 (异常来自 HRESULT:0x8007007E)

- [无法加载 DLL“SQLite.Interop.dll”: 找不到指定的模块。 (异常来自 HRESULT:0x8007007E)](https://www.cnblogs.com/panjun/p/4635421.html)
- [【C#】使用 SQLite 无法加载 DLL“SQLite.Interop.dll 找不到指定的模块 - kyw 的专栏 - CSDN 博客](https://blog.csdn.net/kuyu05/article/details/82626194)

## 最新支持的 Visual C++ 支持

- [https://support.microsoft.com/zh-cn/help/2977003/the-latest-supported-visual-c-downloads](https://support.microsoft.com/zh-cn/help/2977003/the-latest-supported-visual-c-downloads)

## Nuget

- [NuGet Gallery
  | SQLite](https://www.nuget.org/profiles/SQLite)

## 常常遇到的错误

### SQL logic error or missing database no such table: T_logs

### 压缩 Sqlite 数据文件大小，解决数据删除后占用空间不变的问题

- [压缩 Sqlite 数据文件大小，解决数据删除后占用空间不变的问题 - Sam Lin - 博客园](https://www.cnblogs.com/samlin/p/5580191.html)

### sqlite 文件被占用，如何解决

- [sqlite 文件被占用，如何解决 - 张云勇 - CSDN 博客](https://blog.csdn.net/xiaoyong_net/article/details/25036631)

### 错误提示

#### SQl 重复列名

```c#
SQL logic error or missing database
duplicate column name: linktype

SQL逻辑错误或缺少数据库
重复的列名：linktype
```
