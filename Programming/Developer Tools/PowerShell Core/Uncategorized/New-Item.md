# New-Item

- [New-Item (Microsoft.PowerShell.Management) - PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7)
- [Create a Folder If Not Exists in PowerShell - MorganTechSpace](https://morgantechspace.com/2015/06/powershell-create-a-folder-if-not-exists.html)

## 常用

```c#
New-Item -ItemType "directory" -Path "c:\ps-test\scripts"

$dir = "C:\ShareTest"
if(!(Test-Path -Path $dir )){
    New-Item -ItemType directory -Path $dir
    Write-Host "New folder created"
}
else
{
  Write-Host "Folder already exists"
}
```
