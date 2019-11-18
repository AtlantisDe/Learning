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


```

### 2. 速度稍微好点的

```c#
SELECT * FROM T_urls LIMIT 1 OFFSET ABS(RANDOM()) % MAX((SELECT COUNT(*) FROM T_urls), 1)

SELECT * FROM T_urls WHERE T_urls.used = 0 LIMIT 1 OFFSET ABS(RANDOM()) % MAX(( SELECT COUNT(*) FROM T_urls), 1)
```
