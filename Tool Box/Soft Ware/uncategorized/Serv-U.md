# Serv-U

- [Secure FTP Server &amp; MFT Software | Free Trial | Serv-U](https://www.serv-u.com/)

## 常用

### 1. 防火墙设置允许 Serv-U

- [Windows2008R2 防火墙设置允许 Serv-U 的方法 - 电脑应用 - 创想工作室](http://www.22ba.com/article/Computer588.html)
- [FTP 服务器的防火墙通用设置规则](https://blog.csdn.net/weixin_34032792/article/details/89983400)

```c#
这是最理想的情况。21端口当然要首先开放，然后再作如下设置：

serv-u服务器——本地服务器——设置——高级，在"pasv端口端口范围"中填入一段不与其它端口冲突的范围，如61600-61620，

然后在防火墙中开放61600-61620的端口。

// 入站端口规则
61600-61620,21

```
