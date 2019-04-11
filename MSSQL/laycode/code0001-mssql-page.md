# MSSQL分页代码

## Code

```sql
-- sqlserver 字符串转日期
select COUNT(Id) as TotalRows  from (select * from T_京东采购订单_frm_展示) t
where id in (select id from (select id,row_number() over (order by id) as num from T_京东采购订单_frm_展示) as settable where num between (1-1)*5+1 and 1*5)
select * from (select * from T_京东采购订单_frm_展示) t where id in (select id from (select id,row_number() over (order by id) as num from T_京东采购订单_frm_展示) as settable where num between (1-1)*5+1 and 1*5)
````

## SQL合并行数据

```sql
UNION ALL
```