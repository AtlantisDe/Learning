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
