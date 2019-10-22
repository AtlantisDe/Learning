# df

- [ubuntu 查看磁盘空间、文件大小](https://blog.csdn.net/u013066730/article/details/82757081)

## 常用

```shell
# 磁盘详情
df -hl


df -hl 查看磁盘剩余空间
df -h 查看每个根路径的分区大小
du -sh [目录名] 返回该目录的大小
du -sm [文件夹] 返回该文件夹总M数
df --help 查看更多功能

查看硬盘的分区 #sudo fdisk -l
查看IDE硬盘信息 #sudo hdparm -i /dev/hda
查看STAT硬盘信息 #sudo hdparm -I /dev/sda 或 #sudo apt-get install blktool #sudo blktool /dev/sda id
查看硬盘剩余空间 #df -h #df -H
查看目录占用空间 #du -hs 目录名
优盘没法卸载 #sync fuser -km /media/usbdisk

```
