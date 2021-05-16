# MongoDB.mongodump.mongorestore

- MongoDB 备份(mongodump)与恢复(mongorestore)
- [MongoDB 备份(mongodump)与恢复(mongorestore) | 菜鸟教程](https://www.runoob.com/mongodb/mongodb-mongodump-mongorestore.html)

## 备份与恢复

### 1. 常用

```c#
// 常用备份命令:
mongodump -h 127.0.0.1:27017 -d DemoAppDatabase -o C:\Tmp\DB

// MongoDB数据备份 语法
mongodump -h dbhost -d dbname -o dbdirectory
-h：// MongDB所在服务器地址，例如：127.0.0.1，当然也可以指定端口号：127.0.0.1:27017
-d：// 需要备份的数据库实例，例如：test
-o：// 备份的数据存放位置，例如：c:\data\dump，当然该目录需要提前建立，在备份完成后，系统自动在dump目录下建立一个test目录，这个目录里面存放该数据库实例的备份数据。
D:\DB

// 常用恢复命令:
mongorestore -h 127.0.0.1:27017 -d DemoAppDatabase C:\Tmp\DB\DemoAppDatabase


// MongoDB数据恢复
mongorestore -h <hostname><:port> -d dbname <path>
--host <:port>, -h <:port>：// MongoDB所在服务器地址，默认为： localhost:27017
--db , -d ：// 需要恢复的数据库实例，例如：test，当然这个名称也可以和备份时候的不一样，比如test2
--drop：// 恢复的时候，先删除当前数据，然后恢复备份的数据。就是说，恢复后，备份后添加修改的数据都会被删除，慎用哦！
<path>：// mongorestore 最后的一个参数，设置备份数据所在位置，例如：c:\data\dump\test。
// 你不能同时指定 <path> 和 --dir 选项，--dir也可以设置备份目录。
--dir：// 指定备份的目录 你不能同时指定 <path> 和 --dir 选项。

```

### 2. 备份全部数据库命令 与 恢复全部数据库命令 慎用

```c#
// 灵活妙用,可以把要恢复的数据库拷贝进文件夹,如果文件夹有其它数据库,可以先把它们移开.保证文件夹里有即将恢复数据库即可.

// 执行以上命令后，客户端会连接到ip为 127.0.0.1 端口号为 27017 的MongoDB服务上，并备份所有数据到 bin/dump/ 目录中。
mongodump

// 以下命令恢复所有数据库
mongorestore
```

### 3. MongoDB 数据集合备份 | 还原

```c#
// 数据集合备份
mongoexport -h 127.0.0.1:27017 -d hrst -u hrst -p 123  -c collectionname -o D:\Desktop\1\collectionname.json
// 数据集合还原
mongoimport -h 127.0.0.1:27017 -d hrst -u hrst -p 123 -c collectionname D:\Desktop\1\collectionname.json

// 实例
// 备份自定义板块集合
mongoexport -h 127.0.0.1:27017 -d DemoAppDatabase -c T_ZdyItems -o C:\Tmp\DB\Collections\T_ZdyItems.json
// 恢复自定义板块集合
mongoimport -h 127.0.0.1:27017 -d DemoAppDatabase -c T_ZdyItems C:\Tmp\DB\Collections\T_ZdyItems.json



备份
// 注释说明
// -h：MongDB所在服务器地址，例如：127.0.0.1，也可以指定端口号
// -d：需要备份的数据库实例，例如：hrst （数据库名称，可以备份该数据库下所有集合）
// -u：数据库用户名，无加密可不写
// -p：数据库密码，没有可不写

// -c：集合名称
// -o：备份的数据存放位置，例如：E:\MongoDB\bin ，在备份完成后，系统自动在bin目录下生成一个以集合名称命名的json文件，即为需要导出的集合。

// 若无加密可直接双击bin目录下mongodump.exe备份所有数据


还原
// -h：MongoDB所在服务器地址 -

// d：需要恢复的数据库实例，恢复时会自动新建实例，例如：hrst

// -u：数据库用户名，无加密可不写

// -p：数据库密码，没有可不写

// -c：集合名称

// 最后接路径

// 注意：集合导入的时候集合名称后的路径前不写-o或者--dir，否则会报错
```
