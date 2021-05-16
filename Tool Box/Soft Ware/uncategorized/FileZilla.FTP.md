# FileZilla

- [FileZilla - The free FTP solution](https://filezilla-project.org/)
- [用 FileZilla 搭建 FTP 服务器及相关问题 - Better - SegmentFault 思否](https://segmentfault.com/a/1190000009033181)

## 1. FileZilla Server

- 下载安装
- [Download FileZilla Server for Windows](https://filezilla-project.org/download.php?type=server)

```c#

D:\Soft\FileZilla Server

netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/21" protocol=TCP dir=in localport=21 action=allow
netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/21" protocol=TCP dir=in localport=21 security=authdynenc action=allow

netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/22" protocol=TCP dir=in localport=22 action=allow
netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/22" protocol=TCP dir=in localport=22 security=authdynenc action=allow

netsh advfirewall firewall Add rule name="FileZilla Server Allow port range for Inbound TCP/61600-61620" dir=in protocol=TCP localport=61600-61620 action=allow

netsh advfirewall firewall add rule name="FileZilla Server" dir=in localport=2126 protocol=tcp action=allow
netsh advfirewall firewall add rule name="FileZilla Server端口段" dir=in localport=61600-61620 protocol=TCP action=allow

// 20个端口
netsh advfirewall firewall add rule name="FileZilla Server" dir=in localport=2126 protocol=tcp action=allow
netsh advfirewall firewall add rule name="FileZilla Server Port Segment" dir=in localport=61600-61620 protocol=TCP action=allow


// 500个端口
netsh advfirewall firewall add rule name="FileZilla Server" dir=in localport=2126 protocol=tcp action=allow
netsh advfirewall firewall add rule name="FileZilla Server Port Segment" dir=in localport=61100-61600 protocol=TCP action=allow



正式:配置服务器:
// 1. General settings
//    Listen on these ports:
2126

// 2. Passive mode settings
//     激活端口范围 use custom range
61100-61600

// 配置pasv端口端口范围
61100-61600
61600-61620

// 入站端口规则
61100-61600,21
61600-61620,21


// 配置默认访问公网IP (use the following IP):
88.00.00.00

// 这里可以不配置,即将使用所有IP,指定就绑定即可

3. FTP Over TLS settings
// 先配置Listen for implicit 端口
2127

// 打钩
Enable FTP Over TLS support (FTPS)
// 接着生成证书
Pass: 123456
// 选择4096 bit
02
CN
CN
CN
CN
CN
CN@CN.COM
// 接着保存证书即可.

点击 [闪电符号]
// 服务器启动成功状态如下
Server is going offline...
Server offline.
Creating listen socket on port 2126...
Creating listen socket on port 2127...
Server online


4. 建立用户组 和 用户即可

5. 客户端连接
//    文件协议:FTP
//    加密:TLS/SSL显示加密


```

## 1. FileZilla Server 配置最大并发数

```c#
// 1. General settings
//    Performance settings:
99
```

## 2. FileZilla Client

- [Download FileZilla Client for Mac OS X](https://filezilla-project.org/download.php)

```c#
// FileZilla_3.51.0_win64_sponsored-setup.exe

```
