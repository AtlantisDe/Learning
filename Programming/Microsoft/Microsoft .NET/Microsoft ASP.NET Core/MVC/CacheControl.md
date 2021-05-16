# CacheControl

- [彻底弄懂 HTTP 缓存机制及原理 - 云中桥 - 博客园](https://www.cnblogs.com/chenqf/p/6386163.html)
- [Cache-Control](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/Cache-Control)
- [c＃-在 Web API 中设置 HTTP 缓存控制标头 - ITranslater](https://www.itranslater.com/qa/details/2582633927810745344)
- [JavaWeb 学习记录（一）——response 响应头之缓存设置与下载功能的实现 - 如何静 - 博客园](https://www.cnblogs.com/ly-radiata/p/4344712.html)
- [设置 ASP.NET 页面不被缓存(客户端/服务器端取消缓存方法)](https://www.jb51.net/article/39006.htm)
- [HTTP 的缓存设置 Cache-Control 学习笔记-CSDN 博客](https://blog.csdn.net/bzehong/article/details/89337504)
- [Response caching in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/performance/caching/response?view=aspnetcore-3.1)
- [Response Caching &mdash; ASP.NET documentation](https://jakeydocs.readthedocs.io/en/latest/performance/caching/response.html)
- [HttpContext.Current.Cache 和 HttpRuntime.Cache 的区别，以及 System.Runtime.Caching - jack_Meng - 博客园](https://www.cnblogs.com/mq0036/p/7016677.html)

## 常用

### 1. 强制缓存

```c#
语法
指令不区分大小写，并且具有可选参数，可以用令牌或者带引号的字符串语法。多个指令以逗号分隔。

// 对于强制缓存来说，响应header中会有两个字段来标明失效规则（Expires/Cache-Control）
// 使用chrome的开发者工具，可以很明显的看到对于强制缓存生效时，网络请求的情况

// Expires的值为服务端返回的到期时间，即下一次请求时，请求时间小于服务端返回的到期时间，直接使用缓存数据。
// 不过Expires 是HTTP 1.0的东西，现在默认浏览器均默认使用HTTP 1.1，所以它的作用基本忽略

// 另一个问题是，到期时间是由服务端生成的，但是客户端时间可能跟服务端时间有误差，这就会导致缓存命中的误差。
// 所以HTTP 1.1 的版本，使用Cache-Control替代。
```

### 2. Cache-Control

```c#
// Cache-Control 是最重要的规则。常见的取值有private、public、no-cache、max-age，no-store，默认为private。
// private:             客户端可以缓存
// public:              客户端和代理服务器都可缓存（前端的同学，可以认为public和private是一样的）
// max-age=xxx:   缓存的内容将在 xxx 秒后失效
// no-cache:          需要使用对比缓存来验证缓存数据（后面介绍）
// no-store:           所有内容都不会缓存，强制缓存，对比缓存都不会触发（对于前端开发来说，缓存越多越好，so...基本上和它说886）
```

### 3. 缓存请求指令

```c#
// 客户端可以在HTTP请求中使用的标准 Cache-Control 指令。

Cache-Control: max-age=<seconds>
Cache-Control: max-stale[=<seconds>]
Cache-Control: min-fresh=<seconds>
Cache-control: no-cache
Cache-control: no-store
Cache-control: no-transform
Cache-control: only-if-cached
```

### 4. 缓存响应指令

```c#
// 服务器可以在响应中使用的标准 Cache-Control 指令。

Cache-control: must-revalidate
Cache-control: no-cache
Cache-control: no-store
Cache-control: no-transform
Cache-control: public
Cache-control: private
Cache-control: proxy-revalidate
Cache-Control: max-age=<seconds>
Cache-control: s-maxage=<seconds>
```

### 5 . 扩展 Cache-Control 指令

```c#
// 拓展缓存指令不是核心HTTP缓存标准文档的一部分，使用前请注意检查兼容性！

Cache-control: immutable
Cache-control: stale-while-revalidate=<seconds>
Cache-control: stale-if-error=<seconds>
```
