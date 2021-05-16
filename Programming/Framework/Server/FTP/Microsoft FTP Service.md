# Microsoft FTP Service

- [Windows 下搭建 FTP 服务器 - 子非魚！ - 博客园](https://www.cnblogs.com/zhangfengfly/p/6879513.html)
- [Windows 下开启 FTP 服务并创建 FTP 用户 - Duke 的博客 - CSDN 博客](https://blog.csdn.net/pengpengpeng85/article/details/84977436)
- [IIS 7 中添加 FTP 站点并设置指定用户访问](https://www.jianshu.com/p/f705574d155a)
- [windows2008 新建站点及 ftp 账号 - 神经质少女爱代码 - 博客园](https://www.cnblogs.com/blog-zy/p/7940406.html)
- [用 IIS 配置 FTP 服务器，用户登陆不了](https://zhidao.baidu.com/question/479225943.html)
- [IIS 中 ftp 的部署+防火墙（一） - miner_k 的博客 - CSDN 博客](https://blog.csdn.net/miner_k/article/details/69427342)
- [Windows 2008 R2 IIS7.5 配置 FTP 图文教程](https://www.jb51.net/article/57219.htm)
- [Windows 2008 R2 FTP 防火墙配置问题 - lu lu - 博客园](https://www.cnblogs.com/dennlu/archive/2012/06/04/2534925.html)

```c#
三步走：
1.在你的FTP服务器上关闭系统自带防火墙；
2.设置administrator用户名和密码，并启用，关闭guest登录，开放远程登录；
3.在“开始-控制面板-管理工具-本地安全策略-本地策略-安全选项”中找到“网络访问：本地账户的共享和安全模式”，后面要设置成“经典模式”
```

## 常见问题

- [windows 防火墙支持 FTP 服务的设置方法 - 37 度 2 - CSDN 博客](https://blog.csdn.net/china_skag/article/details/79429338)
- [WINDOWS2008 设置 FTP 防火墙规则 - sungcong - 博客园](https://www.cnblogs.com/sungcong/p/3907747.html)
- 连接不上 FTP 是因为防火墙没配置正确.
- net stop ftpsvc & net start ftpsvc（重启 ftp 服务）不然不生效

```c#
FTP Server (FTP Traffic-Out)
An outbound rule to allow FTP traffic for Internet Information Services (IIS) [TCP 20]

WINDOWS2008 设置FTP防火墙规则
在防火墙入站规划这里，加上21、20两个端口。
然后重启ftp服务，cmd命令：net stop ftpsvc & net start ftpsvc（重启ftp服务）
一定要重启ftp服务，不然不生效
```

### 加完防火墙规则后一定要重启 FTP

```c#
cmd命令：net stop ftpsvc & net start ftpsvc（重启ftp服务）

net stop ftpsvc
net start ftpsvc

```

### 不知道为啥我用 ftp 建立的账户永远无法访问 温馨提示 建立用户时候不要以 ftp 为用户名 捣鼓了很多时间.
