# 随机获取一行数据

- [SQLite 随机获取一行数据 - 今夜无风 - 博客园](https://www.cnblogs.com/demo-deng/p/9626131.html)
- [[NewLife.XCode]百亿级性能 - 大石头 - 博客园](https://www.cnblogs.com/nnhy/p/xcode_100billion.html#_label2)
- [SQLite - How to select a random row from a SQLite table?](https://tableplus.com/blog/2018/07/sqlite-how-to-select-a-random-row.html)

## 常用

### 1. 随机取一行数据

```c#
// Mysql中随机获取一行数据：

SELECT * FROM table ORDER BY RAND() limit 1
// SQLite中随机获取一行数据：

SELECT * FROM table ORDER BY RANDOM() limit 1
// limit后面跟你要随机生成多少的数据

SELECT  *  FROM T_demos WHERE T_demos.used = 0 LIMIT 123746,1


SELECT  guid FROM T_demos WHERE T_demos.used = 0 LIMIT 1 OFFSET r

SELECT  *  FROM T_demos WHERE T_demos.used = 0 LIMIT 1 OFFSET 8


```

### 2. 速度稍微好点的

```c#
SELECT * FROM T_users LIMIT 1 OFFSET ABS(RANDOM()) % MAX((SELECT COUNT(*) FROM T_users), 1)

SELECT * FROM T_users WHERE T_demos.used = 0 LIMIT 1 OFFSET ABS(RANDOM()) % MAX(( SELECT COUNT(*) FROM T_users), 1)
```

### 3. 速度最好的

```c#

// 网友:gz-xigema
// 经典语句:

select * from tb  where tb.id = (select id from tb limit 160000,1)

// 牛逼Class 真正高手啊 隐藏人间啊 解决问题!特此笔录!


SELECT * FROM `T_users`   WHERE ( `Linktype` = 0 )  ORDER BY RANDOM() ASC LIMIT 0,30

select * from main.T_users  where  ( `Linktype` = 1 )  AND main.T_users.guid IN (select guid from T_users limit 1,30)

select * from main.T_users  where  ( `Linktype` = 0 )  AND main.T_users.guid IN (select guid from T_users ORDER BY RANDOM() ASC LIMIT 0,30)
```
