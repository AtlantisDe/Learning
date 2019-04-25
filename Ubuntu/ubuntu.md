# Ubuntu 文章

- [Linux/Ubuntu](https://www.cnblogs.com/bycnboy/p/10591620.html)
- [The leading operating system for PCs, IoT devices, servers and the cloud | Ubuntu](https://www.ubuntu.com/index_kylin)
- [Ubuntu18.10server图文安装教程，Ubuntu18.10最小化安装详细过程详解](http://www.piis.cn/zhishi/web1424.asp)
- [linux 查看端口使用情况](https://blog.csdn.net/zwhfyy/article/details/3971523)
- [ubuntu 部分端口命令的使用----开启端口/开启防火墙](http://www.cnblogs.com/zqunor/p/6417938.html)
- [linux 中 sftp 默认登录的端口号是多少? sftp 通过指定的端口号连接?sftp 默认端口号](https://www.cnblogs.com/chuanzhang053/p/8875759.html)
- [Gitlab 使用自签名证书开启 Https](https://www.jianshu.com/p/4111534b339f)
- [Ubuntu 修改密码和用户名](https://blog.csdn.net/qq_28959531/article/details/78989635)
- [Ubuntu “Failed to fetch”错误的解决方法 404](https://blog.csdn.net/xueer767/article/details/72864777)
- [Ubuntu使用root帐号,并让Xshell, Winscp以root身份登录 - EnskDeCode - CSDN博客](https://blog.csdn.net/tojohnonly/article/details/57184166)

## Ubuntu

```shell
cat /proc/version
uname -a
lsb_release -a
```

## 更新源

```shell
sudo apt-get clean
sudo apt-get update
sudo apt update
apt-get -o Acquire::ForceIPv4=true update
```

## 修改 hosts 后,使 hosts 文件修改生效: (Ubuntu 18 后好像直接生效)

```shell
sudo /etc/init.d/dns-clean start
sudo /etc/init.d/networking restart
```

## 用户信息操作

```shell
sudo passwd user(user 是对应的用户名)
sudo passwd root
```