# rdpclip

- [Windows 远程桌面(mstsc)不能复制粘贴的解决办法](https://www.cnblogs.com/xusweeter/p/7569506.html)

## 不能复制粘贴的解决办法

```shell
# 在远程Windows服务器中重启“rdpclip.exe”进程即可。

1、打开资源管理器，杀掉rdpclip.exe进程；
2、开始——》运行，输入：rdpclip.exe，回车重启该进程。
3、此时粘贴文件或者文字发现已经可以粘贴了。
```
