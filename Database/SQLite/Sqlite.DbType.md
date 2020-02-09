# Sqlite.DbType

- [SQLite 学习手册(数据类型) - Stephen_Liu - 博客园](https://www.cnblogs.com/stephen-liu74/archive/2012/01/18/2325258.html)
- [SQLite 的优化总结 - 雪残梦影 - 博客园](https://www.cnblogs.com/xuecanmeng/p/5459334.html)

```c#
// 最好不要给数据库留NULL，尽可能的使用 NOT NULL填充数据库.
// 备注、描述、评论之类的可以设置为 NULL，其他的，最好不要使用NULL。
// 不要以为 NULL 不需要空间，比如：char(100) 型，在字段建立时，空间就固定了， 不管是否插入值（NULL也包含在内），都是占用 100个字符的空间的，如果是varchar这样的变长字段， null 不占用空间。
```
