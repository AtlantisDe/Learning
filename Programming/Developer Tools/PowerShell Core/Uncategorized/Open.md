# Open ps file

- [在 cmd 中直接运行 PowerShell 脚本文件 &#8211; PowerShell 中文博客](https://www.pstips.net/invoke-ps1-in-cmd.html)

## 常用

```c#
PowerShell.exe -file a.ps1
ftype Microsoft.Powershellscript.1="%SystemRoot%\system32\windowspowershell\v1.0\powershell.exe" "%1"
```
