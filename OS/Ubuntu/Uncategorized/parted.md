# parted

- [https://blog.csdn.net/lzjsqn/article/details/72059035](https://blog.csdn.net/lzjsqn/article/details/72059035)

```shell
parted /dev/sda
(parted) print list
```

## 常用

### 查看分区文件系统类型

```shell

parted /dev/sda
(parted) print list


Number  Start   End     Size    File system  Name  Flags
 1      1049kB  2097kB  1049kB                     bios_grub
 2      2097kB  21.5GB  21.5GB  ext4
 3      21.5GB  53.7GB  32.2GB
```
