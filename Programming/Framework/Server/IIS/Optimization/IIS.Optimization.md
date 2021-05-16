# IIS.Optimization

- [解决 ASP.Net 第一次访问慢的处理（IIS8） - 魔力大王 - 博客园](https://www.cnblogs.com/mldw/p/6259450.html)
- [ASP.NET 网站第一次访问慢的解决方法](https://www.jb51.net/article/110492.htm)
- [IIS：连接数、并发连接数 - Agoly - 博客园](https://www.cnblogs.com/qmfsun/p/4997307.html)
- IIS：连接数、并发连接数、最大并发工作线程数、应用程序池的队列长度、应用程序池的最大工作进程数详解
- [聊一聊如何搭建高性能网站哪一些事 - 程序员修炼之旅 - 博客园](https://www.cnblogs.com/xiaoXuZhi/p/xyh_20201014.html)

## 优化

### 0. 数据监测与方法

```c#
// 新建IIS并发连接数监控器
1. 运行-->输入“perfmon.msc”
2. 在“系统监视器”图表区域里点击右键，然后点“添加计数器”
3. 在“添加计数器”窗口，“性能对象”选择Web Service，“从列表选择计数器”选中Current Connection，“从列表选择实例”选中你要统计的站点，最后点击“添加”按钮
```

### 0. IIS 6.0 允许将应用程序池配置成一个 Web 园（Web Garden）

```c#

```

### 1. 应用程序初始化工具包

- [IIS7.5 配置应用程序初始化功能 - 虎头 - 博客园](https://www.cnblogs.com/50614090/p/8808433.html)

```c#
// 编辑网站对应应用程序池启动模式，操作路径：应用程序池 -> 网站对应程序池 -> 右键，高级设置 ->选择，启动模式 AlwaysRunning
// 开启对应网站预加载，操作路径：网站 -> 对应网站 -> 右键，高级设置 ->选择，预加载已启用 True
```

### 2. 安装应用程序初始化(appwarmup_x64)

- Application Initialization 1.0 for IIS 7.5 (x64)
- [Download Application Initialization 1.0 for IIS 7.5 (x64) from Official Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=30433)

```c#
https://download.microsoft.com/download/0/A/6/0A6790C9-C209-40A9-B4AB-94693A3CD075/appwarmup_x64.msi
```

### 3. IIS 配置

- [IIS：连接数、并发连接数、最大并发工作线程数、应用程序池的队列长度、应用程序池的最大工作进程数详解](https://blog.csdn.net/abbbbccccccc/article/details/107960973)
- [iis 最大工作进程数 weixin_30741653](https://blog.csdn.net/weixin_30741653/article/details/96300013)
