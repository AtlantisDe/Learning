# netsh

- [Network Shell (Netsh) Example Batch File](https://docs.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-wins)
- [Windows 上使用 netsh 命令设置 IP 和 Wifi](https://www.cnblogs.com/linuxAndMcu/p/12434418.html)
- [netsh 用法 - “人生苦短” - 博客园](https://www.cnblogs.com/hester/p/7448499.html)

## 0. 常用

```c#
// 也可以路由器直接配置

// 设置静态
netsh interface ip set address "WLAN" static 192.168.3.158 255.255.255.0 192.168.3.1
netsh interface ip set dns "WLAN" static 192.168.3.1
netsh interface ip add dns "WLAN" 192.168.3.1
pause

// 取消设置自动获取模式
netsh interface ip set address "WLAN" dhcp
netsh interface ip set dns "WLAN" dhcp

```

## 1. 用 netsh 自动切换

- [用 netsh 自动切换 IP_weixin_30512089](https://blog.csdn.net/weixin_30512089/article/details/95210145)

```c#
// 1. 设置中输入固定的IP和DNS，然后运行CMD命令输入以下命令：netsh -c interface dump >c:\staticip.txt

// 2. 用同样的方法将网卡TCP/IP属性设置成在自动分配IP的网络配置，执行以下命令：netsh -c interface dump >c:\autoip.txt

// 3.制作批处理文件staticip.bat内容为：netsh -f c:\staticip.txt
//    制作批处理文件autoip.bat内容为：netsh -f c:\autoip.txt

```

## 3. NETSH Command to Change from Static IP Address to DHCP

- NETSH 命令从静态 IP 地址更改为 DHCP
- [NETSH Command to Change from Static IP Address to DHCP &laquo; Memorise](http://blog.shiraj.com/2012/10/netsh-command-to-change-from-static-ip-address-to-dhcp/)

```c#
netsh interface ip set address“ Local Area Connection” dhcp
```
