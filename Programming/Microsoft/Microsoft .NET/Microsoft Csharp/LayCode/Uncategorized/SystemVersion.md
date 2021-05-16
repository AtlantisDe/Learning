# SystemVersion

- [Version Class (System)](https://docs.microsoft.com/en-us/dotnet/api/system.version?view=netcore-3.1)
- [C#自带的 Version 判断版本号的大小 - zipon - 博客园](https://www.cnblogs.com/zipon/p/11153210.html)

## 常用

```c#
Version version1 = new Version("1.0.0.25");
Version version2 = new Version("1.0.0.24");

Console.Write(version1 > version2);

// True
```
