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

## 常用

### 1.Sqlite 数据库索引

```C#
SELECT * FROM sqlite_master WHERE type = 'index';

CREATE INDEX roboter_addtime ON T_demousers (roboter,addtime);

CREATE INDEX roboter_addtime ON T_demousers (roboter,addtime DESC);

DROP INDEX roboter_addtime;

DROP INDEX roboter;

// 如果您希望以降序索引某个列中的值，您可以在列名称之后添加保留字 DESC：
CREATE INDEX PersonIndex
ON Person (LastName DESC)
```

```sql
-- 在表上创建一个简单的索引。允许使用重复的值：

-- 您可以列出数据库范围的所有索引，如下所示：
SELECT * FROM sqlite_master WHERE type = 'index';






CREATE INDEX index_name
ON table_name (column_name)


-- 删除索引
drop index index_name on table_name;

roboter
"roboter" COLLATE BINARY DESC


CREATE INDEX "main"."roboter"
ON "T_Demourls" (
  "roboter" COLLATE BINARY DESC
);
```
