# cpu

- [How do I find the CPU and RAM usage using PowerShell?](https://stackoverflow.com/questions/6298941/how-do-i-find-the-cpu-and-ram-usage-using-powershell)

```c#
Get-WmiObject win32_processor | select LoadPercentage  |fl
Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average

```
