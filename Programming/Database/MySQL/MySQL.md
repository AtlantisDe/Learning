# Mysql

## 1. Wiki

- [PHP [开发汇总] - 亚特凯瑟琳 - 博客园](https://www.cnblogs.com/bycnboy/p/9050405.html)

## 2. 字段类型

- [MySQL 中 varchar 最大长度是多少？ - 无敌秋秋 - 博客园](https://www.cnblogs.com/lbf1994/articles/5677453.html)

- char 是一种固定长度的类型，varchar 则是一种可变长度的类型
- 4.0 版本以下，varchar(20)，指的是 20 字节
- 5.0 版本以上，varchar(20)，指的是 20 字符

- [MySQL TEXT 数据类型的最大长度 - 唾手可得的树 - 博客园](https://www.cnblogs.com/usual2013blog/p/3747644.html)

```c#
TINYTEXT 256 bytes
TEXT 65,535 bytes ~64kb
MEDIUMTEXT 16,777,215 bytes ~16MB
LONGTEXT 4,294,967,295 bytes ~4GB
```

## 3. Windows 安装

- [MySQL :: MySQL Downloads](https://www.mysql.com/downloads/)
- [为什么我的 MySQL 添加服务时服务名必须是 MySQL 才能启动](https://zhidao.baidu.com/question/1927465888354214387.html)

```c#
// phpStudy常用路径
C:\phpstudy_pro\Extensions\MySQL5.7.26
D:\phpstudy_pro\Extensions\MySQL5.7.26


C:\phpstudy_pro\Extensions\MySQL5.7.26\bin
D:\phpstudy_pro\Extensions\MySQL5.7.26\bin


// 安装服务
d:
cd D:\phpstudy_pro\Extensions\MySQL5.7.26\bin
mysqld.exe -
net start mysql
net stop mysql

"D:\phpstudy_pro\Extensions\MySQL5.7.26\bin\mysqld.exe" -

// 卸载服务
installdir\mysql\bin\mysqld-nt --remove

// MySQL自定义服务名称
d:
cd D:\phpstudy_pro\Extensions\MySQL5.7.26\bin


cd mysql\bin

// 安装mysql服务
// mysqld.exe -install (默认bai服务名称是MySQL或者mysqld.exe -install “MySQL5″修改服务名称)
mysqld.exe -install
mysqld.exe -install "MySQL5.7.26"


// 删除mysql服务
// mysqld.exe -remove(或者mysqld.exe -remove “mysql5″)
mysqld.exe -remove
mysqld.exe -remove "MySQL5.7.26"

// ini参数配置文件d:\mysql\
// 将my-default.ini改为my.ini，根据需要添加参数

// 4、启动停止服务
// a)在命令行启动/停止
net start mysql
net stop mysql

net start "MySQL5.7.26"
net stop "MySQL5.7.26"

// b)或者去控制面板找服务启动
// c)或者开始/运行输入services.msc，确定后，找到mysql启动

```

## 4. C# MYsql

- [使用 EntityFramework6 连接 MySQL - 吴劲韬 - 博客园](https://www.cnblogs.com/wujingtao/p/5399950.html)

## 5. MySQL 常用信息

```c#
MySQL
localhost
root
root
```

## 6. QuickStart

- [自建数据库和云数据库区别和使用](https://www.bilibili.com/video/BV14v41117WM?from=search&seid=14573742943460180928)

```c#

```

## 7. 数据库地址

```c#
C:\phpstudy_pro\Extensions\MySQL5.7.26\data
D:\phpstudy_pro\Extensions\MySQL5.7.26\data

```

## 8. ENGINE mysql 的默认数据库引擎模式

- [Mysql 数据库的默认引擎 - kkzhang - 博客园](https://www.cnblogs.com/lemonzhang/p/13089359.html)
- [mysql 的 data 数据库只有.frm 而.myd 和.myi 没有，使用正常 - 神奇的旋风 - 博客园](https://www.cnblogs.com/xuan52rock/p/4551060.html)
- [mysql 创建表指定 字符类型与存储引擎 - Zery - 博客园](https://www.cnblogs.com/zery/p/6971902.html)k
- [Force engine=innodb when using Entity Framework Code First with mysql](https://stackoverflow.com/questions/33512761/force-engine-innodb-when-using-entity-framework-code-first-with-mysql)
- [How do I know if a MySQL table is using myISAM or InnoDB Engine?](https://www.tutorialspoint.com/how-do-i-know-if-a-mysql-table-is-using-myisam-or-innodb-engine)
- [How do I know if a MySQL table is using myISAM or InnoDB Engine?](https://www.tutorialspoint.com/how-do-i-know-if-a-mysql-table-is-using-myisam-or-innodb-engine)
- [Engine Configuration &mdash; SQLAlchemy 1.4 Documentation](https://docs.sqlalchemy.org/en/14/core/engines.html)
- [Getting Title at 36:04](https://github.com/dotnetcore/FreeSql/blob/540f2251b3761bc0caeb2e2894b67272d101f659/Providers/FreeSql.Provider.MySql/MySqlCodeFirst.cs)

```c#

// ①InnoDB：支持事务处理，支持外键，支持崩溃修复能力和并发控制。如果需要对事务的完整性要求比较高（比如银行），要求实现并发控制（比如售票），那选择InnoDB有很大的优势。如果需要频繁的更新、删除操作的数据库，也可以选择InnoDB，因为支持事务的提交（commit）和回滚（rollback）。

// 　　②MyISAM：插入数据快，空间和内存使用比较低。如果表主要是用于插入新记录和读出记录，那么选择MyISAM能实现处理高效率。如果应用的完整性、并发性要求比 较低，也可以使用。

// 　　③MEMORY：所有的数据都在内存中，数据的处理速度快，但是安全性不高。如果需要很快的读写速度，对数据的安全性要求较低，可以选择MEMOEY。它对表的大小有要求，不能建立太大的表。所以，这类数据库只使用在相对较小的数据库表。

// 注意，同一个数据库也可以使用多种存储引擎的表。如果一个表要求比较高的事务处理，可以选择InnoDB。这个数据库中可以将查询要求比较高的表选择MyISAM存储。如果该数据库需要一个用于查询的临时表，可以选择MEMORY存储引擎。

InnoDB 的优势在于提供了良好的事务处理、崩溃修复能力和并发控制。缺点是读写效率较差，占用的数据空间相对较大。

InnoDB

MyISAM

MEMORY


// MyISAM 与 InnoDB 文件的区别
// -----------------------------------------------------------------------------------------
frameworkusers.MYI
frameworkusers.MYD
frameworkusers.frm

CREATE TABLE `frameworkusers` (
  `ID` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `CellPhone` longtext CHARACTER SET utf8mb4,
  `HomePhone` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ZipCode` longtext CHARACTER SET utf8mb4,
  `CreateTime` datetime(6) DEFAULT NULL,
  `CreateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `UpdateTime` datetime(6) DEFAULT NULL,
  `UpdateBy` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ITCode` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Password` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `IsValid` tinyint(1) NOT NULL,
  `PhotoId` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenantCode` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`ID`),
  KEY `IX_FrameworkUsers_PhotoId` (`PhotoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

t_diancaidans.ibd
t_diancaidans.frm

CREATE TABLE `t_diancaidans` (
  `ID` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `CreateTime` datetime(3) DEFAULT NULL,
  `CreateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateTime` datetime(3) DEFAULT NULL,
  `UpdateBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DataText` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
// -----------------------------------------------------------------------------------------


DROP TABLE IF EXISTS apilog;

/*==============================================================*/
/* Table: apilog                                                */
/*==============================================================*/
CREATE TABLE apilog
(
   Id                   VARCHAR(40),
   systemName           VARCHAR(100) COMMENT '系统名称',
   systemCode           VARCHAR(50) COMMENT '系统编码',
   indentify            VARCHAR(100) COMMENT '标识(各种唯一Id如：userId ,orderId 等)',
   moduleId             VARCHAR(100) COMMENT '模块Id',
   serviceName          VARCHAR(100) COMMENT '接口名称',
   clientIP             VARCHAR(15) COMMENT '客户端IP',
   clientType           INT COMMENT '客户端类型 10 Android,20 IOS, 30 IE ,31 FireFox,32 Opera ,33 Safari ,34 Chrome ,40 Service(系统服务)',
   requestType          INT COMMENT '请求类型：0 GET,1 POST,2 PUT,3 DELETE',
   responseStatus       INT COMMENT '响应状态 0 成功 1  失败',
   responseTime         INT COMMENT '响应时长(毫秒)',
   inputParam           VARCHAR(2000) COMMENT '接口入参',
   outputParam          VARCHAR(2000) COMMENT '接口出参',
   appId                VARCHAR(100) COMMENT '应用Id',
   browerVersion        VARCHAR(100) COMMENT 'browerVersion',
   logTime              DATETIME COMMENT '日志时间',
   CreateTime           DATETIME
) ENGINE=INNODB  DEFAULT CHARSET=utf8 ;#指定引擎和存储字符类型

ALTER TABLE apilog COMMENT '接口日志';

```

## 10. MySql 链接字符串

- [MySql 链接字符串 - wisdo - 博客园](https://www.cnblogs.com/wisdo/p/4275166.html)

```c#
MySql连接字符串总结

1、本地数据库连接
    <connectionStrings>
        <add name="ConnectionString" connectionString="Server=localhost;Option=16834;Database=myDataBase" providerName="MySql.Data.MySqlClient"/>
    </connectionStrings>

2、远程数据连接
Server=myServerAddress;Option=131072;Stmt=;Database=myDataBase; User=myUsername;Password=myPassword;>

3、特殊的TCP/IP端口连接
Server=myServerAddress;Port=3306;Option=131072;Stmt=;Database=myDataBase; User=myUsername;Password=myPassword;

4. 标准连接
User ID=root;Password=myPassword;Host=localhost;Port=3306;Database=myDataBase; Direct=true;Protocol=TCP;Compress=false;Pooling=true;Min Pool Size=0;Max Pool Size=100;Connection Lifetime=;

说明：此Driver的默认端口是3306。如果没有在连接字符串中特别指出就是连接Mysql的3306端口。
```
