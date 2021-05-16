# Mstsc

- [How to Clear RDP Connections History in Windows? | Windows OS Hub](http://woshub.com/how-to-clear-rdp-connections-history/)
- [如何清除 mstsc 记录](https://zhidao.baidu.com/question/323446589.html)
- [IT 之家学院：微软远程桌面 IPv6 直连，流畅如局域网 - IPv6,微软远程桌面,远程桌面 - IT 之家](https://www.ithome.com/0/397/749.htm)

```c#

```

## 常用

### 1. How To Enable Remote Desktop In Windows Server 2019

- [How To Enable Remote Desktop In Windows Server 2019 - RootUsers](https://www.rootusers.com/how-to-enable-remote-desktop-in-windows-server-2019/)

```c#
REG query HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server\WinStations\RDP-Tcp /v PortNumber

// 加这两条规则同时加遇到过没成功情况具体细节再看

netsh advfirewall firewall add rule name="MSTSC Server for Inbound TCP/3389" protocol=TCP dir=in localport=3389 action=allow
netsh advfirewall firewall add rule name="MSTSC Server for Inbound UDP/3389" protocol=UDP dir=in localport=3389 action=allow

netsh advfirewall firewall add rule name="MSTSC Server for Inbound TCP/8899" protocol=TCP dir=in localport=8899 action=allow
netsh advfirewall firewall add rule name="MSTSC Server for Inbound UDP/8899" protocol=UDP dir=in localport=8899 action=allow

// 再次确认,放行TCP端口即可.


// 注册表
计算机\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\Wds\rdpwd\Tds\tcp
// PortNumber
```

### 2. Code

```c#
@echo off
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Default" /va /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers"
attrib -s -h %userprofile%\documents\Default.rdp
del %userprofile%\documents\Default.rdp
del /f /s /q /a %AppData%\Microsoft\Windows\Recent\AutomaticDestinations
```
