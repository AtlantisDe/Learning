# frp

- [frp - 你也能用的开源内网穿透工具，最简洁教程 - 小众软件](https://www.appinn.com/frp/)
- [fatedier/frp](https://github.com/fatedier/frp/releases)
- [十分钟教你配置 frp 实现内网穿透\_诗雨远方的博客-CSDN 博客](https://blog.csdn.net/u013144287/article/details/78589643/)

## 常用

- [fatedier/frp](https://github.com/fatedier/frp/releases)

### 1. Windows

- [frp 使用（windows+aliyun-windows） - phTAT - 博客园](https://www.cnblogs.com/realpht/p/11347501.html)
- [内网穿透工具 frp 的相关教程、示例、遇到的坑](https://meta.appinn.net/t/frp/11319/3)

```c#
// 设置 frp 服务器

c:\Tools\frp\frps.exe -c c:\Tools\frp\frps.ini
frps.exe -c frps.ini


netsh advfirewall firewall add rule name ="frps-7000" dir=in localport=7000 protocol=tcp action=allow
netsh advfirewall firewall add rule name ="frps-7200" dir=in localport=7200 protocol=tcp action=allow
netsh advfirewall firewall add rule name ="frps-7500" dir=in localport=7500 protocol=tcp action=allow


// 设置 frp 客户端
frpc.exe -c frpc.ini
// 成功执行后，打开：http://127.0.0.1:7400，访问本地frp管理页面，查看绑定的web应用。状态Status为running的代表启动成功并且在运行中的web应用
```

```C#
// 配置参数示例
[common]
server_addr = 服务器公网 IP
server_port = 7000

[RDP]
type = tcp
local_ip = 127.0.0.1
local_port = 3389
remote_port = 7001

[DSM]
type = tcp
local_ip = 在局域网中的 IP 地址
local_port = 5000
remote_port = 7002

```
