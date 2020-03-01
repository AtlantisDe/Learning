# curl

- [curl - Documentation Overview](https://curl.haxx.se/docs/)
- [Getting Title at 55:46](http://www.compciv.org/recipes/cli/downloading-with-curl/)

## 安装

```shell
sudo apt-get update && apt-get -y upgrade
sudo apt-get install curl
```

## curl 查看版本

```shell
curl -V
```

````text
curl 7.61.0 (x86_64-pc-linux-gnu) libcurl/7.61.0 OpenSSL/1.1.1 zlib/1.2.11 libidn2/2.0.5 libpsl/0.20.2 (+libidn2/2.0.4) nghttp2/1.32.1 librtmp/2.3
Release-Date: 2018-07-11
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp smb smbs smtp smtps telnet tftp
Features: AsynchDNS IDN IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP HTTP2 UnixSockets HTTPS-proxy PSL```
````

## 用法示例

```shell
curl http://some.url --output some.file
curl http://example.com --output my.file --silent
curl --header "X-MyHeader: 123" www.google.com
curl -i -X HEAD "www.baidu.com"
curl -v --connect-timeout 5 https://www.baidu.com
curl -v --connect-timeout 15 www.baidu.com

curl --interface zz.zz.zz.zz http://example.com/
curl --silent -H "Host: www.baidu.com" "192.168.0.1/xxx/xxx/db.error.log"

curl -I -m 10 -o /dev/null -s -w %{http_code}"＼n"  http://localhost:3000
curl -X POST https://dnsapi.cn/Domainshare.Modify -d 'login_token=LOGIN_TOKEN&format=json&domain_id=2059079&email=yizerowu@dnspod.com&mode=r'
```

## 使用 Cookie

- [linux 使用 curl 命令访问 url 并模拟 cookie - 为程序员服务](http://ju.outofmemory.cn/entry/340201)

```c#
// 可以使用-b参数来完成，具体使用如下：
curl – b “key1=val1;key2=val2;”
// 或直接使用文件
curl -b ./cookie.txt

```

## curl 命令使用代理、以及代理种类介绍

- [Linux curl 命令使用代理、以及代理种类介绍（转） - THISISPAN - 博客园](https://www.cnblogs.com/panxuejun/p/10574038.html)

### 1. linux curl 命令设置 http 代理

```shell
curl -x 127.0.0.1:1234 http://127.0.0.1/

curl -x 127.0.0.1:1234 http://www.baidu.com/

curl -x 127.0.0.1:1234 http://pv.sohu.com/cityjson?ie=utf-8

# 指定http代理IP和端口
curl -x 113.185.19.192:80 http://aiezu.com/test.php
curl --proxy 113.185.19.192:80 http://aiezu.com/test.php

#指定为http代理
curl -x http_proxy://113.185.19.192:80 http://aiezu.com/test.php

#指定为https代理
curl -x HTTPS_PROXY://113.185.19.192:80 http://aiezu.com/test.php

#指定代理用户名和密码，basic认证方式
curl -x aiezu:123456@113.185.19.192:80 http://aiezu.com/test.php
curl -x 113.185.19.192:80 -U aiezu:123456 http://aiezu.com/test.php
curl -x 113.185.19.192:80 --proxy-user aiezu:123456 http://aiezu.com/test.php

#指定代理用户名和密码，ntlm认证方式
curl -x 113.185.19.192:80 -U aiezu:123456 --proxy-ntlm http://aiezu.com/test.php

#指定代理协议、用户名和密码，basic认证方式
curl -x http_proxy://aiezu:123456@113.185.19.192:80 http://aiezu.com/test.php
```

### 2. Linux curl 命令设置 socks 代理

```shell
#使用socks4代理，无需认证方式
curl --socks4 122.192.32.76:7280 http://aiezu.com/test.php
curl -x socks4://122.192.32.76:7280 http://aiezu.com/test.php

#使用socks4a代理，无需认证方式
curl --socks4a 122.192.32.76:7280 http://aiezu.com/test.php
curl -x socks4a://122.192.32.76:7280 http://aiezu.com/test.php

#使用socks5代理，basic认证方式
curl --socks5 122.192.32.76:7280 -U aiezu:123456 http://aiezu.com/test.php
curl -x socks5://aiezu:123456@122.192.32.76:7280 http://aiezu.com/test.php

#使用socks5代理，basic认证方式，ntlm认证方式
curl -x socks5://aiezu:123456@122.192.32.76:7280 --proxy-ntlm http://aiezu.com/test.php
```

### 3. curl HTTP Header

- [curl HTTP Header - 苏轶然 - 博客园](https://www.cnblogs.com/suanec/p/8108953.html)
- [curl 模拟 HEAD、GET、OPTIONS 等请求方法\_网络\_u013571833 的专栏-CSDN 博客](https://blog.csdn.net/u013571833/article/details/52514471)

```shell
# Example:
curl --header "X-MyHeader: 123" www.google.com
```
