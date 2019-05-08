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
- [Gitlab 服务器 url 修改后，项目 path 的修改](https://blog.csdn.net/u013377887/article/details/73717729)
- [gitlab 启用 https](https://www.cnblogs.com/xieshuang/p/8488458.html)
- [gitlab 开启 https 加密 and 全站 https](https://blog.51cto.com/53cto/1775865)
- [NGINX setting 官方](https://docs.gitlab.com/omnibus/settings/nginx.html#manually-configuring-https)
- [nginx 配置 ssl 证书实现 https 访问](https://www.cnblogs.com/tianhei/p/7726505.html)

## 安装 Nginx

```shell
# Nginx的软件包在Ubuntu默认软件仓库中可用。 安装非常简单，只需键入以下命令：

sudo apt update
sudo apt install nginx

# 安装完成后，请检查Nginx服务的状态和版本：
sudo systemctl status nginx

sudo nginx -v
# 配置防火墙
# 如果您正在运行防火墙，则还需要打开端口80和443。
sudo ufw allow 'Nginx Full'

# 防火墙规则已更新 验证更改：
sudo ufw status

# 重启nginx
sudo /etc/init.d/nginx restart
/etc/init.d/nginx restart
systemctl restart nginx.service
sudo systemctl enable nginx
# 查询nginx进程
ps -ef | grep nginx
```

## 版本查询

```shell
root@skyspace:~# sudo nginx -v
nginx version: nginx/1.15.5 (Ubuntu)
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

## 停止

- [Nginx 的启动、停止与重启 - codingcloud - 博客园](https://www.cnblogs.com/codingcloud/p/5095066.html)
