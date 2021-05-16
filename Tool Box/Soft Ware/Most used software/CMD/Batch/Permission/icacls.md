# Icacls

- [icacls](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls)
- [icacls](https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/icacls)

## 语法

```c#
icacls <filename> [/grant[:r] <sid>:<perm>[...]] [/deny <sid>:<perm>[...]] [/remove[:g|:d]] <sid>[...]] [/t] [/c] [/l] [/q] [/setintegritylevel <Level>:<policy>[...]]
icacls <directory> [/substitute <sidold> <sidnew> [...]] [/restore <aclfile> [/c] [/l] [/q]]

// 将授予用户对文件删除和写入 DAC 的管理员权限。
icacls file /grant Administrator:(D,WDAC)

Icacls "C:\Tmp\1.txt" /grant everyone:N

// 查看权限
Icacls "C:\Tmp\1.txt"

// 拒绝权限: 完全访问权限
Icacls "C:\Tmp\1.txt" /deny Everyone:(F)
Icacls "C:\Tmp\1.txt" /deny Everyone:(R)


// 设置Everyone用户无删除删除权限 需要管理才能删除
Icacls "C:\Tmp\1.txt" /deny Everyone:(DE) *S-1-5-7:(DC)

C:\Tmp\1.txt Everyone:(N)
```
