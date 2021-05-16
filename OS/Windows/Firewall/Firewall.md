# Firewall

- [Configure Windows Firewall with Advanced Security by Using an Answer File](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/configure-windows-firewall-with-advanced-security-by-using-an-answer-file)
- [Windows 批量添加防火墙例外端口的批处理代码](https://www.jb51.net/article/31851.htm)
- [使用命令添加 window 和 Linux 端口规则和 ip 规则 iptables ，netsh advfirewall firewall](https://blog.csdn.net/wang0112233/article/details/91802233)

## 1. 常用

```c#

%windir%\system32\WF.msc

netsh advfirewall firewall delete rule name="3proxy Server for Inbound TCP/1235"

// windows添加端口规则（入站规则）:

// 单个端口：
netsh advfirewall firewall add rule name="1111111111111" dir=in localport=8888 protocol=tcp action=allow
netsh advfirewall firewall add rule name=1111111111111 dir=in localport=111 protocol=TCP action=allow

// 端口段：

// （放行）：
netsh advfirewall firewall add rule name=111111111111端口段 dir=in localport=111-222 protocol=TCP action=allow
// （拦截）：
netsh advfirewall firewall add rule name=111111111111端口段 dir=in localport=111-222 protocol=TCP action=block


// Linux添加端口规则：
单个端口：   iptables -A INPUT -p TCP --dport 1111 -j ACCEPT
端口段：       iptables -A INPUT -p TCP --dport 111:222 -j ACCEPT
拦截： iptables -A INPUT -p TCP --dport 111:222 -j REJECT


// windows添加ip规则（入站）：
netsh advfirewall firewall add rule name=测试规则放行192.168.0.10 protocol=any dir=in action=allow remoteip=192.168.0.10

// linux添加ip规则：
（单个ip放行）iptables -I INPUT -s 192.168.0.10 -j ACCEPT
（ip段拦截）iptables -I INPUT -s 192.168.0.0/24 -j DROP


注意：Linux每次都需要重启防火墙
           windows的端口写法是111-222，linux是111:222
参考：https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd734783(v=ws.10)
```

## 2. 【Windows 防火墙】，然后再点击左侧的【启用或关闭 Windows 防火墙】

## 3. 报错打印用法

```bat
C:\WINDOWS\system32>netsh advfirewall firewall add rule name=FileZilla Server dir=in localport=21 protocol=tcp action=allow

指定的值无效。

用法: add rule name=<string>
      dir=in|out
      action=allow|block|bypass
      [program=<program path>]
      [service=<service short name>|any]
      [description=<string>]
      [enable=yes|no (default=yes)]
      [profile=public|private|domain|any[,...]]
      [localip=any|<IPv4 address>|<IPv6 address>|<subnet>|<range>|<list>]
      [remoteip=any|localsubnet|dns|dhcp|wins|defaultgateway|
         <IPv4 address>|<IPv6 address>|<subnet>|<range>|<list>]
      [localport=0-65535|<port range>[,...]|RPC|RPC-EPMap|IPHTTPS|any (default=any)]
      [remoteport=0-65535|<port range>[,...]|any (default=any)]
      [protocol=0-255|icmpv4|icmpv6|icmpv4:type,code|icmpv6:type,code|
         tcp|udp|any (default=any)]
      [interfacetype=wireless|lan|ras|any]
      [rmtcomputergrp=<SDDL string>]
      [rmtusrgrp=<SDDL string>]
      [edge=yes|deferapp|deferuser|no (default=no)]
      [security=authenticate|authenc|authdynenc|authnoencap|notrequired
         (default=notrequired)]

备注:

      - 将新的入站或出站规则添加到防火墙策略。
      - 规则名称应该是唯一的，且不能为 "all"。
      - 如果已指定远程计算机或用户组，则 security 必须为
        authenticate、authenc、authdynenc 或 authnoencap。
      - 为 authdynenc 设置安全性可允许系统动态协商为匹配
        给定 Windows Defender 防火墙规则的通信使用加密。
        根据现有连接安全规则属性协商加密。
        选择此选项后，只要入站 IPsec 连接已设置安全保护，
        但未使用 IPsec 进行加密，计算机就能够接收该入站连接的第一个 TCP 或
        UDP 包。
        一旦处理了第一个数据包，服务器将重新协商连接并对其进行升级，以便所
        有后续通信都完全加密。
      - 如果 action=bypass，则 dir=in 时必须指定远程计算机组。
      - 如果 service=any，则规则仅应用到服务。
      - ICMP 类型或代码可以为 "any"。
      - Edge 只能为入站规则指定。
      - AuthEnc 和 authnoencap 不能同时使用。
      - Authdynenc 仅当 dir=in 时有效。
      - 设置 authnoencap 后，security=authenticate 选项就变成可选参数。

示例:

      为不具有封装的 messenger.exe 添加入站规则:
      netsh advfirewall firewall add rule name="allow messenger"
      dir=in program="c:\programfiles\messenger\msmsgs.exe"
      security=authnoencap action=allow

      为端口 80 添加出站规则:
      netsh advfirewall firewall add rule name="allow80"
      protocol=TCP dir=out localport=80 action=block

      为 TCP 端口 80 通信添加需要安全和加密的入站规则:
      netsh advfirewall firewall add rule
      name="Require Encryption for Inbound TCP/80"
      protocol=TCP dir=in localport=80 security=authdynenc
      action=allow

      为 messenger.exe 添加需要安全的入站规则:
      netsh advfirewall firewall add rule name="allow messenger"
      dir=in program="c:\program files\messenger\msmsgs.exe"
      security=authenticate action=allow

      为 SDDL 字符串标识的组 acmedomain\scanners 添加
     经过身份验证的防火墙跳过规则:
     netsh advfirewall firewall add rule name="allow scanners"
      dir=in rmtcomputergrp=<SDDL string> action=bypass
      security=authenticate

      为 udp- 的本地端口 5000-5010 添加出站允许规则
      Add rule name="Allow port range" dir=out protocol=udp localport=5000-5010 action=allow
```

## 4. 端口

```c#
// 特别提醒,入口如不需要加密的,请勿用security否则导致无法访问
netsh advfirewall firewall add rule name="Google HTTP Server for Inbound TCP/6323" protocol=TCP dir=in localport=6323 action=allow
netsh advfirewall firewall add rule name="Google HTTP Server for Outbound TCP/6323" protocol=TCP dir=out localport=6323 action=allow


netsh advfirewall firewall add rule name="HTTP Server for Inbound TCP/80" protocol=TCP dir=in localport=80 action=allow
netsh advfirewall firewall add rule name="HTTP Server for Inbound TCP/80" protocol=TCP dir=in localport=80 security=authdynenc action=allow

netsh advfirewall firewall add rule name="MSTSC Server for Inbound TCP/3389" protocol=TCP dir=in localport=3389 action=allow
netsh advfirewall firewall add rule name="MSTSC Server for Inbound TCP/3389" protocol=TCP dir=in localport=3389 security=authdynenc action=allow

netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=TCP localport="%c%"
netsh advfirewall firewall add rule name="Remote PortNumber" dir=in action=allow protocol=TCP localport="%c%"


netsh advfirewall firewall add rule name="Kodbox OA HTTP Server for Inbound TCP/83" protocol=TCP dir=in localport=83 action=allow
netsh advfirewall firewall add rule name="Kodbox OA HTTP Server for Inbound TCP/83" protocol=TCP dir=in localport=83 security=authdynenc action=allow


netsh advfirewall firewall add rule name="Kodbox OA HTTP Server for Inbound TCP/83" protocol=TCP dir=in localport=83 action=allow
netsh advfirewall firewall add rule name="MongoDB Server for Inbound TCP/27017" protocol=TCP dir=in localport=27017 action=allow
netsh advfirewall firewall add rule name="MongoDB Server for Inbound TCP/26667" protocol=TCP dir=in localport=26667 action=allow

netsh advfirewall firewall add rule name="Redis Server for Inbound TCP/6379" protocol=TCP dir=in localport=6379 action=allow


```

## 5. 端口段

```c#
netsh advfirewall firewall add rule name="Google HTTP Server for Inbound TCP 11300-11399" protocol=TCP dir=in localport=11300-11399 action=allow

```
