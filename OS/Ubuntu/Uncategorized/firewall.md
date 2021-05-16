# 防火墙 (firewall)

- [linux 关闭防火墙方法 - 神通停客 - 博客园](https://www.cnblogs.com/shttke/p/10966980.html)

```shell
# 开启防火墙
ufw enable
# 关闭防火墙
ufw disable
防火墙开启(ubuntu下执行)    sudo ufw enable
防火墙重启(ubuntu下执行)    sudo ufw reload
查看本地的端口开启情况(ubuntu下执行)    sudo ufw status

打开80端口(ubuntu下执行)
sudo ufw allow https
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw allow 21
sudo ufw allow 'Nginx Full'
sudo ufw allow 137
sudo ufw allow 139
sudo ufw allow 445
sudo ufw allow 3306
```

## NFS

```shell
sudo ufw allow 8001
sudo ufw allow 2049
sudo ufw allow 892
sudo ufw allow 32803
sudo ufw allow 2769
```

## linux 关闭防火墙方法

```shell
下面是 red hat/CentOs7 关闭防火墙的命令!

# 1:查看防火状态

systemctl status firewalld

service  iptables status

# 2:暂时关闭防火墙

systemctl stop firewalld

service  iptables stop

# 3:永久关闭防火墙

systemctl disable firewalld

chkconfig iptables off

# 4:重启防火墙

systemctl enable firewalld

service iptables restart

# 5:永久关闭后重启
```
