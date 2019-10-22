# IIS.Optimization

- [解决 ASP.Net 第一次访问慢的处理（IIS8） - 魔力大王 - 博客园](https://www.cnblogs.com/mldw/p/6259450.html)
- [ASP.NET 网站第一次访问慢的解决方法](https://www.jb51.net/article/110492.htm)

## 优化

### 1. 应用程序初始化工具包

- [IIS7.5 配置应用程序初始化功能 - 虎头 - 博客园](https://www.cnblogs.com/50614090/p/8808433.html)

```c#
// 编辑网站对应应用程序池启动模式，操作路径：应用程序池 -> 网站对应程序池 -> 右键，高级设置 ->选择，启动模式 AlwaysRunning
// 开启对应网站预加载，操作路径：网站 -> 对应网站 -> 右键，高级设置 ->选择，预加载已启用 True
```

### 安装应用程序初始化(appwarmup_x64)

- Application Initialization 1.0 for IIS 7.5 (x64)
- [Download Application Initialization 1.0 for IIS 7.5 (x64) from Official Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=30433)

```c#
https://download.microsoft.com/download/0/A/6/0A6790C9-C209-40A9-B4AB-94693A3CD075/appwarmup_x64.msi
```
