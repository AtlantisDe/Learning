# curl

- [curl - Documentation Overview](https://curl.haxx.se/docs/)
- [Getting Title at 55:46](http://www.compciv.org/recipes/cli/downloading-with-curl/)

## 0. 安装

```shell
sudo apt-get update && apt-get -y upgrade
sudo apt-get install curl
```

## 1. curl 查看版本

```shell
curl -V
```

````c#
curl 7.61.0 (x86_64-pc-linux-gnu) libcurl/7.61.0 OpenSSL/1.1.1 zlib/1.2.11 libidn2/2.0.5 libpsl/0.20.2 (+libidn2/2.0.4) nghttp2/1.32.1 librtmp/2.3
Release-Date: 2018-07-11
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp smb smbs smtp smtps telnet tftp
Features: AsynchDNS IDN IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP HTTP2 UnixSockets HTTPS-proxy PSL```
````

## 3. curl 取得 HTTP 返回的状态码

- [curl 返回的状态码解析 运维 LinuxBegin](https://blog.csdn.net/qq_34870631/article/details/82998062)

```c#
-I 仅测试HTTP头
-m 10 最多查询10s
-o /dev/null 屏蔽原有输出信息
-s silent 模式，不输出任何东西
-w %{http_code} 控制额外输出

curl -o /dev/null -s -w "%{http_code}\n" baidu.com
curl -o /dev/null -s -w "%{http_code}" baidu.com

curl -o /dev/null -s -w "%{http_code}\n" "http://api.share.baidu.com/s.gif?l=http://localhost:1001/baidu.push.1.html" -H "Connection: keep-alive" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36" -H "Accept: image/webp,image/apng,image/*,*/*;q=0.8" -H "Referer: http://localhost:1001/baidu.push.1.html" -H "Accept-Language: zh-CN,zh;q=0.9"
```

## 4. 用法示例

```shell

# Copy as cURL (bash)  注意 不是 Copy all as cURL (bash)   不带all的那个选项



curl http://some.url --output some.file
curl http://example.com --output my.file --silent
curl --header "X-MyHeader: 123" www.google.com
curl -i -X HEAD "www.baidu.com"
curl -v --connect-timeout 5 https://www.baidu.com
curl -v --connect-timeout 15 www.baidu.com

curl --interface zz.zz.zz.zz http://example.com/
curl --interface 192.168.1.106 http://www.baidu.com/
curl --silent -H "Host: www.baidu.com" "192.168.0.1/xxx/xxx/db.error.log"

curl --silent -H "Host: www.google.com" "http://172.217.0.36/"

curl -I -m 10 -o /dev/null -s -w %{http_code}"＼n"  http://localhost:3000
curl -X POST https://dnsapi.cn/Domainshare.Modify -d 'login_token=LOGIN_TOKEN&format=json&domain_id=2059079&email=yizerowu@dnspod.com&mode=r'

curl --socks5 122.192.32.76:7280 -U aiezu:123456 http://aiezu.com/test.php
curl -x socks5://aiezu:123456@122.192.32.76:7280 http://aiezu.com/test.php

```

## 5. 使用 Cookie

- [linux 使用 curl 命令访问 url 并模拟 cookie - 为程序员服务](http://ju.outofmemory.cn/entry/340201)

```c#
// 可以使用-b参数来完成，具体使用如下：
curl – b “key1=val1;key2=val2;”
// 或直接使用文件
curl -b ./cookie.txt

```

## 6. curl 命令使用代理、以及代理种类介绍

- [Linux curl 命令使用代理、以及代理种类介绍（转） - THISISPAN - 博客园](https://www.cnblogs.com/panxuejun/p/10574038.html)
- [Linux curl 命令使用代理、以及代理种类介绍 - 爱 E 族](https://aiezu.com/article/linux_curl_proxy_http_socks.html)

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

- [How to Use Socks5 Proxy in Curl](https://blog.emacsos.com/use-socks5-proxy-in-curl.html)

```shell
# in curl >= 7.21.7, you can use

curl -x socks5h://localhost:8001 http://www.google.com/

# In curl >= 7.18.0, you can use

curl --socks5-hostname localhost:8001 http://www.google.com/

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
- [curl 模拟 HEAD、GET、OPTIONS 等请求方法 网络 u013571833 的专栏-CSDN 博客](https://blog.csdn.net/u013571833/article/details/52514471)

```shell
# Example:
curl --header "X-MyHeader: 123" www.google.com
```

## 7. Demo 代码

### 1. 模拟抓取

```c#
// 模拟宜搜蜘蛛抓取：

curl -I -A 'YisouSpider' example.com

// 模拟UA为空的抓取：

curl -I -A '' example.com

// 模拟百度蜘蛛的抓取：

curl -I -A 'Baiduspider' example.com
```

## 8. CURL POST

```c#
curl -X POST "http://localhost:9003/api/AppConfigs" -H "Connection: keep-alive" -H "Pragma: no-cache" -H "Cache-Control: no-cache" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36" -H "Sec-Fetch-Dest: document" -H "Accept: application/json" -H "Sec-Fetch-Site: none" -H "Sec-Fetch-Mode: navigate" -H "Sec-Fetch-User: ?1" -H "Accept-Language: zh-CN,zh;q=0.9" -H "Cookie: 888" --compressed
```
