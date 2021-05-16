# Mysql

- [Ubuntu 安装 mysql 及设置远程访问方法](https://www.cnblogs.com/ruofengzhishang/p/5477502.html)
- [ubuntu 16.04 下重置 MySQL 5.7 的密码（忘记密码](https://blog.csdn.net/stubbornness1219/article/details/53445904)
- [MySQL8.0.11 最新版密码重置](https://www.cnblogs.com/Weirdo-world/p/9269483.html)
- [MySQL5.7 初始化后 5 种密码重置方法](https://www.cnblogs.com/reid21/p/9314376.html)
- [MySQL 5.7.16 修改密码提示 ERROR 1054 (42S22): Unknown column ''password'' in ''field list''的原因](https://www.jb51.net/article/102138.htm)
- [Mysql 在 18.04 中有一个大坑，你知道吗？](http://baijiahao.baidu.com/s?id=1605397136747327756&wfr=spider&for=pc)
- [Ubuntu18.04 安装 MySQL](https://blog.csdn.net/weixx3/article/details/80782479)
- [MySQL 官网](https://www.mysql.com/)
- [mysql 如何退出](https://www.cnblogs.com/harrytc/p/6725778.html)
- [开启 MySQL 远程访问权限 允许远程连接](https://www.cnblogs.com/weifeng1463/p/7941625.html)
- [Ubuntu 安装 mysql 及设置远程访问方法](https://www.cnblogs.com/ruofengzhishang/p/5477502.html)
- [Ubuntu 设置 MySQL 允许远程访问](https://www.cnblogs.com/wzwyc/p/10121409.html)
- [ubuntu 查看 mysql 版本的几种方法](https://www.cnblogs.com/zlsgh/p/8645589.html)
- [mysql 中“Table ‘’ is read only”的解决办法](https://www.cnblogs.com/jthb/p/3918874.html)
- [mysql 中 Table is read only 的解决方法](https://www.cnblogs.com/rianley/p/9272561.html)

## 查看版本

```shell
mysql -V
```

```c#
mysql  Ver 14.14 Distrib 5.7.26, for Linux (x86_64) using  EditLine wrapper
```

## 卸载方法

- [Ubuntu18.04 彻底删除 MySQL 数据库 - FG 成长空间 - CSDN 博客](https://blog.csdn.net/iehadoop/article/details/82961264)
- [Ubuntu 下 mysql 的卸载重装 - 杨少侠-ing - 博客园](https://www.cnblogs.com/y-rong/p/7727801.html)

### 首先删除 mysql

```shell
sudo apt-get remove mysql-*
```

### 然后清理残留的数据

```shell
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
```

- 它会跳出一个对话框，你选择 yes 就好了 然后安装 mysql
- sudo apt-get install mysql-client mysql-server 安装的时候会提示要设置 root 密码，如果你没有在卸载的时候去清理残留数据是不会提示你去设置 root 密码的
- 检查 mysql 是不是在运行
- sudo service mysql status

## mysql 及设置远程访问方法

```shell
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf

# 将bind-address = 127.0.0.1注释掉（即在行首加#），如下：
# 代码如下:
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
# bind-address          = 127.0.0.1
```

## 实现远程连接（改表法）

```shell
# 服务器: localhost »数据库: mysql
UPDATE `user` SET `Host` = '%' WHERE `user`.`Host` = 'localhost' AND `user`.`User` = 'root'
```

## 删除匿名用户

```shell
delete from user where user='';
```

## 启动/停止/重启数据库

```shell
sudo service mysql start   启动数据库服务
sudo service mysql stop    停止数据库服务
sudo service mysql restart 重启数据库服务
```

## mysql 数据库运行状态

```shell
sudo service mysql status
```

## 默认数据库位置

```shell
/var/lib/mysql
```

## 重置 root 密码

```shell
# 编辑mysql的配置文件/etc/mysql/my.cnf，在[mysqld]段下加入一行“skip-grant-tables”。
# 不同版本配置文件不同 /etc/mysql/mysql.conf.d/mysqld.cnf
# 重启数据库 sudo service mysql restart
mysql> use mysql;
mysql> update user set password=password("root")　where user="root";#旧版本
mysql> update mysql.user set authentication_string=PASSWORD('root') where User='root';#新版
mysql> flush privileges;
mysql> quit
```

```shell
sudo service mysql restart
```

## Mysql 数据库用户组信息

```shell
组 mysql [114]
拥有者 mysql [110]
```

## mysql 中“Table ‘’ is read only”的解决办法

```shell
# 通过这次，也找到了数据库文件的正确权限设置：data下面数据库文件夹700，表文件660，所有文件都应owned by mysql。
# 首先，找到mysqladmin所在位置，一般都在mysql/bin下面，然后运行一下命令：
./mysqladmin -u root -p flush-tables

# 1.mysql 安装目录权限设置为777
# 主要就是以下几个文件：

/usr/bin/mysql 是指：mysql的运行路径
/var/lib/mysql 是指：mysql数据库文件的存放路径
/usr/lib/mysql 是指：mysql的安装路径

# 2.运行命令，重启服务
cd /usr/local/mysql/bin
./mysqladmin -u root -p flush-tables #填写密码
```

## 安装 Mysql

```shell
sudo apt-get install mysql-server
sudo apt install mysql-server-5.7
sudo apt install mysql-server-5.7.25
mysql -V

mysql退出三种方法：
mysql > exit;
mysql > quit;
mysql > \q;
sudo service mysql restart 启数据库

# # 通过该条命令使用MySQL自带的客户端连接数据库服务器，然后输入以下命令查看root的登陆验证方式。
SELECT user,authentication_string,plugin,host FROM mysql.user;

# # 可以看到，root账号使用的auto_socket登陆验证方式，需要将它改为mysql_native_password方式。
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root密码';

# # 执行该条命令更新下配置，输入以下命令，再次查看root账号的登陆验证方式。
FLUSH PRIVILEGES;

# # 再次查看 OK
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

```sql
# 注释bind-address = 127.0.0.1 Ubuntu设置MySQL允许远程访问
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
# bind-address= 127.0.0.1
```

```shell
# # 实现远程连接（改表法）
UPDATE `user` SET `Host` = '%' WHERE `user`.`Host` = 'localhost' AND `user`.`User` = 'root'
# # 默认`Host` = 'localhost'
```
