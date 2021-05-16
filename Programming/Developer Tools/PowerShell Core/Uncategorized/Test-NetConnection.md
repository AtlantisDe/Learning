# Test-NetConnection

- [Test-NetConnection](<https://docs.microsoft.com/en-us/previous-versions/windows/powershell-scripting/dn372891(v=wps.630)?redirectedfrom=MSDN>)
- [PowerShell 之 Test-NetConnection 与 Ping 相比-百度经验](https://jingyan.baidu.com/article/d5c4b52bc57402da560dc5f2.html)

## 常用

```c#
Test-NetConnection

Test-NetConnection -Port 80 -InformationLevel Detailed

Test-NetConnection -ComputerName www.contoso.com -InformationLevel Detailed


Test-NetConnection www.baidu.com -Port 80
Test-NetConnection www.baidu.com -Port 7280

Test-NetConnection 14.215.177.39 -Port 80
Test-NetConnection 14.215.177.39 -Port 7280
```
