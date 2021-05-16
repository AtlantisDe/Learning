# HashSet

- [HashSet Class (System.Collections.Generic)](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.hashset-1?view=netcore-3.1)
- [Enumerable.FirstOrDefault Method (System.Linq)](https://docs.microsoft.com/en-us/dotnet/api/system.linq.enumerable.firstordefault?view=netcore-3.1)
- [Get random element from hashset?](https://stackoverflow.com/questions/10654292/get-random-element-from-hashset/15960061)
- [Concurrent HashSet&lt;T&gt; in .NET Framework?](https://stackoverflow.com/questions/18922985/concurrent-hashsett-in-net-framework)
- [https://stackoom.com/question/1xVxO/%E5%9C%A8HashSet%E4%B8%AD%E5%8C%85%E5%90%AB%E7%BA%BF%E7%A8%8B%E5%AE%89%E5%85%A8%E5%90%97-T](https://stackoom.com/question/1xVxO/%E5%9C%A8HashSet%E4%B8%AD%E5%8C%85%E5%90%AB%E7%BA%BF%E7%A8%8B%E5%AE%89%E5%85%A8%E5%90%97-T)

## 常用

### 1. List 去重

```c#

// Without locking, these operations are not thread safe. Given the added overhead of ConcurrentDictionary<T,byte> , it's probably wiser just to use the lighter weight HashSet<T> and just surround everything in locks.

// 没有锁定,这个不是线程安全,切记.

var hs = new HashSet<string>();

var hs = new HashSet<string>(items);

HashSet<string> hs = new HashSet<string>(list);

HashSet<string> hs = new HashSet<string>(root.Domains);
root.Domains = new List<string>();
foreach (var item in hs)
{
    root.Domains.Add(item);
}


HashSet<int> evenNumbers = new HashSet<int>();
HashSet<int> oddNumbers = new HashSet<int>();

// HashSet<T>.Contains(T) Method


// 线程安全情况需要锁定
HashSet<int> hs = new HashSet<int>();
var lockgo = new object();
lock (lockgo)
{
    hs.Add(item);
}
```
