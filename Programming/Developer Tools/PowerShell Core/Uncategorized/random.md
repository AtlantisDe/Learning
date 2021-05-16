# random

- [PowerShell 生成随机密码 weixin_33950035  powershell 生成随机密码](https://blog.csdn.net/weixin_33950035/article/details/90069747)
- [PowerShell](http://www.splaybow.com/post/powershell-create-random-password.html)
- [Membership.GeneratePassword(Int32, Int32) Method (System.Web.Security)](https://docs.microsoft.com/en-us/dotnet/api/system.web.security.membership.generatepassword?redirectedfrom=MSDN&view=netframework-4.8#System_Web_Security_Membership_GeneratePassword_System_Int32_System_Int32_)

## 常用

```c#
// Membership.GeneratePassword(Int32, Int32) Method
Add-Type -AssemblyName System.Web
$global:passwordrandom = [System.Web.Security.Membership]::GeneratePassword(8, 1)

```
