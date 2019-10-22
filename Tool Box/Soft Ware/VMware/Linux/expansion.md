# 扩容

- Linux 上扩容,捣鼓了 N 种办法,把国内外的网站资料都翻遍了.最后成功了,笔记一下:gparted-live-1.0.0-5-i686.iso 最新版版本 ISOGUI 上一改就成功了!

## 常见错误解决方案

### 1. GPT PMBR size mismatch 解决方法

- [https://blog.csdn.net/agave7/article/details/83177858](https://blog.csdn.net/agave7/article/details/83177858)

```c#
// 说明：GPT PMBR size mismatch 解决方法
// 修复分区表
parted -l
```

## 步骤

- [vmware 下对 ubuntu 进行根目录扩容-afei2222 的博客-51CTO 博客](https://blog.51cto.com/2423357/2308548)
- [Linux 基础教程 - VMware 虚拟机 CentOS 7 磁盘扩容\_Linux 教程\_Linux 公社-Linux 系统门户网站](https://www.linuxidc.com/Linux/2019-04/158346.htm)
- [物理卷操作命令：pvcreate,pvscan,pvdisplay.卷组操作命令：vgcreate,vgdisplay. （转） - 沧海一滴 - 博客园](https://www.cnblogs.com/softidea/p/5147091.html)
- [Vmware Ubuntu 虚拟机磁盘扩容方法-百度经验](https://jingyan.baidu.com/article/86fae34604bdd53c49121a26.html)

```c#
// 1. 查看系统情况
df -h

// /dev/sda2        20G   19G     0 100% /
// 20G 已用完


// 2. 查看硬盘情况，可以看见我新增的那块硬盘区间
ls /dev/
或者
fdisk -l

// 以下显示 查看新增硬盘 一定要对
Disk /dev/sda: 50 GiB, 53687091200 bytes, 104857600 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 478A1F86-C5FC-4545-93E7-E25C83F44405

Device     Start      End  Sectors Size Type
/dev/sda1   2048     4095     2048   1M BIOS boot
/dev/sda2   4096 41940991 41936896  20G Linux filesystem

// 3. 然后对新加的磁盘进行分区操作：(这里是 /dev/sda 根据当时情况而定)
fdisk /dev/sda

//常遇到错误信息
Welcome to fdisk (util-linux 2.32).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

GPT PMBR size mismatch (41943039 != 104857599) will be corrected by write.

欢迎使用fdisk（util-linux 2.32）。
更改将仅保留在内存中，直到您决定将其写入。
使用write命令之前请小心。

GPT PMBR大小不匹配（41943039！= 104857599）将通过写纠正。

输入:p 查看已分区数量
输入:n 新增一个分区
输入:p 分区类型选择主分区

// 最后可以看到多出了一个主分区出来
Device        Start       End  Sectors Size Type
/dev/sda1      2048      4095     2048   1M BIOS boot
/dev/sda2      4096  41940991 41936896  20G Linux filesystem
/dev/sda3  41940992 104857566 62916575  30G Linux filesystem

Command (m for help):

输入:w 最后写入磁盘并保存

// 期间，如果需要将分区类型的Linux修改为Linux LVM的话需要在新增了分区之后，选择t，然后选择8e，之后可以将新的分区修改为linux LVM
// 之后我们可以再次用以下命令查看到磁盘当前情况

fdisk -l

// 4. 重启虚拟机格式化新建分区
reboot
// 然后将新添加的分区添加到已有的组实现扩容
// 首先查看卷组名

// 5. 首先查看卷组名
vgdisplay

// 6. 初始化刚刚的分区
fdisk -l
// 使用sdb创建基于磁盘的物理卷
pvcreate /dev/sda3

Physical volume "/dev/sda3" successfully created.

// 7. 将初始化过的分区加入到虚拟卷组名




vgdisplay
// 上面命令没结果不知道如何解决

// 查看物理卷创建是否成功
pvdisplay

// 创建data卷组：
vgcreate data /dev/sda3

vgextend /dev/Ubuntu /dev/sda3


// 查看卷组是否创建成功：
[root@jetsen ~]# vgdisplay
// --- Volume group --- ------我们可以看到，这就是我们刚才创建的vg，已经成功了，大小为30G，由一个PV组成

// 输入下面命令查看
df -h
// 这里我需要扩展
/dev/sda2

// 容量
// 扩容已有的卷组容量（这里有个细节，就是不能全扩展满，比如空闲空间是30G，然后这里的话30G不能全扩展上，这里我扩展的是29G）
# lvextend -L +需要扩展的容量 需要扩展的文件系统名
lvextend -L +28G /dev/sda2
```
