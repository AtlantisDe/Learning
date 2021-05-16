# Hard disk usage

- [Windows Command line get disk space in GB](https://superuser.com/questions/896764/windows-command-line-get-disk-space-in-gb)

```c#
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace

Write-Host ("{0}GB total" -f [math]::truncate($disk.Size / 1GB))
Write-Host ("{0}GB free" -f [math]::truncate($disk.FreeSpace / 1GB))

```
