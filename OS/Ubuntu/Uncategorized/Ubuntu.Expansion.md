# Ubuntu.Expansion

- [VMware 下扩展 Ubuntu 根分区大小 - “人生苦短” - 博客园](https://www.cnblogs.com/hester/p/11439353.html)
- [基于 VMware 的 CentOS7 虚拟机硬盘扩容](https://blog.csdn.net/hampton_chen/article/details/81370170)
- [如何对 vmware 虚拟机中的 Linux 系统进行扩容并将扩大的空间应用在 linux 中](https://blog.csdn.net/weixin_42184538/article/details/88199198)
- [Ubuntu 18.04 LTS 硬盘扩容过程全记录](https://blog.csdn.net/balabalahay/article/details/88076556)
- [Ubuntu 18.04 扩充磁盘空间](https://blog.csdn.net/qq_36290650/article/details/83057832)
- [虚拟机 - [Ubuntu 使用 Gparted 工具扩大第一分区方法步骤 - zalebool - 博客园](https://www.cnblogs.com/zalebool/p/5814907.html)
- [Linux 服务器其中一个磁盘满了怎么办？在不做磁盘扩容的情况下，一个软连接就搞定。](https://www.cnblogs.com/jackruicao/p/10318866.html)

```c#
// Linux存储lvm分层机制：Disk→Physical Volume→Volumn Group→Logic Volumn
fdisk -l
df -h

fdisk /dev/sda

m
p
n
t
L
找到Linux LVM编号 q退出 输入编号才进行w
w
reboot

df -T /dev/sda1
df -T /dev/sda2
df -T /dev/sda3

mkfs
mkfs -V

mkfs.ext4 /dev/sda3
mkfs.ext2 /dev/sda3
mkfs -t ext4 /dev/sda3

pvcreate /dev/sda{2,3}
pvcreate /dev/sda
pvcreate /dev/sda3
pvdisplay

pvremove /dev/sda3

pvdisplay /dev/sda2


fdisk /dev/sda
t
L
q
```
