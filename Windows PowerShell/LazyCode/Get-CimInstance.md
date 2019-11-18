# Get-CimInstance

- [How do I get total physical memory size using PowerShell without WMI?](https://stackoverflow.com/questions/17681234/how-do-i-get-total-physical-memory-size-using-powershell-without-wmi)

```c#
Get-CimInstance Win32_PhysicalMemory

(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb


Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | Foreach {"{0:N2}" -f ([math]::round(($_.Sum / 1GB),2))}


$totalmemory = Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | Foreach {"{0:N2}" -f ([math]::round(($_.Sum / 1GB),2))}
$totalmemory

```
