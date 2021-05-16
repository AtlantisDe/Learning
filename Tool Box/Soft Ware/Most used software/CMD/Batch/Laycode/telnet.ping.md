# telnet.ping

- [curl ip 报错 curl: (56) Recv failure: Connection reset by peer*运维*飞扬 柳絮的专栏-CSDN 博客](https://blog.csdn.net/tjcjava/article/details/79089613)
- [ping 命令 curl 命令 telnet 命令](https://www.jianshu.com/p/a022ce71571f)
- [通过 curl 以及 ping 命令批量测试主机连通性*云博客*云社区-华为云](https://bbs.huaweicloud.com/blogs/135655)
- [如果网卡有多个 IP 地址如何判断哪个才是能上网的呢？-CSDN 论坛](https://bbs.csdn.net/topics/390360820?page=1)
- [你知道这 7 种测试端口连通性的方法吗？ - 常见问题 - 景安 VPS 之家](https://vps.zzidc.com/changjianwenti/2305.html)
- [C# 如何判断电脑上网所使用的本地 IP-CSDN 论坛](https://bbs.csdn.net/topics/392035051?list=lz)

## 常用

- [C#判断电脑是否处于联网状态 weixin_33694620](https://blog.csdn.net/weixin_33694620/article/details/92711816)

```c#
// ping telnet的区别
// ping: 用来检查网络是否通畅或网络连接速度(Ping域名可以得出解析IP)
// telnet: 用来检查指定ip是否开放指定端口的

// 主要还要看是用“光纤宽带”还是“普通宽带”

// 1、如果是用光纤宽带，PING＜3ms，是正常范围

// 2、如果是用普通宽带，PING＜50ms，是正常范围



// 180ms 都非常卡了...

tracert www.google.com
tracert www.baidu.com
tracert m.baidu.com
ping -n 2 -w 1 -S 127.0.0.1 www.baidu.com

// 返回的第一条记录是你的网关ip判断你的网卡，谁的网关设置的是它，凡是网关是这个ip的，都可以连外网。
```

## Tools

```c#
Ping
// Ping是Windows、Linux和Unix系统下的一个检查网络连通性的命令工具，对于大部分互联网用户来说很实用、很方便，但是ping有个缺点：不能指定端口，如果源地址被设置禁ping，那么ping命令就形同虚设。

NMap
// NMap全称Network Mapper，是Linux下的网络扫描和嗅探工具包，也称之为“系统漏洞扫描之王”。
使用方法：nmap -p 端口 地址

Netcat
// nc是netcat的简写，有网络界的瑞士军刀的美誉。因为它短小精悍、功能实用，被设计为一个简单、可靠的网络工具。
使用方法：nc -vz 地址 端口

Paping
// Paping是linux下测试tcp端口连通性的开源工具，只支持tcp不支持udp。
使用方法：./paping -p 端口 -c 次数 地址

cURL
// cURL是一个利用URL语法在命令行下工作的文件传输工具。
// 使用场景：cURL支持的通信协议有很多，比如FTP、HTTP、HTTPS、SCP、Telnet、IMAP、POP3、SMTP等，但是curl主要是用于文件传输，比如利用curl调用API。
使用方法：curl 地址:端口

Psping
// Psping是微软提供的测试工具，可以用来测试ICMP ping 、TCP ping、延迟测试、带宽测试等。
// 使用场景：不仅可以测试端口连通性，还可以检测网络延迟情况。唯一局限性就是：只限于windows系统。
使用方法：C:PSTools>psping.exe 地址:端口

Hhping
// Hping是一个命令行下使用的TCP/IP数据包组装/分析工具，其命令模式类似Unix下的ping命令，但是它不仅能发送ICMP回应请求，它还可以支持TCP、UDP、ICMP和RAW-IP协议，它有一个路由跟踪模式，能够在两个相互包含的通道之间传送文件。
// 使用场景：和ping工具相比，HPING可以使用任何IP报文，包括ICMP、TCP、UDP、RAWSOCKET，它的优势在于能够定制数据包的各个部分，支持对目标地址进行详细地探测。
使用方法：hping 地址 -S -V -c 次数 -p 端口


Test-netconnection
// The Test-NetConnection cmdlet displays diagnostic information for a connection. 显示连接的状态诊断信息。
// 使用场景：powershell自带的一款网络测试工具，可以用来测试端口连接性，相对于Psping，功能比较单一。
使用方法：Test-NetConnection 地址 -port 端口
```
