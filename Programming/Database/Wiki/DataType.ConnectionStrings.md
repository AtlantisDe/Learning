# ConnectionStrings

- [2881099/FreeSql](https://github.com/2881099/FreeSql)

## 0. 常用

### 1. 收集

```c#
Version=3;
"Data Source={0};Version=3;"
"Data Source={0};Cache Size=-524288;Synchronous=Off;Journal Mode=WAL"
ConnectionString = $@"Data Source={ConnectionString};Cache Size=-524288;Synchronous=Off;Journal Mode=WAL",

```

### 2. 收集

- [High-Performance Async MySQL Driver for .NET - MySqlConnector](https://mysqlconnector.net/)
- [MySQL Connection String for C# .NET Core Programs - MySqlConnector](https://mysqlconnector.net/connection-options/)

```c#
| DataType                   | ConnectionString                                                                                                                                                                                |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| DataType.MySql             | Data Source=127.0.0.1;Port=3306;User ID=root;Password=root; Initial Catalog=cccddd;Charset=utf8; SslMode=none;Min pool size=1                                                                   |
| DataType.PostgreSQL        | Host=192.168.164.10;Port=5432;Username=postgres;Password=123456; Database=tedb;Pooling=true;Minimum Pool Size=1                                                                                 |
| DataType.SqlServer         | Data Source=.;Integrated Security=True;Initial Catalog=freesqlTest;Pooling=true;Min Pool Size=1                                                                                                 |
| DataType.Oracle            | user id=user1;password=123456; data source=//127.0.0.1:1521/XE;Pooling=true;Min Pool Size=1                                                                                                     |
| DataType.Sqlite            | Data Source=\|DataDirectory\|\document.db; Attachs=xxxtb.db; Pooling=true;Min Pool Size=1                                                                                                       |
| DataType.OdbcMySql         | Driver={MySQL ODBC 8.0 Unicode Driver}; Server=127.0.0.1;Persist Security Info=False; Trusted_Connection=Yes;UID=root;PWD=root; DATABASE=cccddd_odbc;Charset=utf8; SslMode=none;Min Pool Size=1 |
| DataType.OdbcSqlServer     | Driver={SQL Server};Server=.;Persist Security Info=False; Trusted_Connection=Yes;Integrated Security=True; DATABASE=freesqlTest_odbc; Pooling=true;Min Pool Size=1                              |
| DataType.OdbcOracle        | Driver={Oracle in XE};Server=//127.0.0.1:1521/XE; Persist Security Info=False; Trusted_Connection=Yes;UID=odbc1;PWD=123456; Min Pool Size=1                                                     |
| DataType.OdbcPostgreSQL    | Driver={PostgreSQL Unicode(x64)};Server=192.168.164.10; Port=5432;UID=postgres;PWD=123456; Database=tedb_odbc;Pooling=true;Min Pool Size=1                                                      |
| DataType.OdbcDameng (达梦) | Driver={DM8 ODBC DRIVER};Server=127.0.0.1:5236; Persist Security Info=False; Trusted_Connection=Yes; UID=USER1;PWD=123456789                                                                    |
| DataType.Odbc              | Driver={SQL Server};Server=.;Persist Security Info=False; Trusted_Connection=Yes;Integrated Security=True; DATABASE=freesqlTest_odbc; Pooling=true;Min pool size=1                              |

```
