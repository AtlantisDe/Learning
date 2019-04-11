# MSSQL-Datetime

- [Sql 中常用日期转换Convert(Datetime)](http://blog.csdn.net/baiduandxlei/article/details/9180075)
- [MSSQL将秒数转换为小时](http://blog.itpub.net/729024/viewspace-1035039/)
- [MS SQL Server中的CONVERT日期格式化大全](http://www.cnblogs.com/johngong/archive/2009/02/11/1388233.html)

## Code

```sql
-- sqlserver 字符串转日期
declare @bdate date
set @bdate = convert(datetime,'2014-06-01')
declare @edate  date
set @edate = convert(datetime,'2014-06-30');
<= CONVERT (datetime, '2017-05-02 17:51:09.787')
-- SQL 取前一天、一月、一年的时间
SELECT DATEADD(DAY,-1,'20121212')  
SELECT DATEADD(DAY,-1,GETDATE())  
SELECT DATEADD(MONTH,-1,'20121212')  
SELECT DATEADD(MONTH,-1,GETDATE())  
SELECT DATEADD(YEAR,-1,'20121212')  
SELECT DATEADD(YEAR,-1,GETDATE())
> DATEADD(MONTH, - 1, GETDATE())
````

## SQL合并行数据

```sql
UNION ALL
```