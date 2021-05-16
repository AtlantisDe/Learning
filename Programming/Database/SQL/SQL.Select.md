# Select

```sql
SELECT T_demos.*
FROM   T_demousers
WHERE  T_demos.url LIKE '%/news/%'  AND  T_demos.linktype != 1 ORDER BY T_demos.addtime DESC


SELECT * FROM main.T_Urls  WHERE main.T_Urls.Guid IN (SELECT Guid FROM T_Urls WHERE Title LIKE '%中国%' OR Title LIKE '%荷兰%'  ORDER BY RANDOM() DESC LIMIT 0,2)


SELECT COUNT (Guid) as cnt FROM main.T_demos

SELECT page_count * page_size as size FROM pragma_page_count(), pragma_page_size();

```

## 1. Sqlite 类

- [Sqlite 时间段查询 积木以明远-CSDN 博客](https://blog.csdn.net/u012156163/article/details/74940350)

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

### 2. Sqlite 分页查询

- [性能优化之分页查询 - 掘金](https://juejin.im/post/6844903716315742216)
- [大数据量分页查询，SQL 语句怎么优化？ - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/article/1449076)
- [sqlite 分页查询 - 一抹、思乡泪 - 博客园](https://www.cnblogs.com/xhk-yjp/archive/2013/04/10/3012297.html)

```c#

// select * from users order by id limit 10 offset 0;//offset代表从第几条记录“之后“开始查询，limit表明查询多少条结果
// 运用：
// sqlitecmd.CommandText = string.Format("select * from GuestInfo order by GuestId limit {0} offset {0}*{1}", size, index-1);//size:每页显示条数，index页码
SELECT * FROM T_Urls ORDER BY CreateDate limit 10 offset 10*31-1

root@xxx 12:33:43>explain SELECT a.* FROM relation a, (select id from relation where biz_type ='0' AND end time >='2014-05-29' ORDER BY id asc LIMIT 149420 ,20 ) b where a.id=b.id;
+----+-------------+-------------+--------+---------------+---------+---------+------+--------+-------+
| id | select_type | table       | type   | possible_keys | key     | key_len | ref  | rows   | Extra |
+----+-------------+-------------+--------+---------------+---------+---------+------+--------+-------+
| 1  | PRIMARY     | <derived2>  | ALL    | NULL          | NULL    | NULL    | NULL | 20     |       |
| 1  | PRIMARY     | a           | eq_ref | PRIMARY       | PRIMARY | 8       | b.id | 1      |       |
| 2  | DERIVED     | relation    | index  | ind_endtime   | PRIMARY | 8       | NULL | 733552 |       |
+----+-------------+-------------+--------+---------------+---------+---------+------+--------+-------+
3 rows in set (0.36 sec)

```

## 2. Mysql 类

### 0. Mysql count

- [关于 mysql 中的 count()函数 - 啊哈哈哈哈- - 博客园](https://www.cnblogs.com/-flq/p/10302965.html)

```sql

3.count(*)&count(1)&count(列名)执行效率比较：
（1）如果列为主键，count(列名)效率优于count(1)
（2）如果列不为主键，count(1)效率优于count(列名)
（3）如果表中存在主键，count(主键列名)效率最优
（4）如果表中只有一列，则count(*)效率最优
（5）如果表有多列，且不存在主键，则count(1)效率优于count(*)


4.因为count(*)和count(1)统计过程中不会忽略列值为NULL的记录，所以可以通过以下两种方式来统计列值为NULL的记录数:

（1）select count(*) from table where is_active is null;
（2）select count(1) from table where is_active is null;


select count('') from table;-返回表的记录数
select count(0) from table;-返回表的记录数
select count(null) from table;-返回0

```
