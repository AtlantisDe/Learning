# MemoryCache

- 版本要求 4.6.x
- C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.6\System.Runtime.Caching.dll
- [MemoryCache Class (System.Runtime.Caching)](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.caching.memorycache?view=netframework-4.8)
- [深入理解.NET MemoryCache - hkant - 博客园](https://www.cnblogs.com/zhu-wj/p/9166758.html)
- [缓存在内存中 ASP.NET Core](https://docs.microsoft.com/zh-cn/aspnet/core/performance/caching/memory?view=aspnetcore-3.0)
- [How to measure current size of .NET Memory Cache 4.0?](https://stackoverflow.com/questions/22392634/how-to-measure-current-size-of-net-memory-cache-4-0)
- [MemoryCache clear all](https://social.msdn.microsoft.com/Forums/vstudio/en-US/0295b899-c550-48c1-bd5d-841c45ec3c57/memorycache-clear-all?forum=csharpgeneral)
- [How do I clear a System.Runtime.Caching.MemoryCache](https://stackoverflow.com/questions/8043381/how-do-i-clear-a-system-runtime-caching-memorycache/8043556)
- [How to clear MemoryCache?](https://stackoverflow.com/questions/4183270/how-to-clear-memorycache)
- [c# – MemoryCache 不遵守配置中的内存限制](https://codeday.me/bug/20170713/36818.html)
- [https://blog.csdn.net/qq_36051316/article/details/83789301](https://blog.csdn.net/qq_36051316/article/details/83789301)
- [.NET Core MemoryCache 缓存获取全部缓存键 - ♀ 影 ☆ 响 - 博客园](https://www.cnblogs.com/dangzhensheng/p/8862567.html)

```c#
System.Runtime.Caching.MemoryCache

// 测试内存周期事件
var rst = key.MemoryCacheTimer(3, delegate { Console.WriteLine(DateTime.Now.Format1()); });

// 读赋值
var KeyHash1 = GoogleEmpire.Net.Core.Engine.Console.Const.CacheKeys.ArticleCategory;
items = KeyHash1.GetMemoryCacheDefault<List<CategoryInfo>>(null);
if (items.IsNullOrEmpty() == true)
{
    items = TArticleContent.Aggregate().Group(x => x.Category, g => new { Count = g.Count() }).As<CategoryInfo>().ToList();
    KeyHash1.SetMemoryCacheDefault(items, 5 * 60); 
}



// 允许存储空字符串,以Null判断
var KeyHash1 = site.ExtensionsNodes.PathBeforeBodyCode.Md5();
var HtmlInsertBeforeBodyCode = KeyHash1.GetMemoryCacheDefault<string>(null);
if (HtmlInsertBeforeBodyCode == null) {HtmlInsertBeforeBodyCode = site.ExtensionsNodes.PathBeforeBodyCode.ReadDocument(); KeyHash1.SetMemoryCacheDefault(HtmlInsertBeforeBodyCode, 10 * 60); }

// 读赋值 最后分支 存储

var KeyHash1 = $"{code}{setcode}{"F10"}";
var checkHtml = KeyHash1.GetMemoryCacheDefault<string>("");
if (checkHtml.IsNullOrEmpty() == false)
{
    return checkHtml;
}
else
{

    // 最后分支 存储
    KeyHash1.SetMemoryCacheDefault(checkHtml, 5 * 60);
}
```

## 1. 线程安全

- [分享基于 MemoryCache （内存缓存）的缓存工具类，C# B/S 、C/S 项目均可以使用！ - 梦在旅途 - 博客园](https://www.cnblogs.com/zuowj/archive/2018/02/11/8440902.html)
- [C# Memory Cache 踩坑记录 - 码农阿宇 - 博客园](https://www.cnblogs.com/CoderAyu/p/10242230.html)

```c#
// 注意:SET 参数对象值 一律不能null 否则引发异常  变通方案可以设置为""空
// 常用标记 操作写法

// 正确写法
Hash.SetMemoryCacheDefault("");

// 错误写法
Hash.SetMemoryCacheDefault(null);

// MemoryCache线程安全机制

// 根据MSDN的描述：MemoryCache是线程安全的。那么说明，在操作MemoryCache中的缓存项时，MemoryCache保证程序的行为都是原子性的，而不会出现多个线程共同操作导致的数据污染等问题。
// 那么，MemoryCache是如何做到这一点的？

// MemoryCache在内部使用加锁机制来保证数据项操作的原子性。该锁以每个MemoryCacheStore为单位，即同一个MemoryCacheStore内部的数据共享同一个锁，而不同MemoryCacheStore之间互不影响。


// 支持：可指定绝对过期时间、滑动过期明间、文件依赖  三种缓存方式，目前已在公司各种生产业务项目中有使用。优点是可以根据数据的使用频率设置缓存有效期，特别是文件依赖缓存，比如：连接字符串读取一次后，若CONFIG文件没有改变，则缓存永久有效，一旦CONFIG更改，则缓存失效需重新读取，保证数据缓存的最大可用性，减少不必要的多次重复读取CONFIG。
```

## 2. Cache in-memory in ASP.NET Core

- [Cache in-memory in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/performance/caching/memory?view=aspnetcore-3.0)

### 1. 清空缓存

```c#
// 在此基础上，编写了一种稍微有效的并行清除方法：
// Ran across this, and based on it, wrote a slightly more effective, parallel clear method:

public void ClearAll()
{
    var allKeys = _cache.Select(o => o.Key);
    Parallel.ForEach(allKeys, key => _cache.Remove(key));
}

var cacheKeys = MemoryCache.Default.Where(kvp.Value is MyType).Select(kvp => kvp.Key).ToList();
foreach (string cacheKey in cacheKeys)
{
    MemoryCache.Default.Remove(cacheKey);
}



var allKeys = MemoryCache.Default.Select(o => o.Key);
Parallel.ForEach(allKeys, key =>

Console.WriteLine(key)

);
```
