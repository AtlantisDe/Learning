# SqlLocalDB

- [SQL Server Express LocalDB - SQL Server](https://docs.microsoft.com/zh-cn/sql/database-engine/configure-windows/sql-server-express-localdb?view=sql-server-ver15)
- [SqlLocalDB Utility - SQL Server](https://docs.microsoft.com/en-us/sql/tools/sqllocaldb-utility?view=sql-server-ver15)
- [LocalDB 介绍 - LoveTomato - 博客园](https://www.cnblogs.com/LoveTomato/p/9838210.html)

## 操作命令

```C#
// 启动、停止LocalDB实例
SqlLocalDB start "MyLocalDB"
SqlLocalDB stop "MyLocalDB"
```

### 路径

- SqlLocalDB.exe
- %ProgramFiles%\Microsoft SQL Server\110\Tools\Binn

### CMD 命令行中运行 SqlLocalDB.exe

- Cd %ProgramFiles%\Microsoft SQL Server\110\Tools\Binn
- SqlLocalDB.exe /?
