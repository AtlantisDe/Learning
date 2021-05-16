# .NET Standard

- [.NET 体系结构组件](https://docs.microsoft.com/zh-cn/dotnet/standard/components)
- [.NET Standard](https://docs.microsoft.com/zh-cn/dotnet/standard/net-standard)
- [.NET 库的跨平台定位](https://docs.microsoft.com/zh-cn/dotnet/standard/library-guidance/cross-platform-targeting)
- [.NET 体系结构（.net core、.net framework、xamarin 之间的关系） - 守望雲影 - 博客园](https://www.cnblogs.com/swyy/p/7440766.html)
- [类库 .net core .net standard 区别*已解决*博问 博客园](https://q.cnblogs.com/q/105651)
- [.NET Standard](https://baike.baidu.com/item/.NET%20Standard/20797058?fr=aladdin)
- [.NET Core 和.NET Standard 有什么不同](https://blog.csdn.net/chenhaifeng2016/article/details/78224236)
- [使用 NuGet 管理 C++项目的依赖库](https://blog.csdn.net/china_jeffery/article/details/86247494)

## .NET Core 和.NET Standard 有什么不同

- [【转】托管代码和非托管代码的区别](https://www.cnblogs.com/devhuichen/p/4942326.html)
- [.Net 三种实现以及跨平台 - Gary Zhu 的专栏 - CSDN 博客](https://blog.csdn.net/zhurongboyitu/article/details/78709308)

- .NET Standard

- 托管框架的每一种实现都有一套自己的基类库。基类库（BCL）包含诸如异常处理、字符串、XML、I/O、网络和集合这样的类。
- .NET Standard 是一项实现 BCL 的规范。由于.NET 实现需要遵循这项规范，所以应用程序开发人员就不用担心每一种托管框架实现的 BCL 不同。
- 框架类库（FCL），如 WPF、WCF、ASP.NET，不包含在 BCL 中，因此，也就不包含在.NET Standard 中。
- NET Standard 与.NET 实现之间的关系就和 HTML 规范与浏览器之间的关系一样。后者是前者的实现。
- 因此，.NET Framework、Xamarin 和.NET Core，每一种托管框架都实现了.NET Standard 中的 BCL。随着计算机工业不断推出新的硬件和操作系统，将来还会出现新的.NET 托管框架。该标准让应用程序开发人员知道，他们可以依赖于一套始终如一的 API。

```C#

```
