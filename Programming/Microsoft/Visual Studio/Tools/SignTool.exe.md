# SignTool.exe

- [SignTool.exe（签名工具）](https://docs.microsoft.com/zh-cn/dotnet/framework/tools/signtool-exe)

## 常用

```c#
signtool [command] [options] [file_name | ...]
// 以下命令使用存储在受密码保护的 PFX 文件中的证书对文件进行数字签名。
signtool sign /f MyCert.pfx /p MyPassword MyFile.exe


```
