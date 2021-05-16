# Sqlite database is locked

- [Getting Title at 58:28](https://www.cnblogs.com/xienb/p/3455562.html)
- Sqlite.Database.Locked

## 1. 常见锁表语句

```c#
// 查询 Count 也会被锁表
SELECT COUNT (Guid)   AS   TotalCount   FROM main.T_DailyItem
SELECT COUNT (Guid)   AS   TotalCount   FROM main.T_DailyItem WHERE Guid= 'sz00223220200416'
SELECT COUNT (Guid)   AS   TotalCount   FROM main.T_DailyItem WHERE Guid= 'sz00233220200416'


SQLite error (5): database is locked in "SELECT Guid  FROM main.T_DailyItem WHERE Guid= 'sz00205520200619'"
```


## 2. 常见锁表语句
