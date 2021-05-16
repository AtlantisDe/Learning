# cli

```c#
// loadpercentage 负载百分比
wmic cpu get loadpercentage

wmic computersystem get TotalPhysicalMemory

wmic computersystem get UserName



```

## 常用

### 1. computersystem

```c#
wmic computersystem get UserName

AdminPasswordStatus
AutomaticManagedPagefile
AutomaticResetBootOption
AutomaticResetCapability
BootOptionOnLimit
BootOptionOnWatchDog
BootROMSupported
BootStatus
BootupState
Caption
ChassisBootupState
ChassisSKUNumber
CreationClassName

CurrentTimeZone
DaylightInEffect
Description


DNSHostName
Domain

DomainRole
EnableDaylightSavingsTime
FrontPanelResetStatus
HypervisorPresent
InfraredSupported
InitialLoadInfo
InstallDate
KeyboardPasswordStatus
LastLoadInfo
Manufacturer

Model




Name

NameFormat
NetworkServerModeEnabled
NumberOfLogicalProcessors
NumberOfProcessors
OEMLogoBitmap
OEMStringArray


PartOfDomain
PauseAfterReset
PCSystemType
PCSystemTypeEx
PowerManagementCapabilities
PowerManagementSupported
PowerOnPasswordStatus
PowerState
PowerSupplyState
PrimaryOwnerContact
PrimaryOwnerName
ResetCapability
ResetCount
ResetLimit
Roles






Status
SupportContactDescription
SystemFamily

SystemSKUNumber
SystemStartupDelay
SystemStartupOptions
SystemStartupSetting
SystemType

ThermalState
TotalPhysicalMemory
UserName


WakeUpType
Workgroup
```

### 2. cpu

```c#
wmic cpu get loadpercentage

AddressWidth
Architecture
AssetTag
Availability
Caption

Characteristics
ConfigManagerErrorCode
ConfigManagerUserConfig
CpuStatus
CreationClassName
CurrentClockSpeed
CurrentVoltage
DataWidth
Description






DeviceID
ErrorCleared
ErrorDescription
ExtClock
Family
InstallDate
L2CacheSize
L2CacheSpeed
L3CacheSize
L3CacheSpeed
LastErrorCode
Level
LoadPercentage
Manufacturer
MaxClockSpeed
Name



 NumberOfCores
NumberOfEnabledCore
NumberOfLogicalProcessors
OtherFamilyDescription
PartNumber






PNPDeviceID
PowerManagementCapabilities
PowerManagementSupported
ProcessorId


 ProcessorType
Revision
Role
SecondLevelAddressTranslationExtensions
SerialNumber





SocketDesignation
Status
StatusInfo
Stepping
SystemCreationClassName
SystemName
ThreadCount
UniqueId
UpgradeMethod
Version
VirtualizationFirmwareEnabled
VMMonitorModeExtensions
VoltageCaps
```

### 3. OS

```c#
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


BootDevice
BuildNumber
BuildType





Caption



 CodeSet
CountryCode
CreationClassName


CSCreationClassName
 CSDVersion
CSName
CurrentTimeZone
DataExecutionPrevention_32BitApplications
DataExecutionPrevention_Available
DataExecutionPrevention_Drivers
DataExecutionPrevention_SupportPolicy
Debug
Description
Distributed
EncryptionLevel
ForegroundApplicationBoost
FreePhysicalMemory
FreeSpaceInPagingFiles
FreeVirtualMemory
InstallDate
 LargeSystemCache
LastBootUpTime





 LocalDateTime






Locale
Manufacturer




 MaxNumberOfProcesses
MaxProcessMemorySize
MUILanguages
Name





 NumberOfLicensedUsers
NumberOfProcesses
NumberOfUsers
OperatingSystemSKU
Organization
OSArchitecture
OSLanguage
OSProductSuite
OSType
OtherTypeDescription
PAEEnabled
PlusProductID
PlusVersionNumber
PortableOperatingSystem
Primary
ProductType
RegisteredUser
SerialNumber





 ServicePackMajorVersion
ServicePackMinorVersion
SizeStoredInPagingFiles
Status
SuiteMask
SystemDevice





 SystemDirectory


SystemDrive
TotalSwapSpaceSize
TotalVirtualMemorySize
TotalVisibleMemorySize
Version

 WindowsDirectory
```
