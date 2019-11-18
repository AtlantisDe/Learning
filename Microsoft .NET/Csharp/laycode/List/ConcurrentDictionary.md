# ConcurrentDictionary

- using System.Collections.Concurrent;
- [ConcurrentDictionary<TKey,TValue> Class (System.Collections.Concurrent)](https://docs.microsoft.com/en-us/dotnet/api/system.collections.concurrent.concurrentdictionary-2?view=netframework-4.8)
- [ConcurrentDictionary 并发字典知多少?\_CoderAyu](http://www.sohu.com/a/302815017_120050810)
- [ConcurrentDictionary 的 key 判断存在的两种方式，用错了慢 100 倍 - 小书丶 - 博客园](https://www.cnblogs.com/Iamsorry/p/10235027.html)
- [https://blog.csdn.net/wlanye/article/details/8668089](https://blog.csdn.net/wlanye/article/details/8668089)
- [ConcurrentDictionary 并发字典知多少? - 码农阿宇 - 博客园](https://www.cnblogs.com/CoderAyu/p/10549409.html)
- [改进 ConcurrentDictionary 并行使用的性能 - 匠心十年 - 博客园](https://www.cnblogs.com/gaochundong/p/concurrent_dictionary_with_lazy.html)

## 0. 线程介绍

- 自定义 Dictionary 支持线程安全
- oncurrentDictionary 中较为基础重点的方法分别位 Add,Get,Remove,Grow Table 方法

```c#
// 线程安全集合类
ConcurrentQueue<T>
ConcurrentStack<T>
ConcurrentBag<T>
ConcurrentDictionary<TKey,TValue>
// 非线程安全集合类
Queue<T>
Stack<T>
List<T>
Dictionary<TKey,TValue>
```

## 1. 常用

### 0. 读取 写 操作

```c#
var Items = new ConcurrentDictionary<string, string>();

Extensions = new ConcurrentDictionary<string, string>();
Extensions = new ConcurrentDictionary<string, string>();

public static ConcurrentDictionary<string, string> Extensions = new ConcurrentDictionary<string, string>();
public static ConcurrentDictionary<string, string> Extensions = new System.Collections.Concurrent.ConcurrentDictionary<string, string>();
```

### 1. ConcurrentDictionary 的 key 判断存在的两种方式，用错了慢 100 倍

```c#
Domains.ContainsKey("");

// 其中经常做Key是否存在的判断。通常有两种：


1.dictionary.Keys.Contains(key)
2.dictionary.ContainsKey(key)

1.dictionary.Keys.Contains(key) //拿到所有key，在查询，复杂度：o(n)
2.dictionary.ContainsKey(key) //hash查询，复杂度：o(1)

```

### 2. 安全线程字典修改操作

```c#
注意:SET 参数对象值 一律不能null 否则引发异常  变通方案可以设置为""空
常用标记 操作写法

正确写法
Hash.SetMemoryCacheDefault("");
错误写法
Hash.SetMemoryCacheDefault(null);

Items.TryAdd(null, null);
Key不能为null

Items.TryAdd("", null);
可以

var Items = new ConcurrentDictionary<string, string>();
Items.TryAdd("1", null);
Items.TryAdd("1", null);

Parallel.For(0, 100, new ParallelOptions() { MaxDegreeOfParallelism = 50 }, (i, loopState) =>
{
    Items.TryUpdate("1", i.ToString(), null);
});
Console.WriteLine("{0}", Items.Count);
Console.WriteLine("安全线程字典修改操作结束");
```

### 3. 取值与 无变更值 Demo

```c#
public class DemoItem
{
    public ConcurrentDictionary<string, string> SafeDicStringItems { get; set; }
    public string name { get; set; }
}

DemoItem demoItem = new DemoItem();
demoItem.SafeDicStringItems = new ConcurrentDictionary<string, string>();
demoItem.SafeDicStringItems.TryAdd("1", "sky");
demoItem.SafeDicStringItems.TryAdd("2", "space");
demoItem.name = "字典虚化测试";

ConcurrentDictionary<string, object> SafeItems;
SafeItems = new ConcurrentDictionary<string, object>();

SafeItems.TryAdd("1", "hello");
object cc;
SafeItems.TryGetValue("1", out cc);
cc = "world";

SafeItems.TryUpdate("1", cc, "John");

SafeItems.TryUpdate("1", "hello", "John");

SafeItems.TryUpdate("1", "MM", "hello");

SafeItems.TryAdd("2", demoItem);

Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(SafeItems));

```
