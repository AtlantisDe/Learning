# Ubuntu

- [Official Ubuntu Documentation](https://help.ubuntu.com/)
- [Linux/Ubuntu](https://www.cnblogs.com/bycnboy/p/10591620.html)
- [The leading operating system for PCs, IoT devices, servers and the cloud | Ubuntu](https://www.ubuntu.com/index_kylin)
- [Ubuntu18.10server 图文安装教程，Ubuntu18.10 最小化安装详细过程详解](http://www.piis.cn/zhishi/web1424.asp)
- [linux 查看端口使用情况](https://blog.csdn.net/zwhfyy/article/details/3971523)
- [ubuntu 部分端口命令的使用----开启端口/开启防火墙](http://www.cnblogs.com/zqunor/p/6417938.html)
- [linux 中 sftp 默认登录的端口号是多少? sftp 通过指定的端口号连接?sftp 默认端口号](https://www.cnblogs.com/chuanzhang053/p/8875759.html)
- [Gitlab 使用自签名证书开启 Https](https://www.jianshu.com/p/4111534b339f)
- [Ubuntu 修改密码和用户名](https://blog.csdn.net/qq_28959531/article/details/78989635)
- [Ubuntu “Failed to fetch”错误的解决方法 404](https://blog.csdn.net/xueer767/article/details/72864777)
- [Ubuntu 使用 root 帐号,并让 Xshell, Winscp 以 root 身份登录 - EnskDeCode - CSDN 博客](https://blog.csdn.net/tojohnonly/article/details/57184166)

## 1. 常用命令

### 1. Ubuntu 版本查看

```shell
cat /proc/version
uname -a
lsb_release -a

```

```shell
# 命令: lsb_release -a 查看示例
lsb_release -a

root@skyspace:~# lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.10
Release:        18.10
Codename:       cosmic

# 当然可以通过已安装.net 查看
dotnet --info

Runtime Environment:
 OS Name:     ubuntu
 OS Version:  19.10
 OS Platform: Linux
 RID:         ubuntu.19.10-x64
 Base Path:   /usr/share/dotnet/sdk/3.1.100/
```

### 2. 软件更新源 / 系统更新 [注意 IPv4 或者 IPv6]

```shell
sudo apt-get install apt
sudo apt-get -y autoremove
sudo apt-get -y clean
sudo dpkg --configure -a
sudo apt-get -y check

sudo apt-get install --reinstall apt

sudo dpkg -l | grep apt

sudo apt-get clean
sudo apt-get update

sudo apt update
apt-get -o Acquire::ForceIPv4=true update

# New release '19.04' available.
# Run 'do-release-upgrade' to upgrade to it.

do-release-upgrade

# 系统升级版本命令命令步骤
# Please install all available updates for your release before upgrading.

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade

# 然后再执行升级命令进行升级即可
sudo do-release-upgrade
```

### 3. 修改 hosts 后,使 hosts 文件修改生效: (Ubuntu 18 后好像直接生效)

```shell
sudo /etc/init.d/dns-clean start
sudo /etc/init.d/networking restart
```

### 4. 用户信息操作/修改密码

```shell
sudo passwd user(user 是对应的用户名)
sudo passwd root
```

## 2. 语言包

```c#
Please install all available updates for your release before upgrading.
升级前请为您的版本安装所有可用更新。

Press x to destroy or r to resurrect window
按x破坏或r恢复窗口
(关闭窗口 / 恢复意思大概)


If you continue, an additional ssh daemon will be started at port
'1022'.
Do you want to continue?

如果继续，将在端口启动另一个ssh守护程序
'1022'。
你想继续吗？


Some third party entries in your sources.list were disabled. You can
re-enable them after the upgrade with the 'software-properties' tool
or your package manager.

您的sources.list中的某些第三方条目已被禁用。 您可以
使用'software-properties'工具升级后重新启用它们
或您的包裹经理。


Restoring original system state

Aborting
Reading package lists... Done
Building dependency tree
Reading state information... Done
=== Command terminated with exit status 1 (Wed Aug 28 05:44:37 2019) ===

恢复原始系统状态

中止
阅读包裹清单......完成
构建依赖树
阅读国家信息......完成
===命令终止，退出状态为1（8月28日星期三，星期四，2017年4月8日，449）===

```
