# HFS

- [Download](http://www.rejetto.com/hfs/?f=dl)

## 常用

```c#
netsh advfirewall firewall add rule name ="HFS" dir=in localport=8888 protocol=tcp action=allow
netsh advfirewall firewall delete rule name="HFS"


netsh advfirewall firewall add rule name="HFS Server for Inbound TCP/21" protocol=TCP dir=in localport=21 action=allow
netsh advfirewall firewall add rule name="HFS Server for Inbound TCP/21" protocol=TCP dir=in localport=21 security=authdynenc action=allow

netsh firewall set portopening all 8080 hfs enable
netsh firewall set portopening all 8180 hfs enable
netsh firewall set portopening all 8888 hfs enable
netsh firewall set portopening all 888 hfs enable

```
