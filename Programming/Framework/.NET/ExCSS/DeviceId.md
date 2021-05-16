# DeviceId

- [DeviceId 5.1.1](https://www.nuget.org/packages/DeviceId/)

```c#
// 提供生成“设备ID”的功能，可用于唯一标识计算机。
// Provides functionality to generate a 'device ID' that can be used to uniquely identify a computer.

DeviceId
Install-Package DeviceId -Version 5.1.1
```

## 常用

```c#
string deviceId = new DeviceIdBuilder()
    .AddMachineName()
    .AddProcessorId()
    .AddMotherboardSerialNumber()
    .AddSystemDriveSerialNumber()
    .ToString();
```
