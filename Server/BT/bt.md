# 宝塔

- [宝塔面板 - 简单好用的 Linux/Windows 服务器管理面板](https://www.bt.cn/)

## 安装方法查看详细教程

-使用 SSH 连接工具，如宝塔远程桌面助手连接到您的 Linux 服务器后，挂载磁盘，根据系统执行相应命令开始安装（大约 2 分钟完成面板安装）：

```shell
# Centos 安装脚本
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
# Ubuntu/Deepin 安装脚本
wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh
# Debian 安装脚本
wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && bash install.sh
# Fedora 安装脚本
wget -O install.sh http://download.bt.cn/install/install_6.0.sh && bash install.sh
```

## 解决方案

```shell
# ****解决方法：在SSH终端输入以下一种命令来解决
# 1.查看面板入口：/etc/init.d/bt default
# 2.关闭安全入口：rm -f /www/server/panel/data/admin_path.pl
```

## 常用操作命令

### 1. 命令

```c#
bt
```

### 2. Linux 3.X/4.x/5.x/6.x 宝塔面板密码的解决方案

```c#
// 密码:testpasswd
// 执行后命令行结果:红框即面板账户
cd /www/server/panel && python tools.py panel testpasswd
```

### 3. 命令行汇总

- [宝塔linux面板重启、重置等命令-学派吧](https://www.xp8.net/server/392.html)
