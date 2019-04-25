# 网卡配置[netplan]

- [如何在 Ubuntu 18.04 下正确配置网络 - 运维之美](https://www.hi-linux.com/posts/49513.html)
- [How To Configure IP Address In Ubuntu 18.04 LTS - OSTechNix (参考这个弄成功了)](https://www.ostechnix.com/how-to-configure-ip-address-in-ubuntu-18-04-lts/)
- [[Linux] Ubuntu 18 LTS netplan 网络配置](https://www.cnblogs.com/abeen/p/9355493.html)
- [Ubuntu 网卡多设置](https://blog.csdn.net/wv_feng/article/details/78504624)
- [Examples | netplan.io](https://netplan.io/examples)
- [Ubuntu 17.10 Server static IP netplan - how to set netmask](https://askubuntu.com/questions/972955/ubuntu-17-10-server-static-ip-netplan-how-to-set-netmask)
- [ubuntu18.04 server配置静态ip](https://blog.csdn.net/mossan/article/details/80381679)
- [Ubuntu重启网卡的三种方法](https://blog.csdn.net/marc07/article/details/62885872)
- [How To Disable IPV6 on Linux/Ubuntu?](https://support.purevpn.com/how-to-disable-ipv6-linuxubuntu)

```shell
# Netplan 是 Ubuntu 17.10 中引入的一种新的命令行网络配置实用程序，用于在 Ubuntu 系统中轻松管理和配置网络设置。 它允许您使用 YAML 格式的描述文件来抽像化定义网络接口的相关信息。

# 1. enp0s5 指定需配置网络接口的名称。
# 2. dhcp4  是否打开 IPv4 的 dhcp。
# 3. dhcp6  是否打开 IPv6 的 dhcp。
# 4. addresses 定义网络接口的静态 IP 地址。
# 5. gateway4  指定默认网关的 IPv4 地址。
# 6. nameservers  指定域名服务器的 IP 地址。

```

```shell
# Ubuntu 18.04 采用netplan作为网络配置管理，与16.04及之前的版本区别很大
```

## IP 配置 [Ubuntu 18.04 Server]

```shell
cd /etc/netplan/
vi 50-cloud-init.yaml
ls /etc/netplan/
sudo vi /etc/netplan/50-cloud-init.yaml
sudo vi /etc/netplan/01-netcfg.yaml
sudo nano /etc/netplan/50-cloud-init.yaml
```

### 禁用和启用网卡

```shell
# ifconfig -a (不加-a参数，只能查启用的网卡)
# 例如：网卡名 eth0
# 启用网卡命名 ifconfig eth0 up
# 禁用网卡命名 ifconfig eth0 down
# 验证了 suse系统/redhat系统/ubuntu系统/Frdora系统/CentOS系统，均能使用。
```

### 查看已有物理网卡

```shell
ifconfig -a

ip addr show
```

### 可查看缺省网关

- [Ubuntu 下的多网卡配置](https://yiding-he.iteye.com/blog/244943)

```shell
route
```

```shell
# 比如我的两个网卡 IP/网关分别为(* 是我有意省略的)：
# eth0 - 202.197.40.*/202.197.40.254
# eth1 - 172.16.33.*/172.16.33.254
```

### 要添加缺省网关

```shell
sudo route add default gw 192.168.1.1
```

### 要删除多余的缺省网关，可以用类似下面的命令

```shell
sudo route del default gw 192.168.0.1
```

### 给服务器配置外网IP

```shell
vi /etc/network/interfaces
```

### 默认是以DHCP方式配置网卡自动分配IP 我们要将默认的注释掉或删除

```shell
auto eth0
iface eth0 inet dhcp
## 默认是以DHCP方式配置网卡自动分配IP 我们要将默认的注释掉或删除
```

### 我们需要修改为静态IP(老版本配置)

```shell
auto eth0
iface eth0 inet static
address 1921.168.1.12 #IP
netmask 255.255.255.0 #子网
gateway 1921.168.1.1 #网关
dns-nameservers 114.114.114.114 8.8.8.8 #这里设置了两个DNS
```

### 直接配置netplan

```shell
network:
   ethernets:
      eth0:
         addresses: [192.168.3.20/24]
         gateway4: 192.168.3.1
         dhcp4: no
         nameservers:
            addresses: [1.1.1.1,1.0.0.1]
   version: 2
```

### 启用生效

```shell
sudo netplan apply
sudo netplan --debug apply
```

### DNS配置

```shell
sudo vi /etc/resolv.conf
```

```shell
nameserver 1.1.1.1
nameserver 1.0.0.1
```

## DNS

```shell
sudo vim /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
```

## DNS无法解析

```shell
ping: archive.ubuntu.com: Temporary failure in name resolution
```