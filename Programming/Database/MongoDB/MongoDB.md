# MongoDB

- [MongoDB Download Center](https://www.mongodb.com/download-center)
- [Build software better, together](https://github.com/topics/mongodb)
- [MongoDB Developer Community Forums](https://developer.mongodb.com/community/forums/)
- [meteor/meteor](https://github.com/meteor/meteor)
- [Text Search Languages &mdash; MongoDB Manual](https://docs.mongodb.com/manual/reference/text-search-languages/)
- [MongoDB 社区版本和企业版本差别 - 李克华 - 博客园](https://www.cnblogs.com/likehua/p/3796172.html)
- [mongodb-china/MongoDB-4.2-Manual](https://github.com/mongodb-china/MongoDB-4.2-Manual)
- [About the Working with Data category](https://developer.mongodb.com/community/forums/c/data/6)

```c#
MongoDB 从3.2 版本以后添加了对中文索引的支持
```

## 1. 教程

- [MongoDB 教程 | 菜鸟教程](http://www.runoob.com/mongodb/mongodb-tutorial.html)

## 2. Windows 安装

- [Install MongoDB Community Edition on Windows &mdash; MongoDB Manual](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/)

```c#
// 安装访问下面链接,打开页面选择版本下载即可,无需登陆.
// 当前最新版:
current: 4.4.0
// current: 4.4.0 安装后发现没有备份恢复工具 回滚安装4.2




D:\MongoDB
https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-4.4.0-signed.msi
D:\MongoDB\Server\4.4

https://fastdl.mongodb.org/win32/mongodb-win32-x86_64-2012plus-4.2.10-signed.msi
https://fastdl.mongodb.org/win32/mongodb-win32-x86_64-2012plus-4.2.9-signed.msi
D:\MongoDB\Server\4.2

//安装可能遇到问题

   > D:\MongoDB
   > [MongoDB 安装过程中的坑（最后一步卡住） - Artful_Dodger 的博客 - CSDN 博客](https://blog.csdn.net/Artful_Dodger/article/details/80844844)

   重要的事情说三遍，“取消”、“取消”、“取消勾选左侧的Install MongoDB Copmpass”选项
```

1. Select the server you would like to run:

   > [MongoDB Download Center](https://www.mongodb.com/download-center/community)

2. 安装可能遇到问题

   > D:\MongoDB
   > [MongoDB 安装过程中的坑（最后一步卡住） - Artful_Dodger 的博客 - CSDN 博客](https://blog.csdn.net/Artful_Dodger/article/details/80844844)

3. 访问测试

   > <http://localhost:27017>

## 3. MongoDB windows 镜像下载

- [Downloads for win32](http://dl.mongodb.org/dl/win32/x86_64)

```c#
[4.2.8版本]
http://downloads.mongodb.org/win32/mongodb-win32-x86_64-2012plus-4.2.8-signed.msi
```

## 4. MongoDB GUI 工具

- MongoCola 是一个开源的 MongoDB 管理工具。
- [推荐 5 个优秀的 Mongodb 可视化管理工具](https://blog.csdn.net/mrjkzhangma/article/details/90082092)
- [Download MongoDB Compass | MongoDB](https://www.mongodb.com/try/download/compass)

## 5. 配置其它 IP 访问

```c#
# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1,192.168.3.158


// 全部放行

  bindIp: 0.0.0.0

```

## 6. 问题与答案 Wiki

- [MongoDB 数据库最多可创建多少集合？](https://blog.csdn.net/Kwoky/article/details/82803038)

```c#
// 默认情况下，MongoDB 的每个数据库的命名空间保存在一个 16MB 的 .ns 文件中，平均每个命名占用约 628 字节，也即整个数据库的命名空间的上限约为 24000。

// 不过，如果真的需要建立更多的集合的话，MongoDB 也是支持的，只需要在启动时加上“--nssize”参数，这样对应数据库的命名空间文件就可以变得更大以便保存更多的命名。这个命名空间文件（.ns 文件）最大可以为 2G，也就是说最大可以支持约 340 万个命名，如果每个集合有一个索引的话，最多可创建约 170 万个集合。
```

## 7. 链接
