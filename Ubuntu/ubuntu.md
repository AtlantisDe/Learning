# Ubuntu 文章

- [Linux/Ubuntu](https://www.cnblogs.com/bycnboy/p/10591620.html)
- [如何在 Ubuntu 18.04 上安装 Nginx](https://www.linuxidc.com/Linux/2018-05/152257.htm)
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
- [linux 查看端口使用情况](https://blog.csdn.net/zwhfyy/article/details/3971523)
- [ubuntu 部分端口命令的使用----开启端口/开启防火墙](http://www.cnblogs.com/zqunor/p/6417938.html)
- [linux 中 sftp 默认登录的端口号是多少? sftp 通过指定的端口号连接?sftp 默认端口号](https://www.cnblogs.com/chuanzhang053/p/8875759.html)
- [Gitlab 使用自签名证书开启 Https](https://www.jianshu.com/p/4111534b339f)
- [nginx 配置 ssl 证书实现 https 访问](https://www.cnblogs.com/tianhei/p/7726505.html)
- [Ubuntu 修改密码和用户名](https://blog.csdn.net/qq_28959531/article/details/78989635)
- [Ubuntu “Failed to fetch”错误的解决方法 404](https://blog.csdn.net/xueer767/article/details/72864777)
- [快速掌握Nginx(二) —— Nginx的Location和Rewrite](https://www.cnblogs.com/wyy1234/p/10632108.html)

## Ubuntu

```shell
cat /proc/version
uname -a
lsb_release -a
sudo apt-get update
sudo apt update
```

## DNS

```shell
sudo vim /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
```

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

## 安装 PHP 和配置 Nginx 使用 PHP 处理器

```shell
sudo apt install php-fpm php-mysql
```

## Gitlab 安装

- [清华大学开源软件镜像站 Gitlab Community Edition 镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/gitlab-ce/)
- [官方安装教程](https://about.gitlab.com/install/#ubuntu)
- [阿里云 GitLab 的安装及使用](https://blog.csdn.net/anaitudou/article/details/80388161)
- [在 Ubuntu18.04 安装 gitlab 国内镜像加速](http://ccimage.cn/2018-05/ubuntu18-04-install-gitlab-chinese-mirror.html#comment-115)
- [ubuntu18.04 下安装 gitlab](https://blog.csdn.net/u012838045/article/details/80881243)

```shell
官方文档里的ee改成ce。收费版和免费版的区别。gitlab-ee属于企业版

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix

# 首先信任 GitLab 的 GPG 公钥:
curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null

# 添加GitLab软件包存储库(下载安装脚本)
# curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

# 修改安装脚本
# vim /etc/apt/sources.list.d/gitlab_gitlab-ee.list
vim /etc/apt/sources.list.d/gitlab_gitlab-ce.list

# 把原来的两行删除或者注释（#是行注释），然后增加
# ee版本镜像
deb https://XX bionic main
deb-src https://mirrors.XX bionic main
# ce版本镜像
# deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu bionic main
# deb-src https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu bionic main

deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu trusty main
deb-src https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu trusty main

# 再次执行
sudo apt-get update

# 执行安装脚本
# sudo EXTERNAL_URL="http://aaa.com" apt-get install gitlab-ee
sudo EXTERNAL_URL="http://aaa.com" apt-get install gitlab-ce

# 常用命令:
cat /opt/gitlab/embedded/service/gitlab-rails/VERSION
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

## 修改 hosts 后,使 hosts 文件修改生效: (Ubuntu 18 后好像直接生效)

```shell
sudo /etc/init.d/dns-clean start
sudo /etc/init.d/networking restart
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
sudo ufw allow 'Nginx Full'
```

## 用户信息操作

```shell
sudo passwd user(user 是对应的用户名)
sudo passwd root
```

## SSH

- [OpenSSH](http://www.openssh.com/)
- [OpenSSH 在 Windows 10 默认安装了](http://baijiahao.baidu.com/s?id=1600980660647409471&wfr=spider&for=pc)

```shell
ssh 用户名@IP地址 -p 端口号
ssh root@127.0.0.1 -p 22
ssh root@127.0.0.1
```
