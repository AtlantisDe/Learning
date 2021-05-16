# 索引

- [SQLite 索引 | 菜鸟教程](https://www.runoob.com/sqlite/sqlite-index.html)
- [数据库索引分类 - 一直都是瑾凉 - 博客园](https://www.cnblogs.com/zsc1/p/9230096.html)

```c#
数据库索引

作用：

// 提高查询速度
// 确保数据的唯一性
// 可以加速表和表之间的连接，实现表和表之间的参照完整性
// 使用分组和排序子句进行数据检索时，可以减少分组和排序的时间
// 全文检索字段进行搜素优化
分类:
// 主键索引（PRIMAY KEY）
// 唯一索引（UNIQUE）
// 常规索引（INDEX）
// 全文索引（FULLTEXT）
```

## 0. 常用

### 1.Sqlite 数据库索引

```C#
SELECT * FROM sqlite_master WHERE type = 'index';
CREATE INDEX roboter_addtime ON T_demousers (roboter,addtime);
CREATE INDEX roboter_addtime ON T_demousers (roboter,addtime DESC);
DROP INDEX roboter_addtime;
DROP INDEX roboter;

// 如果您希望以降序索引某个列中的值，您可以在列名称之后添加保留字 DESC：
CREATE INDEX PersonIndex ON Person (LastName DESC)
```

```sql
-- 在表上创建一个简单的索引。允许使用重复的值：

-- 您可以列出数据库范围的所有索引，如下所示：
SELECT * FROM sqlite_master WHERE type = 'index';

CREATE INDEX index_name ON table_name (column_name)

-- 删除索引
drop index index_name on table_name;

roboter
"roboter" COLLATE BINARY DESC

CREATE INDEX "main"."roboter"
ON "T_Demourls" (
  "roboter" COLLATE BINARY DESC
);
```

### 1. 数据库主键到底是用自增长 还是 UUID

- [数据库主键到底是用自增长（INT）好还是 UUID 好？\_落尘曦的博客-CSDN 博客](https://blog.csdn.net/qq_23994787/article/details/90289743)

```c#
// 那么一般情况下是如何选择的呢？
// 1、项目是单机版的，并且数据量比较大（百万级）时，用自增长的，此时最好能考虑下安全性，做些安全措施。
// 2、项目是单机版的，并且数据量没那么大，对速度和存储要求不高时，用UUID。
// 3、项目是分布式的，那么首选UUID，分布式一般对速度和存储要求不高。
// 4、项目是分布式的，并且数据量达到千万级别可更高时，对速度和存储有要求时，可以用自增长。
// 总体对比来看自增长相对来说在较大的项目中是首选，那么有没有一更优于自增长的方法呢？答案在↓边！
// SnowFlake是一种介于自增长和UUID之间的一种主键（存储空间小、速度快、分布式、时间序列）它有如下优点

```
