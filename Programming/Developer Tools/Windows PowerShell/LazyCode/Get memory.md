# Get memory

- [Get memory utilization report using PowerShell - Powershellbros.com](https://www.powershellbros.com/get-memory-utilization-report-using-powershell/)
- [How to get free physical memory of remote computer using PowerShell](https://stackoverflow.com/questions/12250783/how-to-get-free-physical-memory-of-remote-computer-using-powershell)
- [Simple PowerShell Script displays Total and Available Memory .](https://chinnychukwudozie.com/2015/11/10/simple-powershell-script-displays-total-and-available-memory/)
- [PowerTip: Use PowerShell to Round Numbers | Scripting Blog](https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-round-numbers/)

```c#
Get-WmiObject Win32_OperatingSystem | fl *free*

Get-WmiObject Win32_OperatingSystem | fl *size*

(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb

Get-CimInstance Win32_PhysicalMemory | fl *capacity*

wmic.exe OS get FreePhysicalMemory

UsedMemory=TotalMemory - AvailableMemory

[Math]::Round((Get-WmiObject -Class win32_computersystem -ComputerName localhost).TotalPhysicalMemory/1Gb)

(Get-WmiObject -Class win32_computersystem -ComputerName localhost).TotalPhysicalMemory/1Gb


wmic OS get TotalVisibleMemorySize /Value
wmic OS get FreePhysicalMemory,FreeVirtualMemory,FreeSpaceInPagingFiles /VALUE

FreePhysicalMemory=22105248
FreeSpaceInPagingFiles=4942004
FreeVirtualMemory=25396484

Free Physical Memory =22105248
Free SpaceIn PagingFiles =4942004
Free Virtual Memory=25396484

可用物理内存= 22105248
分页文件中的可用空间= 4942004
可用虚拟内存= 25396484



Get-WmiObject WIN32_PROCESS | Sort-Object -Property ws -Descending | Select-Object -first 5 ProcessID,Name,WS

Get-WmiObject win32_OperatingSystem |%{"Total Physical Memory: {0}KB`nFree Physical Memory : {1}KB`nTotal Virtual Memory : {2}KB`nFree Virtual Memory  : {3}KB" -f $_.totalvisiblememorysize, $_.freephysicalmemory, $_.totalvirtualmemorysize, $_.freevirtualmemory}


Get-WmiObject win32_OperatingSystem

Get-CimInstance Win32_PhysicalMemory





$totalPhysicalMem = $system.TotalVisibleMemorySize
$freePhysicalMem = $system.FreePhysicalMemory
$usedPhysicalMem = $totalPhysicalMem - $freePhysicalMem
$usedPhysicalMemPct = [math]::Round(($usedPhysicalMem / $totalPhysicalMem) * 100,1)


$driveLetters = Get-WmiObject Win32_Volume | select DriveLetter
foreach ($driveLetter in $driveLetters)
{
    $drive = Get-WmiObject Win32_Volume | where {$_.DriveLetter -eq $driveLetter.DriveLetter}
    $usedDiskSpace = $drive.Capacity - $drive.FreeSpace
    $usedDiskSpacePct = [math]::Round(($usedDiskSpace / $drive.Capacity) * 100,1)
}

```
