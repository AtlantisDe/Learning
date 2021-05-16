# Socket5

- [Create a SOCKS proxy on a Linux server with SSH to bypass content filters](https://ma.ttias.be/socks-proxy-linux-ssh-bypass-content-filters/)
- [How to Set up SSH SOCKS Tunnel for Private Browsing](https://linuxize.com/post/how-to-setup-ssh-socks-tunnel-for-private-browsing/)
- [socket5 协议学习与实现(一)](https://www.mojidong.com/post/2015-03-07-socket5-1/)

## 常用

### 0. Socket5 Server

- chrome://extensions/

- 谷歌浏览器:代理插件先在中国镜像站下载个插件使用即可.
- [socks5 proxy server builds with go/golang (推荐因为部署简单)](https://github.com/jqqjj/socks5)
- [Socks5 is a Socks5 proxy server/client written in C# ThrDev/Socks5](https://github.com/ThrDev/Socks5)
- [一个 http、socks4、socks5 三合一代理服务，不支持用户验证和 UDP 协议。 liuaifu/asio5](https://github.com/liuaifu/asio5)

### 1. 使用 SSH 在 Linux 服务器上创建 SOCKS 代理以绕过内容过滤器

- [SSH](https://ma.ttias.be/socks-proxy-linux-ssh-bypass-content-filters/)

```c#

ssh -D 1337 -q -C -N root@8.8.8.8

-D 1337：在本地端口上打开一个SOCKS代理:1337
-C：压缩隧道中的数据，节省带宽
-q：安静模式，不在本地输出任何内容
-N：不执行远程命令，仅对转发端口有用

// 一旦运行，ssh它将一直停留在前台，直到您 CTRL+C 取消它为止。如果您希望使其在后台运行，请添加-f它以将其分叉到后台命令：
ssh -D 1337 -q -C -N -f user@ma.ttias.be

// 在Firefox中，转到“偏好设置”>“高级”>“网络”，然后找到“ 连接”设置

// 1. 手动代理配置

Socks主机:localhost 端口:1337

// 不使用代理:
localhost,127.0.0.1

// 勾选使用 socks v5 时代理 DNS 查询

```
