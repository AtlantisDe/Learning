
# Ubuntu文章

* [Linux/Ubuntu](https://www.cnblogs.com/bycnboy/p/10591620.html)
* [如何在Ubuntu 18.04上安装Nginx](https://www.linuxidc.com/Linux/2018-05/152257.htm)
* [linux安装gitlab并修改gitlab默认端口号](https://blog.csdn.net/wangyy130/article/details/85633303)
* [linux nginx配置新项目加域名](https://www.cnblogs.com/wesky/p/6419901.html)
* [nginx下部署网站站点](https://blog.csdn.net/github_39088222/article/details/82020835)
* [Ubuntu下Nginx启动、停止等常用命令](https://www.cnblogs.com/fireicesion/p/8457898.html)
* [nginx提示Job for nginx.service failed because the control的问题](https://www.cnblogs.com/skura23/p/7086447.html)
* [如何在Ubuntu18.04上安装Linux、Nginx、MySQL和PHP（LEMP stack）](https://blog.csdn.net/wudics/article/details/84073350)
* [MySQL官网](https://www.mysql.com/)
* [mysql 如何退出](https://www.cnblogs.com/harrytc/p/6725778.html)
* [开启MySQL远程访问权限 允许远程连接](https://www.cnblogs.com/weifeng1463/p/7941625.html)
* [Ubuntu安装mysql及设置远程访问方法](https://www.cnblogs.com/ruofengzhishang/p/5477502.html)
* [Ubuntu设置MySQL允许远程访问](https://www.cnblogs.com/wzwyc/p/10121409.html)
* [Gitlab 服务器url修改后，项目path的修改](https://blog.csdn.net/u013377887/article/details/73717729)
* [gitlab启用https](https://www.cnblogs.com/xieshuang/p/8488458.html)
* [gitlab开启https加密 and 全站https](https://blog.51cto.com/53cto/1775865)
* [NGINX setting 官方](https://docs.gitlab.com/omnibus/settings/nginx.html#manually-configuring-https)
* [linux 查看端口使用情况](https://blog.csdn.net/zwhfyy/article/details/3971523)
* [ubuntu部分端口命令的使用----开启端口/开启防火墙](http://www.cnblogs.com/zqunor/p/6417938.html)
* [linux中sftp默认登录的端口号是多少? sftp通过指定的端口号连接?sftp默认端口号](https://www.cnblogs.com/chuanzhang053/p/8875759.html)
* [Gitlab 使用自签名证书开启Https](https://www.jianshu.com/p/4111534b339f)
* [nginx配置ssl证书实现https访问](https://www.cnblogs.com/tianhei/p/7726505.html)

## 安装Nginx

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

## 安装Mysql

```shell
sudo apt install mysql-server-5.7

mysql退出三种方法：
mysql > exit;
mysql > quit;
mysql > \q;
sudo service mysql restart 启数据库
通过该条命令使用MySQL自带的客户端连接数据库服务器，然后输入以下命令查看root的登陆验证方式。
SELECT user,authentication_string,plugin,host FROM mysql.user;

可以看到，root账号使用的auto_socket登陆验证方式，需要将它改为mysql_native_password方式。
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root密码';

执行该条命令更新下配置，输入以下命令，再次查看root账号的登陆验证方式。
FLUSH PRIVILEGES;

再次查看 OK
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

```sql
# 注释bind-address = 127.0.0.1 Ubuntu设置MySQL允许远程访问
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
# bind-address= 127.0.0.1
```

```shell
实现远程连接（改表法）
UPDATE `user` SET `Host` = '%' WHERE `user`.`Host` = 'localhost' AND `user`.`User` = 'root'
```

## 安装PHP和配置Nginx使用PHP处理器

```shell
sudo apt install php-fpm php-mysql
```

## Gitlab 默认端口修改

```shell
修改 /etc/gitlab/gitlab.rb 文件如下，然后执行重新配置，重启命令后完成

nginx['listen_port'] = 9091
unicorn['port'] = 9092

gitlab-ctl reconfigure  //让配置生效，重新执行此命令时间也比较长
gitlab-ctl restart

reboot

Gitlab 服务器url修改后，项目path的修改

cd /opt/gitlab/embedded/service/gitlab-rails/config  
修改 gitlab.yml
host: www.aaa.com
    port: 9091
    https: true

gitlab启用https ;修改配置文件  生成秘钥与证书 参考上面文章链接
./ssl_genKey.sh
openssl req -nodes -newkey rsa:2048 -keyout gitlab.domain.com.key -out gitlab.domain.com.csr


```

## 修改 hosts 后,使 hosts 文件修改生效: (Ubuntu 18后好像直接生效)

```shell
sudo /etc/init.d/dns-clean start
sudo /etc/init.d/networking restart
```

## Nginx配置新项目加域名 Nginx常用命令

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

## 防火墙配置常用

```shell
开启防火墙  ufw enable
关闭防火墙  ufw disable
防火墙开启(ubuntu下执行)    sudo ufw enable
防火墙重启(ubuntu下执行)    sudo ufw reload
查看本地的端口开启情况(ubuntu下执行)    sudo ufw status

打开80端口(ubuntu下执行)
sudo ufw allow https
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw allow 21
```