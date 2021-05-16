# DNS

- [IP.cn - 全国 DNS 服务器 IP 地址汇总 | 公共 DNS 服务器 | DNS 地址](https://www.ip.cn/dns.html)
- [DNS Checker - DNS Check Propagation Tool](https://dnschecker.org/)
- [DNS 测试 网站速度测试 17CE](https://www.17ce.com/site/dns.html)
- [全国公众 DNS 服务器大全](http://dns.lisect.com/)
- [Public DNS Server List](https://public-dns.info/)
- [DNS servers in Hong Kong](https://public-dns.info/nameserver/hk.html)
- [汇总安全、快速稳定的公共 DNS](https://zhuanlan.zhihu.com/p/55240680)

## 0. 常用

- [本地 DNS 优化诊断--CloudXNS 运维工具箱*智能 DNS 运维工具箱*最好用的 DNS 检测工具 永久免费 222](http://tools.cloudxns.net/Index/Diag)

```c#
ipconfig /flushdns

控制面板\所有控制面板项\网络连接
直接输入:网络连接

netsh interface ip set address "WLAN" static 192.168.1.158 255.255.255.0 192.168.1.1
netsh interface ip set dns "WLAN" static 52.80.52.52
netsh interface ip add dns "WLAN" 117.50.10.10”

// Cloudflare DNS
1.1.1.1
// Google Public DNS IP addresses
// The Google Public DNS IP addresses (IPv4) are as follows:
8.8.8.8
8.8.4.4
// The Google Public DNS IPv6 addresses are as follows:
2001:4860:4860::8888
2001:4860:4860::8844


// 国内
start ping 114.114.114.114 -t
start ping 223.5.5.5 -t
start ping 119.29.29.29 -t

// 国外
start ping 8.8.8.8 -t
start ping 8.8.4.4 -t
start ping 1.1.1.1 -t


// OneDNS
// 拦截版
start ping 117.50.11.11 -t
start ping 52.80.66.66 -t


// 纯净版
start ping 117.50.10.10 -t
start ping 52.80.52.52 -t

// 常用最优:
223.5.5.5
119.29.29.29

```

## 1. 网易 DNS 检测工具

- [网易 DNS 检测工具](http://nstool.netease.com/)
- [网易 DNS 检测工具](http://only-351617-117-172-38-221.nstool.yqkk.link/)
- [网易 DNS 检测工具](http://nstool.yqkk.link/)

## 2. TXT 记录检查

```c#
nslookup -qt=txt txt.baidu.com
```

## 3. DNS 诊断工具

- [DNS 查询](https://myssl.com/dns_check.html)
- [域名检测 - 腾讯云](https://domaintool.cloud.tencent.com/result?domain=google.com)

## 4. 清除 DNS 缓存

```c#
@echo off
::清除dns缓存
@echo 清除DNS缓存
ipconfig /flushdns
pause
```

## 5. QuickStart

- [DNS 污染\_百度百科](https://baike.baidu.com/item/DNS%E6%B1%A1%E6%9F%93/8620359?fr=aladdin)

```c#
1、使用各种SSH加密代理，在加密代理里进行远程DNS解析，或者使用VPN上网。
2、修改hosts文件，操作系统中Hosts文件的权限优先级高于DNS服务器，操作系统在访问某个域名时，会先检测HOSTS文件，然后再查询DNS服务器。可以在hosts添加受到污染的DNS地址来解决DNS污染和DNS劫持。
3、通过一些软件编程处理，可以直接忽略返回结果是虚假IP地址的数据包，直接解决DNS污染的问题。
4、如果你是Firefox only用户，并且只用Firefox，又懒得折腾，直接打开Firefox的远程DNS解析就行了。在地址栏中输入：
about:config
找到network.proxy.socks_remote_dns一项改成true。
5、使用DNSCrypt软件，此软件与使用的OpenDNS直接建立相对安全的TCP连接并加密请求数据，从而不会被污染。
```
