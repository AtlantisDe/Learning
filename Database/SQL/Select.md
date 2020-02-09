# Select

```sql
SELECT T_demos.*
FROM   T_demousers
WHERE  T_demos.url LIKE '%/news/%'  AND  T_demos.linktype != 1 ORDER BY T_demos.addtime DESC

SELECT COUNT (Guid)   as   cnt   FROM main.T_demos



```

## 1. Sqlite 类

- [Sqlite 时间段查询\_积木以明远-CSDN 博客](https://blog.csdn.net/u012156163/article/details/74940350)

```sql
SELECT *, rowid "NAVICAT_ROWID" FROM "main"."T_logs" WHERE Visitor='百度' LIMIT 100, 1000

-- Sqlite 的TOP 1查询方法同MySQL
SELECT * FROM MyUser ORDER BY CreatedOn DESC LIMIT 1

```

### 0. Sqlite 重置自增

- [Sqlite 重置自增 ID_sdhongjun 的专栏-CSDN 博客](https://blog.csdn.net/sdhongjun/article/details/86529613)

```sql
DELETE FROM TblName
DELETE FROM sqlite_sequence WHERE name = 'TblName';


```

### 1. Sqlite 时间段查询

```sql
SELECT *, rowid "NAVICAT_ROWID" FROM "main"."T_logs" WHERE Visitor='百度'  AND [AddTime]>= date('2020-02-02') AND   [AddTime]<= date('2020-02-03') LIMIT 100, 1000
SELECT *, rowid "NAVICAT_ROWID" FROM "main"."T_logs" WHERE Visitor='百度'  AND [AddTime]>= date('2020-02-02') AND   [AddTime]< date('2020-02-03')

-- 查询今天内的数据
select * from date_tbl where [date]>= date('now', 'localtime',  'start of day')
-- 查询本周内的数据
select * from date_tbl where [date]>= date('now', 'localtime', 'weekday 1', '-7 day', 'start of day')
-- 查询上一周的数据
select * from date_tbl where [date]>= date('now', 'localtime', 'weekday 1', '-14 day', 'start of day') and [date]< date('now', 'localtime', 'weekday 1', '-7 day', 'start of day')
-- 查询所有早上9:00之前的数据
select * from date_tbl time([time]) < time('09:00:00')
-- 查询今天早上9:00之前的数据
select * from date_tbl time([time]) < time('09:00:00') and [date] >= date('now', 'localtime',  'start of day')
-- 查询本周内的数据和对应的星期几
select strftime("%w", [date]) as week, [event] from date_tbl where [date]>= date('now', 'localtime', 'weekday 1', '-7 day', 'start of day') order by week

```
