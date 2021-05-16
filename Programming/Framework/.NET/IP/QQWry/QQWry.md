# IP_qqwry

- [JadynWong/IP_qqwry](https://github.com/JadynWong/IP_qqwry)
- [读取纯真 IP 数据库的公用组件 QQWry.NET - 阿不 - 博客园](https://www.cnblogs.com/hjf1223/archive/2008/06/19/QQWry_net.html)

## 安装

- [QQWry 1.1.15](https://www.nuget.org/packages/QQWry)

```c#
QQWry
Install-Package QQWry -Version 1.1.15
// 依赖:
SharpZipLib
```

## 常用

- [IP 地址数据库（纯真版）下载](http://www.cz88.net/ip/)

```c#
var config = new QQWryOptions()
{
    DbPath = MapRootPath("~/IP/qqwry.dat")
};

var ipSearch = new QQWryIpSearch(config);

foreach (var ip in preSearchIpArray)
{
    var ipLocation = ipSearch.GetIpLocation(ip);
    Write(ipLocation);
}
Console.WriteLine("记录总数" + ipSearch.IpCount);
Console.WriteLine("版本" + ipSearch.Version);
```
