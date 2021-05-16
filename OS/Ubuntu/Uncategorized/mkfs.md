# mkfs

```c#
// 查看当前分区类型
df -T /dev/sda2
//在新磁盘上创建xfs文件系统/或者其它文件系统
mkfs.xfs /dev/sda3
mkfs.ext4 /dev/sda3

// 创建PV
pvcreate /dev/sda3
// 查看PV详情
pvdisplay
```
