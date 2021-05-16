# Json

- [ConvertFrom-Json (Microsoft.PowerShell.Utility) - PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertfrom-json?view=powershell-7)
- [ConvertTo-Json (Microsoft.PowerShell.Utility) - PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-json?view=powershell-7)
- [Powershell 往 JSON 格式中添加数据](https://www.jianshu.com/p/9db5e6a590d2)
- [PowerShell 将字符串转换为 json - Thinbug](https://www.thinbug.com/q/33217907)
- [PowerShell : retrieve JSON object by field value](https://stackoverflow.com/questions/16575419/powershell-retrieve-json-object-by-field-value)

## 常用

```c#
ConvertTo-Json | ConvertFrom-Json

$jobj = ConvertTo-Json -InputObject $str

// 外部添加内容
$json = '{"mem":[[1377691200,10],[1377770400,0]],"proc":[[1377691200,80],[1377770400,0]]}'
$jobj = ConvertFrom-Json -InputObject $json
$datetime = 1377780400
$proc = 85
$add = @($datetime, $proc)
$jobj.proc += ,$add
cls
ConvertTo-Json $jobj

```
