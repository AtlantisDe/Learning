# Caddy

- Fast, cross-platform HTTP/2 web server with automatic HTTPS
- 具有自动 HTTPS 的快速，跨平台的 HTTP / 2 Web 服务器
- Caddy 可以提供各种网站技术，它也可以作为反向代理和负载均衡器。Caddy 的大部分功能都实现为中间件，并通过 Caddyfile 中的指令（用于配置 Caddy 的文本文件）进行控制。
- caddy 是一个像 Apache, nginx, 或 lighttpd 的 web 服务器。

## 简介

```c#
Caddy服务器（或者Caddy Web）是一个开源的使用 GoLang 编写，支持 HTTP/2 的 Web 服务端。它使用 GoLang 标准库提供 HTTP 功能， Caddy 一个显著的特性是默认启用 HTTPS，它是第一个无需额外配置即可提供 HTTPS 特性的 Web 服务器。

Caddy和我们常用的Nginx、Apache等Web服务器相比，最大的特点就是部署简单，它拥有基本的apache或者nginx有的web server模块，同时还有一些很有特色的功能，比如: HTTP/2、Automatic HTTPS、Multi-core、Websockets、Markdown、IPv6等等。

Caddy可以用于静态和动态网站，当然不少人看到了Caddy易于安装部署的特点，将Caddy与网盘、下载等各类应用整合，这样既发挥了Caddy部署配置简单的优势，同时又可以最大限度地节省服务器资源，专注于第三方应用的开发管理。
```

## 常用命令

```shell
caddy -host example.com
caddy -host example.com
systemctl status caddy.service
caddy -conf /etc/caddy/Caddyfile

```

## 自动签发 HTTPS

```c#
自动签发 HTTPS
Caddy 默认通过检查域名来启用 HTTPS (通过 ACME protocol 检查域名并签发证书)， 并且重定向 HTTP 请求到 HTTPS。[18] 它在启动期间根据需要签发证书，并在服务器的使用期间自动重签发。 Let's Encrypt 是默认的证书颁发机构，但用户可以自定义所使用的 ACME CA，这在测试配置时是必要的。在 2016 年第一季度， 有百分之二的 Let's Encrypt 证书是由 Caddy 签发的。

一个可选的配置允许 Caddy 在需要时签发一个证书 "按需 TLS"[19] 使用这种方案时，用户必须指定可通过该方案配置的证书数量。 当 Caddy 收到一个没有配置证书的请求时， 它会自动通过 ACME 签发并配置， 然后将证书存储于内存和硬盘。 这个过程通常需要几秒钟的时间，并且受到限制。

当使用 TLS， Caddy 会自动切换会话密钥以保证安全性。
```

## official

- [Caddy - The HTTP/2 Web Server with Automatic HTTPS](https://caddyserver.com/)

## GitHub

- [mholt/caddy](https://github.com/mholt/caddy)
- [Caddy](https://github.com/caddyserver)
- [caddyserver/examples](https://github.com/caddyserver/examples)

## releases

- [Releases · mholt/caddy](https://github.com/mholt/caddy/releases)

## community

- [Caddy Community](https://caddy.community/)

## 百科

- [Caddy 最容易上手的 Web Server](http://www.360doc.com/content/18/0220/01/30005062_730898248.shtml)

## Caddy 中文文档

- [Caddy 中文文档 - Caddy 中文文档](https://dengxiaolong.com/caddy/zh/)
- [Caddy User Guide](https://caddyserver.com/docs)

## Ubuntu 上安装

- [Ubuntu 中安装和配置 Caddy 服务丶一个站在 Java 后端设计之路的男青年个人博客网站](https://www.liangzl.com/get-article-detail-21007.html)
- [如何在 Ubuntu 16.04 上托管与 Caddy 的网站](https://www.howtoing.com/how-to-host-a-website-with-caddy-on-ubuntu-16-04/)

- [How to Install & Configure the Caddy web server on an Ubuntu 18.04 VPS](https://hostadvice.com/how-to/how-to-install-configure-the-caddy-web-server-on-an-ubuntu-18-04-vps/)
- [一个极简的 HTTP Server： Caddy 一键安装脚本，带网站配置教程 - Rat's Blog](https://www.moerats.com/archives/404/)
- SSH to VPS server

```shell
ssh user@vps_IP
```

- Update packages

```shell
sudo apt-get update && apt-get -y upgrade
sudo apt-get install curl
```

- Install Caddy web server
- Then to install the caddy web server run the following command;
- 推荐使用一键安装脚本

```shell
curl https://getcaddy.com | bash -s personal
```

- You can also install caddy with some additional features, use the –s switch with a comma

```shell
curl https://getcaddy.com | bash -s realip,expires,upload
```

- Then we can now add
- cap_net_bind_servicecapability for caddy to bind to ports less than 1024

```shell
sudo setcap cap_net_bind_service=+ep /usr/local/bin/caddy
sudo setcap cap_net_bind_service=+ep /usr/local/bin/caddy

```

## Configure Caddy

- We now have to set up the directories that will be used to store the caddy configuration files and SSL certificates. Therefore, run the following commands.
- 我们现在必须设置将用于存储球童配置文件和 SSL 证书的目录。因此，请运行以下命令。

```shell
sudo mkdir /etc/caddy
sudo chown -R root:www-data /etc/caddy
sudo mkdir /etc/ssl/caddy
sudo chown -R www-data:root /etc/ssl/caddy
sudo chmod 0770 /etc/ssl/caddy
sudo touch /etc/caddy/Caddyfile
sudo mkdir /var/www
sudo chown www-data: /var/www
```

- After that, we need to create a systemD configuration script, therefore, run the following;
- caddy.service 配置文件也可以用其它方式编辑

```shell
sudo nano /lib/systemd/system/caddy.service
```

- caddy service file 内容这里我放 Configure Caddy 文件夹里面

- Save the file by pressing control key + X then overwriting the original caddy file. Then, to enable caddy to run on boot, execute the following commands;

```shell
sudo systemctl enable caddy.service
```

```shell
# 执行结果如下提示
# Created symlink /etc/systemd/system/multi-user.target.wants/caddy.service → /lib/systemd/system/caddy.service.
```

## Testing the installation

- 最后测试安装,这里简单写个 index.html

```shell
sudo mkdir -p /var/www/my-domain.com
sudo echo "Caddy" > /var/www/my-domain.com/index.html
sudo chown -R www-data: /var/www/my-domain.com
```

- Then to add our domain to the caddy file, type the following;
- 然后添加个访问域名

```shell
sudo nano /etc/caddy/Caddyfile
```

- 如果需要在一个 Caddyfile 配置多个站点，你必须将每个站点的配置通过花括号区分开来：

```shell
my-domain.com {
    root /var/www/ ateamagencies.000webhostapp.com
}
```

- Then save the file, close the editor and restart caddy.

```shell
sudo systemctl restart caddy.service
systemctl status caddy.service
journalctl -xef -u caddy.service
journalctl --boot -u caddy.service

```

- Now, using your browser, go to the <https://ateamagencies.000webhostapp.com> the test page we just created.

- If caddy doesn't seem to start properly you can view the log data to help figure out what the problem is:

```shell
journalctl --boot -u caddy.service
```

- If you want to follow the latest logs from caddy you can do so like this:

```shell
journalctl -f -u caddy.service
```

- You can make other certificates and private key files accessible to the www-data user with the following command:

```shell
setfacl -m user:www-data:r-- /etc/ssl/private/my.key
```

## linux-systemd

- [mholt/caddy/linux-systemd](https://github.com/mholt/caddy/tree/master/dist/init/linux-systemd)

## 查看状态

```shell
caddy
# Activating privacy features... done.

# Serving HTTP on port 2015
# http://:2015

# root@skyspace:~# sudo systemctl restart caddy.service
# Job for caddy.service failed because the control process exited with error code.
# See "systemctl status caddy.service" and "journalctl -xe" for details.
# root@skyspace:~#
```

## 运行调试 404 页面

- [测试](http://localhost:2015/)
- 在浏览器打开<http://localhost:2015/>，如果出现 404 页面，说明 caddy 运行正常，但是网站缺少默认页面。

-你可以使用 Ctrl+C 退出，caddy 将尽可能优雅中断。

## 报错修复 ulimit -n 8192

```shell
ulimit -n 8192
```

## 其它安装教程

- [如何在 Ubuntu 16.04 上托管与 Caddy 的网站](https://www.howtoing.com/how-to-host-a-website-with-caddy-on-ubuntu-16-04/)
- [Ubuntu 中安装和配置 Caddy 服务丶一个站在 Java 后端设计之路的男青年个人博客网站](https://www.liangzl.com/get-article-detail-21007.html)

## Create the home directory for the server and give it appropriate ownership and permissions

```shell
sudo mkdir /var/www
sudo chown www-data:www-data /var/www
sudo chmod 555 /var/www

sudo mkdir /var/www/sites
sudo chown www-data:www-data /var/www/sites
sudo chmod 555 /var/www/sites
```

## Let's assume you have the contents of your website in a directory called 'example.com'. Put your website into place for it to be served by caddy

```shell
sudo cp -R example.com /var/www/
sudo chown -R www-data:www-data /var/www/example.com
sudo chmod -R 555 /var/www/example.com
```

## 自动 HTTPS

- 如果你满足这些条件，你用 caddy 启动的应用将自动获得 HTTPS，不用你买证书了，这都是 Let’s Encrypt 的功劳。

```shell
# host 那里要填一个域名，不能是 localhost 或 IP
# 不要用冒号手动指定端口
# 不要在域名前手动声明http
# 没在配置里关掉TLS 或者声明用自己的证书但是还没配好
# caddy 有权限绑定 80 和 443 端口
# 前边都能懂，说下最后一条。在init文件夹的启动配置教程里都有，一般建议你用www-data用户启动服务， 你不是root但是Linux依然可以让你绑定80端口，只需要执行setcap cap_net_bind_service=+ep caddy 。 具体看文档吧。
```

- 反之，如果你还没有域名，你可以先使用“localhost”作为替代。

```shell
caddy -host example.com
caddy -host localhost
```

## caddy server 几个常用插件

```c#
1.log日志

log /var/www/log/example.log
2.目录访问

browse
3.gzip压缩

gzip
4.自主ssl证书

tls /path/ssl/example.com.crt /path/ssl/example.com.key
5.git拉取功能(3600秒为间隔时间)

git https://github.com/user/project.git /var/www/html/git/ {
  interval 3600
}
6.访问口令认证（用户emiria，密码abc123）

basicauth / emiria abc123
7.cors跨域(下载时记得勾上)

cors / {
    origin            https://alleysakura.com
    origin            http://alleysakura.pw https://alleysakura.pw
    methods           POST,PUT
    allow_credentials false
    max_age           3600
    allowed_headers   X-Custom-Header,X-Foobar
    exposed_headers   X-Something-Special,SomethingElse
}
8.IP屏蔽(下载时记得勾上)

ipfilter / {
    rule       block
    ip         212.10.15.0-255 202.10.15.0-10 59.43.247.103
    blockpage  /var/www/html/403.html
}
9.跳转功能(目录重写功能也类似)

redir http://example.com{url}
而且不像nginx进行www重定向那么麻烦，把域名原域名（不限协议）写上，大括号里加上这个就可以，简直太赞了

10.自定义错误页面

errors {
    404 404.html
    500 /var/www/html/500.html
}
3:传统php+mysql建站
包管理器安装mysql+php，然后添加

fastcgi / 127.0.0.1:9000 php
4:caddy特色markdown建站
具体官方wiki上有示例，功能非常强大

5:反向代理引入更多后端系统
引入反向代理，只需一行

proxy / localhost:4000
负载均衡也是类似配置的23333

proxy / 10.10.201.222:80 10.10.201.221:80 {
        policy round_robin
    }
```
