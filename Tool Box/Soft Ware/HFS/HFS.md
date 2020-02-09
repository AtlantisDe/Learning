# HFS

- [Download](http://www.rejetto.com/hfs/?f=dl)

## 常用

```c#
netsh advfirewall firewall add rule name ="HFS" dir=in localport=8888 protocol=tcp action=allow

netsh firewall set portopening all 8080 hfs enable
netsh firewall set portopening all 8180 hfs enable
netsh firewall set portopening all 8888 hfs enable
netsh firewall set portopening all 888 hfs enable

```
