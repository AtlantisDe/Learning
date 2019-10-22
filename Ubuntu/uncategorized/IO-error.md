# print_req_error:I/O error,dev fd0,sector 0

- [print_req_error:I/O error,dev fd0,sector 0 &#8211; 迷途的工作](https://stray.work/print_req_errori-o-errordev-fd0sector-0/)
- [print_req_error: I/0 error](https://askubuntu.com/questions/1102580/print-req-error-i-0-error)

## 汇集

### 1. print_req_error:I/O error,dev fd0,sector 0

- 原因:在 VMware Esxi 上的虚拟机新安装 Ubuntu18 系统，在 upgrade 的时候出现如标题的提示，原因是默认的虚拟机是带有软盘驱动器的，但 ubuntu 系统无法读取。
- 解决方案:在虚拟机编辑设置里移除软盘驱动器。然后关闭虚拟机，设置下次启动从 bios 引导，启动虚拟机进入 bios，把软件驱动器 A 设置为 disabled，重启即可。
