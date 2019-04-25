# Nginx

- [如何在 Ubuntu 18.04 上安装 Nginx](https://www.linuxidc.com/Linux/2018-05/152257.htm)
- [http://hg.nginx.org/nginx/](http://hg.nginx.org/nginx/)
- [nginx: Linux packages](http://nginx.org/en/linux_packages.html)
- [nginx: Linux packages](http://nginx.org/en/linux_packages.html#sourcepackages)
- [How To Install Nginx on Ubuntu 18.04 [Quickstart] | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04-quickstart)
- [linux 安装 gitlab 并修改 gitlab 默认端口号](https://blog.csdn.net/wangyy130/article/details/85633303)
- [linux nginx 配置新项目加域名](https://www.cnblogs.com/wesky/p/6419901.html)
- [nginx 下部署网站站点](https://blog.csdn.net/github_39088222/article/details/82020835)
- [Ubuntu 下 Nginx 启动、停止等常用命令](https://www.cnblogs.com/fireicesion/p/8457898.html)
- [nginx 提示 Job for nginx.service failed because the control 的问题](https://www.cnblogs.com/skura23/p/7086447.html)
- [如何在 Ubuntu18.04 上安装 Linux、Nginx、MySQL 和 PHP（LEMP stack）](https://blog.csdn.net/wudics/article/details/84073350)
- [Mysql 在 18.04 中有一个大坑，你知道吗？](http://baijiahao.baidu.com/s?id=1605397136747327756&wfr=spider&for=pc)
- [Ubuntu18.04 安装 MySQL](https://blog.csdn.net/weixx3/article/details/80782479)
- [MySQL 官网](https://www.mysql.com/)
- [mysql 如何退出](https://www.cnblogs.com/harrytc/p/6725778.html)
- [开启 MySQL 远程访问权限 允许远程连接](https://www.cnblogs.com/weifeng1463/p/7941625.html)
- [Ubuntu 安装 mysql 及设置远程访问方法](https://www.cnblogs.com/ruofengzhishang/p/5477502.html)
- [Ubuntu 设置 MySQL 允许远程访问](https://www.cnblogs.com/wzwyc/p/10121409.html)
- [ubuntu 查看 mysql 版本的几种方法](https://www.cnblogs.com/zlsgh/p/8645589.html)
- [Gitlab 服务器 url 修改后，项目 path 的修改](https://blog.csdn.net/u013377887/article/details/73717729)
- [gitlab 启用 https](https://www.cnblogs.com/xieshuang/p/8488458.html)
- [gitlab 开启 https 加密 and 全站 https](https://blog.51cto.com/53cto/1775865)
- [NGINX setting 官方](https://docs.gitlab.com/omnibus/settings/nginx.html#manually-configuring-https)
- [nginx 配置 ssl 证书实现 https 访问](https://www.cnblogs.com/tianhei/p/7726505.html)

## 安装 Nginx

```shell
Nginx的软件包在Ubuntu默认软件仓库中可用。 安装非常简单，只需键入以下命令：

sudo apt update
sudo apt install nginx

安装完成后，请检查Nginx服务的状态和版本：
sudo systemctl status nginx

sudo nginx -v
配置防火墙
如果您正在运行防火墙，则还需要打开端口80和443。
sudo ufw allow 'Nginx Full'

防火墙规则已更新 验证更改：
sudo ufw status

重启nginx
sudo /etc/init.d/nginx restart
/etc/init.d/nginx restart
systemctl restart nginx.service
sudo systemctl enable nginx
查询nginx进程
ps -ef | grep nginx
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

## 安装 PHP 和配置 Nginx 使用 PHP 处理器

```shell
sudo apt install php-fpm php-mysql
```

## Nginx 配置新项目加域名 Nginx 常用命令

```shell
复制配置文件
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/要创建的文件名
root /var/www/html;
server_name www.aaa.com;

// 创建链接
sudo ln -s /etc/nginx/sites-available/上面配置的文件名 /etc/nginx/sites-enabled/上面配置的文件名
检查没有问题
nginx -t

---------------------
listen —— 网站监听端口，这里设置为80，即浏览器默认的HTTP端口号。
root —— 网站根目录。
index —— 默认访问页。
server_name —— 网站访问域名，若是其他域名访问时，则不会响应，这里设置为localhost用于本地调试。
location / —— 该区块有一个try_files命令，当客户端请求找不到对应文件时，将会返回404页面。
location ~\.php$ —— 该区块匹配.php后缀的文件并传给php-fpm进行处理。
location ~ /\.ht —— 该区块禁止.htaccess的访问。
---------------------
sudo service nginx start #启动
sudo service nginx stop #停止
sudo service nginx restart #重新启动
sudo service nginx reload #重新加载配置

sudo nginx -t #检查Nginx配置是否正确
sudo nginx -s start #启动
sudo nginx -s stop #停止
sudo nginx -s restart #重新启动
sudo nginx -s reload #重新加载配置
启动：sudo nginx
重启：sudo service nginx reload
关闭：sudo nginx -s stop
查看版本：sudo nginx -v
检查配置文件：sudo nginx -t
---------------------

```
