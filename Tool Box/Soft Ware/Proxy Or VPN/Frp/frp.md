# frp

- [fatedier/frp](https://github.com/fatedier/frp/blob/master/README_zh.md)
- [frp - 你也能用的开源内网穿透工具，最简洁教程 - 小众软件](https://www.appinn.com/frp/)
- [fatedier/frp](https://github.com/fatedier/frp/releases)
- [十分钟教你配置 frp 实现内网穿透 诗雨远方](https://blog.csdn.net/u013144287/article/details/78589643/)
- [常用的内网穿透软件推荐-阿里云开发者社区](https://developer.aliyun.com/article/709469)
- [公网 IP vs 内网穿透 &#8211; Dorole&#039;s Blog](https://dorole.com/2003/)
- [内网穿透：在公网访问你家的 NAS - V2EX](https://www.v2ex.com/t/539197?p=1)

## 常用

- 下载:frp_0.XXX.0_windows_amd64.zip (64 位系统)
- [fatedier/frp](https://github.com/fatedier/frp/releases)

```c#
https://github.com/fatedier/frp/releases/download/v0.34.1/frp_0.34.1_windows_amd64.zip




// 主入口 7000  辅助入口 7001 你使用udp的话才使用7001 你这个xTCP是属于TCP的使用是7000底层交流 你server_port应填写主入口端口
// 帮助文档
frpc [flags]
frpc tcp --help
frpc xtcp --help


// 服务端:
C:\Tools\frp\frps.exe --bind_port 7000 --bind_udp_port 7001
C:\Tools\frp\frps.exe --bind_port 7389 --bind_udp_port 7001

// 内网端
frpc.exe xtcp --server_addr "8.8.8.8:7389" --proxy_name "P2P_MSTSC" --sk "password" --local_ip "192.168.1.158" --local_port 3389

// 使用端
frpc.exe xtcp --server_addr "8.8.8.8:7389" --proxy_name "P2P_MSTSC_Visitor" --role "visitor" --server_name "P2P_MSTSC" --sk "password" --bind_addr "127.0.0.1" --bind_port 6389



```

### 1. Windows 安装

- [frp 使用（windows+aliyun-windows） - phTAT - 博客园](https://www.cnblogs.com/realpht/p/11347501.html)
- [内网穿透工具 frp 的相关教程、示例、遇到的坑](https://meta.appinn.net/t/frp/11319/3)

```c#
// 1. 设置 frp 服务器 (frps)

c:\Tools\frp\frps.exe -c c:\Tools\frp\frps.ini

frps.exe -c frps.ini
frps.exe -c frps7389.ini

// 正确
netsh advfirewall firewall add rule name="frps-udp-7389" dir=in localport=7389 protocol=udp action=allow

netsh advfirewall firewall add rule name="frps-7000" dir=in localport=7000 protocol=tcp action=allow
netsh advfirewall firewall add rule name="frps-7200" dir=in localport=7200 protocol=tcp action=allow
netsh advfirewall firewall add rule name="frps-7500" dir=in localport=7500 protocol=tcp action=allow

// 错误
netsh advfirewall firewall add rule name="frps-tcp-7389" dir=in localport=7389 protocol=tcp action=allow

// 2. 设置 frp 客户端 (frpc)

frpc.exe -c frpc.ini

frpc.exe -c frpc7389.ini

// 可以选择配置WEB管理端:
[common]
admin_addr = 127.0.0.1
admin_port = 7400
admin_user = admin
admin_pwd = admin

// 成功执行后，打开：http://127.0.0.1:7400，访问本地frp管理页面，查看绑定的web应用。状态Status为running的代表启动成功并且在运行中的web应用

// 3. 配置文件模板
[common]
server_addr = 服务器公网 IP
server_port = 7000

[RDP]
type = tcp
local_ip = 127.0.0.1
local_port = 3389
remote_port = 7001
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

### 2. linux 安装

```c#
wget https://github.com/fatedier/frp/releases/download/v0.33.0/frp_0.33.0_linux_amd64.tar.gz

// 新建目录并解压
mkdir frp
tar -xzvf frp_0.33.0_linux_amd64.tar.gz -C frp

cd frp
cd frp_0.33.0_linux_amd64

```
