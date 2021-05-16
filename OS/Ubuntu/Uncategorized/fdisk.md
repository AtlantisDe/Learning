# fdisk

- [ubuntu 下的 fdisk 用法 - Chen Jian - 博客园](https://www.cnblogs.com/chjbbs/p/3762223.html)
- [LVM 卷的创建及案例演示 - 峰哥 ge - 博客园](https://www.cnblogs.com/FengGeBlog/p/10154565.html)
- [How to Use Fdisk to Manage Partitions on Linux](https://www.howtogeek.com/106873/how-to-use-fdisk-to-manage-partitions-on-linux/)

```c#
// fdisk的命令行用法为： fdisk 硬盘设备名
// 进入fdisk后，首先键入'm'，即可显示fdisk全部菜单。

fdisk /dev/sda


```

## 用法

### 1. 删除分区

```shell
fdisk /dev/sdc
m
d
1
w
```
