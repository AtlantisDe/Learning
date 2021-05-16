# SQL

- [Check your SQLite Version | Database.Guide](https://database.guide/check-sqlite-version/)

## 1. SQL 常用大全

### 1. 常用语句

```C#

VACUUM /*清理空闲页*/

SELECT sqlite_version(); /*Check your SQLite Version 查看数据库版本信息*/
```

### 1. sqlite version 查看版本信息

- [sqlite 数据库查看里面数据库版本号-云栖社区-阿里云](https://yq.aliyun.com/articles/465862)

```C#
// 查看版本信息
select sqlite_version();
SELECT SQLITE_VERSION()

// 应该跟驱动版本有关系

// 3.32.1
// 3.30.1

// sqlite3.exe
.dbinfo
```

### 2. SQLite.Index 索引

- [Website Keyword Index](https://www.sqlite.org/keyword_index.html)
- [SQLite 索引 | 菜鸟教程](https://www.runoob.com/sqlite/sqlite-index.html)

```c#
// 什么情况下要避免使用索引？
// 虽然索引的目的在于提高数据库的性能，但这里有几个情况需要避免使用索引。使用索引时，应重新考虑下列准则：
// 索引不应该使用在较小的表上。
// 索引不应该使用在有频繁的大批量的更新或插入操作的表上。
// 索引不应该使用在含有大量的 NULL 值的列上。
// 索引不应该使用在频繁操作的列上。
```

### 3. SQLite Keywords

- [SQLite Keywords](https://www.sqlite.org/lang_keywords.html)
- [SQLite Keywords (Language) - Sqlite 中文开发手册 - 开发者手册 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/section/1419923)

```c#

```

### 4. Sqlite.DbType

- [SQLite 学习手册(数据类型) - Stephen_Liu - 博客园](https://www.cnblogs.com/stephen-liu74/archive/2012/01/18/2325258.html)
- [SQLite 的优化总结 - 雪残梦影 - 博客园](https://www.cnblogs.com/xuecanmeng/p/5459334.html)

```c#
// 最好不要给数据库留NULL，尽可能的使用 NOT NULL填充数据库.
// 备注、描述、评论之类的可以设置为 NULL，其他的，最好不要使用NULL。
// 不要以为 NULL 不需要空间，比如：char(100) 型，在字段建立时，空间就固定了， 不管是否插入值（NULL也包含在内），都是占用 100个字符的空间的，如果是varchar这样的变长字段， null 不占用空间。

```

### 5. Sqlite PRAGMA

- [SQLite 中的 PRAGMA 语句攻略 - 宋兴柱 - 博客园](https://www.cnblogs.com/songxingzhu/p/3992884.html)

```c#
PRAGMA语句是SQLITE数据的SQL扩展，是它独有的特性，主要用于修改SQLITE库或者内数据查询的操作。它采用与SELECT、INSERT等语句一样的形式来发出请求，但也有几个重要的不同：
1. 特定的PRAGMA语句可能被移走，新的PRAGMA语句可能在新的版本中添加。因此，后向兼容无法保证。
2. 未知的PRAGMA命令不会有错误消息出现，它只是简单的忽略。
3. 有些PRAGMA只在SQL的编译阶段起作用，而不是执行阶段。　这意味着如果使用C语言，sqlite3_prepare(), sqlite3_step(), sqlite3_finalize()这几个API，pragma命令可能只在prepare()的调用里运行，而不是在后两个API当中执行。或者，pragma可能在sqlite3_step()执行的时候运行。到底在哪个阶段执行，取决于pragma从本身，以及是哪个sqlite的release版本。
4. pragma命令是sqlite特有的，基本上不可能与其它数据库保持兼容。
```

```c#
下面我们看看sqlite到底有些有用的pragma命令：
auto_vacuum
automatic_index
cache_size
case_sensitive_like
checkpoint_fullfsync
collation_list
compile_options
count_changes¹
database_list
default_cache_size¹
empty_result_callbacks¹
encoding
foreign_key_list
foreign_keys
freelist_count
full_column_names¹
fullfsync
ignore_check_constraints
incremental_vacuum
index_info
index_list
integrity_check
journal_mode
journal_size_limit
legacy_file_format
locking_mode
max_page_count
page_count
page_size
parser_trace²
quick_check
read_uncommitted
recursive_triggers
reverse_unordered_selects
schema_version
secure_delete
short_column_names¹
synchronous
table_info
temp_store
temp_store_directory¹
user_version
vdbe_listing²
vdbe_trace²
wal_autocheckpoint
wal_checkpoint
writable_schema
这里边有几个标了右上标为1的，似乎已经被obsoleted掉了。标为2的，只被用于debug,仅当sqlite在预编译宏SQLITE_DEBUG下build出来，才有用。
```

### 5. Sqlite.Insert

- [使用事务操作 SQLite 数据批量插入，提高数据批量写入速度，源码讲解 - 伍华聪 - 博客园](https://www.cnblogs.com/wuhuacong/p/3310008.html)
- [提升 SQLite 数据插入效率低、速度慢的方法 - fugaoting 的博客 - CSDN 博客](https://blog.csdn.net/fugaoting/article/details/88732027)
- [提升 SQLite 数据插入效率低、速度慢的方法 - majiakun1 的专栏 - CSDN 博客](https://blog.csdn.net/majiakun1/article/details/46607163)
- [c# 对 sqlite 基本操作，带批量插入（百万级秒插）-CSDN 下载](https://download.csdn.net/download/mic_gary/10154869)

```c#

```

#### 1. 常遇到问题

#### 2. string or blob too big

- System.Data.SQLite.SQLiteException:“string or blob too big
- statement too long”

### 6. Sqlite.Repair

- SQLite 有一个很严重的缺点就是不提供 Repair 命令.
- 导致死亡提示 database disk image is malformed 它的产生有很多种可能,
- 比如,磁盘空间不足,还有就是写入数据过程中突然掉电等.官

- [SQLite 数据库错误：The database disk image is malformed 解决(修复)方法 - 林鹤霄 - ITeye 博客](https://linhexiao.iteye.com/blog/2342808)
- [使用 SQLite 的感想 - 猴健居士 - 博客园](https://www.cnblogs.com/HopeGi/archive/2013/05/28/3102922.html)
- [sqlite 错误 database disk image is malformed 可解决 - wolfking0608 的博客 - CSDN 博客](https://blog.csdn.net/wolfking0608/article/details/71076588)
- [讨论 SQLite 数据库损坏与修复 - 飞龙在天 - CSDN 博客](https://blog.csdn.net/dragonpeng2008/article/details/52094269)

```c#
// 最后这个问题还是解决了，我的解决方法是： 下载SQLite Expert Professional，一定要Professional版(收费)的，Personal版(免费)的没有修复功能。

```

#### 1. 软件下载

```c#
sqlite-tools-win32-x86-3280000.zip

// (1.70 MiB)

//  A bundle of command-line tools for managing SQLite database files, including the command-line shell program, the sqldiff.exe program, and the sqlite3_analyzer.exe program.
// (sha1: 4063fe326243ab775a86c104fa77ac178f03976b)
```

### 7. Sqlite.ClearAllPools

```c#
public static bool ConnectionAndClose()
{
    using (var db = GetInstance_ByCustomPathConnection(@"D:\Tmp\SqliteDemo\main.db3"))
    {
        var Linkitems = db.Queryable<Linkitem>().ToList();
    }

    GC.Collect();
    GC.WaitForPendingFinalizers();
    System.Data.SQLite.SQLiteConnection.ClearAllPools();

    return true;
}
```

### 8. SQLite 中并不支持 Truncate 语句

- [SQLite 中清空整表记录](https://www.jianshu.com/p/a7210ddaa3e9)
- [Sqlite 清空表数据 - HTL - 博客园](https://www.cnblogs.com/huangtailang/p/3246336.html)
- [sql 语句清空表数据 - 乔小生 1221 - 博客园](https://www.cnblogs.com/qxh-beijing2016/p/12522091.html)

```c#
delete from TableName;  //清空数据
update sqlite_sequence SET seq = 0 where name ='TableName';//自增长ID为0


db.SqliteExecuteCommandWithNoException($"DELETE FROM  T_TagItemV1s;");
db.SqliteExecuteCommandWithNoException($"DELETE FROM sqlite_sequence WHERE name = 'T_TagItemV1s';");
db.SqliteExecuteCommandWithNoException("VACUUM;");


1.delete------ 是逐行删除速度极慢，不适合大量数据删除。
Delete from tablename where 1=1
2.truncate---- 删除所有数据，保留表结构，不能撤消还原。
TRUNCATE TABLE tablename
3.drop-------- 删除表，数据和表结构一起删除，快速。

```
