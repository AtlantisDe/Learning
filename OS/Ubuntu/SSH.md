# SSH

- [OpenSSH](http://www.openssh.com/)
- [OpenSSH 在 Windows 10 默认安装了](http://baijiahao.baidu.com/s?id=1600980660647409471&wfr=spider&for=pc)
- [Ubuntu 无法进行 SSH 连接，开启 22 端口 - 漂泊的孤魂 - 博客园](https://www.cnblogs.com/aq-ry/p/9809874.html)
- [Ubuntu Linux 下 openssh-server 配置及基本使用方法（root 下）](https://blog.csdn.net/qq_42773814/article/details/81213620)
- [MobaXterm free Xserver and tabbed SSH client for Windows](https://mobaxterm.mobatek.net/)

```shell
ssh 用户名@IP地址 -p 端口号
ssh root@127.0.0.1 -p 22
ssh root@127.0.0.1

# 进入Ubuntu 查看22 端口的情况
netstat -ntlp|grep 22
# 打开SSH服务，开启22端口，执行以下命令；
```
