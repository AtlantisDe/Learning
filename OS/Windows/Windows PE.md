# Windows PE (WinPE)

- [Windows PE (WinPE)](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-intro)
- [最小 Win8PE 71M 维护用 ISO 版](http://www.upantool.com/iso/cdrom/11586.html)
- [微 PE 工具箱 - 最好用的 WinPE 装机维护工具](http://www.wepe.com.cn/)

## Windows 系统安装器 WinNTSetup

### 1. 安装指导

```c#
安装低于win10以下,可以选择用WinNTSetup安装,win10以上直接用微软原版的ISO安装器安装

GPT: 需要开启UEFI + Windows.ISO 中 Setup.exe 即可.

MBR: 需要设置一个主活动分区+ MRR 引导分区推荐选择FAT32最低格式化

Bios: 开启虚拟技术 SVM MODE
SVM选项就是开启AMD-V虚拟化技术， INTEL的虚拟化技术叫VT-x，AMD的叫AMD-V，所谓CPU虚拟化技术

```

### 2. 安装失败原因与经验

```c#
安装失败,很多时候是自己的U盘坏了,还有电脑本身硬件,经验之谈.
```

### 3. NTFS 与 FAT32 区别大揭秘

- [重装系统我们选择 FAT 还是 NTFS？U 盘和硬盘格式化两者选谁？](https://baijiahao.baidu.com/s?id=1611840649609906115&wfr=spider&for=pc)
- [NTFS 与 FAT32 区别大揭秘|Paragon NTFS for Mac 中文官网](https://www.ntfsformac.cn/changjianwenti/qita-nytqubie.html)

```c#
MRR 引导分区推荐选择FAT32最低格式化!
```

### 4. 备份驱动与还原驱动

- [Dism++ | 全新的 Windows 实用工具,也许是最强的实用工具](https://www.chuyu.me/zh-Hans/index.html)
- [使用 DISM 命令备份/还原 Windows 10 驱动程序 | 官方支持 | ASUS 中国](https://www.asus.com.cn/support/FAQ/1030158/)
- [扔掉一键还原，用 Dism++帮你 5 分钟重装原厂系统【拯救者游戏本吧】 百度贴吧](https://tieba.baidu.com/p/5663730929)
- [[ Windows ] 利用自带的 dism 工具备份/还原驱动](https://moeclub.org/2018/01/18/543/?spm=53.8)
- [Driver Magician Lite(驱动备份工具)DML](http://www.pc0359.cn/downinfo/10455.html)
- [如何手动备份驱动手动还原驱动-百度经验](https://jingyan.baidu.com/article/f3ad7d0f4123af09c3345beb.html)
- [windows 自带备份驱动*运维*麦田之兔](https://blog.csdn.net/xx22nn/article/details/89320394)
- [驱动一键备份还原(OneKey-Drivers) 2.1 绿色草蜢版](https://dl.pconline.com.cn/download/549056-1.html)

```shell
C:\Windows\System32\DriverStore\FileRepository

# 创建驱动备份目录 D:\DriversBackup
mkdir D:\DriversBackup

# 备份驱动
dism /online /export-driver /destination:D:\DriversBackup

# 还原驱动
Dism /online /Add-Driver /Driver:D:\DriversBackup /Recurse
```

## GPT,MBR UEFI+GPT 和 Legacy+MBR

- [三分钟告诉你 MBR 和 GPT 的区别，选择适合自己的](http://www.360doc.com/content/18/0901/23/11935121_783145790.shtml)
- [硬盘分区时 GPT 和 MBR 的区别/选择 - EasonJim - 博客园](https://www.cnblogs.com/EasonJim/p/6056121.html)
- [UEFI+GPT 和 Legacy+MBR 两种模式安装的系统有什么区别](https://baijiahao.baidu.com/s?id=1645728854626561254&wfr=spider&for=pc)

### 1. 了解专业名词

```c#
BIOS，全称"Basic Input Output System"，中文名称"基本输入输出系统"。

UEFI，全称"Unified Extensible Firmware Interface"，中文名称"统一的可扩展固件接口"。

GPT分区，全称"GUID Partition Table"，中文名称"全局唯一标识磁盘分区表"。

MBR分区，全称"Master Boot Record"，中文名称"主引导记录"。
```

### 2. 了解专业名词

```c#
最明显的区别是MBR最大支持2T的硬盘，而GPT则更大。

1、最先出现在Windows8中设置新磁盘，系统会询问你是想要使用MBR还是GPT分区，GPT是一种新的硬盘分区标准。GPT带来了很多新特性，最大支持18EB的大容量（EB=1024 PB，PB=1024 TB）；MBR最大只支持2TB，但拥有最好的兼容性。

2、MBR分区：MBR的意思是“主引导记录”，它有自己的启动器，也就是启动代码，一旦启动代码被破坏，系统就没法启动，只有通过修复才能启动系统。最大支持2TB容量，在容量方面存在着极大的瓶颈，那么GPT在今后的发展就会越来越占优势，MBR也会逐渐被GPT取代。

3、GPT分区：GPT意为GUID分区表，这是一个正逐渐取代MBR的新标准，它由UEFI辅住而形成的，这样就有了UEFI用于取代老旧的BIOS，而GPT则取代老旧的MBR。这个标准没有MBR的那些限制。磁盘驱动器容量可以大得多，大到操作系统和文件系统都没法支持。它同时还支持几乎无限个分区数量，限制只在于操作系统，Windows支持最多128个GPT分区。通过UEFI，所有的64位的win10，win8，win7和Vista，以及所对应的服务器都能从GPT启动。

4、MBR对应的是利用BISO选择启动器代码，GPT对应是利用UEFI选择启动。
```

### 3. BIOS 和 UEFI 启动的区别

```c#
BIOS+MBR模式：（Legacy+MBR）

1、这种启动模式兼容性较好

2、可以安装32位和64位系统

3、硬盘分区最大支持支持2TB

4、理论支持安装Windows所有版本的系统

UEFI+GPT模式：

1、只能安装64位系统

3、硬盘分区最大支持18EB，基本上算是无限大

4、启动速度更快

5、为用户提供更高级的图形界面

6、支持鼠标使用

7、安全启动，防止在启动前环境中运行的恶意软件和rootkit

8、提供独立于CPU架构的模块化接口，也为基于EFI驱动程序（称为EBC-EFI字节码）的应用和设备提供模块化接口

9、能够与BIOS并行运行

10、理论仅支持win8以上的操作系统
```

### 4. 总结

```c#
可以看出UEFI+GPT模式安装的系统启动速度更快，更安全，同时支持的硬盘分区大小没有限制，而Legacy+MBR模式安装的系统基本兼容Windows所有操作系统，不管是32位还是64位，但是也有最大的缺点就是不支持2TB的硬盘以及容易系统引导损坏。
```
