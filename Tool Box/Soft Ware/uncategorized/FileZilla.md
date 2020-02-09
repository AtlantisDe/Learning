# FileZilla

- [FileZilla - The free FTP solution](https://filezilla-project.org/)
- [用 FileZilla 搭建 FTP 服务器及相关问题 - Better - SegmentFault 思否](https://segmentfault.com/a/1190000009033181)
- [Download FileZilla Server for Windows](https://filezilla-project.org/download.php?type=server)

## FileZilla Server

```c#
netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/21" protocol=TCP dir=in localport=21 action=allow
netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/21" protocol=TCP dir=in localport=21 security=authdynenc action=allow

netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/22" protocol=TCP dir=in localport=22 action=allow
netsh advfirewall firewall add rule name="FileZilla Server for Inbound TCP/22" protocol=TCP dir=in localport=22 security=authdynenc action=allow

netsh advfirewall firewall Add rule name="FileZilla Server Allow port range for Inbound TCP/61600-61620" dir=in protocol=TCP localport=61600-61620 action=allow

netsh advfirewall firewall add rule name ="FileZilla Server" dir=in localport=2126 protocol=tcp action=allow
netsh advfirewall firewall add rule name="FileZilla Server端口段" dir=in localport=61600-61620 protocol=TCP action=allow


// 配置pasv端口端口范围
61600-61620

// 入站端口规则
61600-61620,21

```
