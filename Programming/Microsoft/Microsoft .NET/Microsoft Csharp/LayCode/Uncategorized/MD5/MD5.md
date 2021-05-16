# MD5

- [MD5 Class (System.Security.Cryptography)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.md5?view=netframework-4.8)
- [关于 MD5 32 位和 16 位的区别以及 linux /etc/shadow 文件详解*Yumao*](https://blog.csdn.net/p358278505/article/details/78863181)

## 常用

```c#
// 其实16位的长度，是从32位md5值来的。是将32位md5去掉前八位，去掉后八位得到的。
int hashcode = filename.GetHashCode();
```
