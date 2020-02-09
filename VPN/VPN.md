# VPN

- [VPN 和代理的区别 - liu537192 的专栏 - CSDN 博客](https://blog.csdn.net/liu537192/article/details/38495789)
- [七款适用于企业的开源 VPN 工具 - 小叶樟 - CSDN 博客](https://blog.csdn.net/xinfei1969/article/details/81117345)
- [window server2008 开启 VPN 服务器 - xiaoxuetu\_的博客 - CSDN 博客](https://blog.csdn.net/xiaoxuetu_/article/details/74783548)

## Buy VPN

- [无日志的 VPN 服务提供商](https://whoer.net/zh/vpn)

## SoftEther VPN

- [SoftEther VPN Project - SoftEther VPN Project](https://www.softether.org/)
- [Download - SoftEther VPN Project](https://www.softether.org/5-download)
- [SoftEtherVPN/SoftEtherVPN](https://github.com/SoftEtherVPN/SoftEtherVPN/)
- [【OM】SoftEtherVPN 搭建教程(3) - Ubisoft-One kid's Dream - CSDN 博客](https://blog.csdn.net/SugaryoTT/article/details/70990728)

```shell
# Linux，Windows，MacOS等

# SoftEther(软件以太网的缩写)VPN是迄今为止市场上最强大和用户友好的多协议VPN软件之一。作为OpenVPN的理想替代品，SoftEther VPN为OpenVPN服务器提供了克隆功能，允许您无缝地从OpenVPN迁移到SoftEther VPN。 SoftEther令人印象深刻的安全标准和功能被认为可以与NordVPN等市场领先企业相媲美，使其成为开源巨头之一。

# SoftEther还兼容L2TP和IPsec协议，支持用户定制。此外，SoftEther VPN还被证明比OpenVPN更快，拥有更好的浏览体验。SoftEther的主要缺点是它在兼容性方面落后于其他方案。然而，这个问题的主要原因是SoftEther协议的相对新颖性，并且随着时间的推移，您可能会看到越来越多的平台支持SoftEther。
```

## shadowsocks

- [网,goldapple, - Powered by Sablog-X](http://www.goldapple.name/blog/?action=show&id=1583)

## libQtShadowsocks

- [shadowsocks/libQtShadowsocks](https://github.com/shadowsocks/libQtShadowsocks/)
- [librehat/shadowsocks Copr](https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/)

```c#
windows版安装 :
https://github.com/shadowsocks/libQtShadowsocks/releases
下载出exe程序，在当前目录新建文件 config.json，写入下面代码

{
    "server":"127.0.0.1",
    "server_port":59989,
    "local_address":"127.0.0.1",
    "local_port":59989,
    "password":"59989!",
    "timeout":600,
    "method":"aes-256-cfb"
}

启动命令：
shadowsocks-libqss.exe -c config.json -S


ss://YWVzLTI1Ni1@127.0.0.1:9899

```

## outline-client

- [Jigsaw-Code/outline-client](https://github.com/Jigsaw-Code/outline-client)
- [https://github.com/Jigsaw-Code/outline-client/releases/download/daily-2020-01-04/app-armv7-debug.apk](https://github.com/Jigsaw-Code/outline-client/releases/download/daily-2020-01-04/app-armv7-debug.apk)
