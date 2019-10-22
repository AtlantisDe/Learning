# certutil

- [Windows 系统中通过命令查看文件的 MD5,SHA1,SHA256 校验值](https://blog.csdn.net/ternence_hsu/article/details/79461305)

## 常用

```c#
命令格式如下：

certutil -hashfile yourfilename MD5

certutil -hashfile yourfilename SHA1

certutil -hashfile yourfilename SHA256


certutil -hashfile "C:\WINDOWS\system32\cmd.exe" MD5

certutil -hashfile "C:\WINDOWS\system32\cmd.exe" MD5 >>c:\test.txt

```
