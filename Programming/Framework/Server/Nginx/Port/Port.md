# Port

## 修改默认端口

- [Nginx 端口的修改 - 飞龙在天 001 - 博客园](https://www.cnblogs.com/geekdc/p/5605845.html)
- [更改 nginx 默认端口，ubuntu 更改 nginx 端口号 - w20101310 的专栏 - CSDN 博客](https://blog.csdn.net/w20101310/article/details/78835668)

## 更改 nginx 默认端口，ubuntu 更改 nginx 端口号 本人使用 nginx 版本为 nginx/1.15.5 (Ubuntu)，不同版本和系统配置文件可能略有差异

```shell
root@skyspace:~# nginx -V
nginx version: nginx/1.15.5 (Ubuntu)
built with OpenSSL 1.1.1  11 Sep 2018
TLS SNI support enabled
```

- nginx 配置文件在/etc/nginx 目录下的 nginx.conf。在 nginx.conf->http 选项末尾有引入两个目录下的文件分别为：

```c#
http {
        #   省略部分内容
        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
```

- 我们查看/etc/nginx/sites-enabled/目录，会找到一个 default 文件，在 server 选项下前两行就可以找到使用的 80 端口号：

```shell
server {
        listen 80 default_server;
        listen [::]:80 default_server;
```

- 将 80 端口号改为想使用的端口号，保存文件，如果没有启动 nginx，启动即可。如果 nginx 已经在运行，重新加载即可。

```shell
sudo nginx start #运行nginx
sudo nginx -s reload #重启nginx
```

- 如果遇到 nginx 报以下错误：

```shell
nginx: [error] open() "/run/nginx.pid" failed (2: No such file or directory)
```

- sudo nginx -c path/.conf #指定 nginx 配置.conf 的位置
- 查看 nginx 运行端口

```shell
sudo netstat -anp | grep nginx
```
