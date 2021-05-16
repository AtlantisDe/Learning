# ConcurrentBag

- [ConcurrentBag<T> Class (System.Collections.Concurrent)](https://docs.microsoft.com/en-us/dotnet/api/system.collections.concurrent.concurrentbag-1?view=netframework-4.8)
- [https://blog.csdn.net/boonya/article/details/80541460](https://blog.csdn.net/boonya/article/details/80541460)
- [如何：使用 ConcurrentBag 创建目标池](https://docs.microsoft.com/zh-cn/dotnet/standard/collections/thread-safe/how-to-create-an-object-pool)
- [c#集合类的线程安全（整理）](https://blog.csdn.net/wlanye/article/details/8668089)
- [C# 并发安全集合 ConcurrentBag 取代 List](https://blog.csdn.net/boonya/article/details/80541460)
- [Production and consumption mode 生产消费模式](https://blog.csdn.net/u011109589/article/details/80519863)

```c#
// 本示例演示如何使用并发包来实现对象池。 在需要某个类的多个实例并且创建或销毁该类的成本很高的情况下，对象池可以改进应用程序性能。 客户端程序请求新对象时，对象池先尝试提供一个已创建并返回到该池的对象。 仅在没有可用对象时，才会创建一个新对象。

// ConcurrentBag<T> 表示对象的线程安全的无序集合。

// ConcurrentBag<T>
// 提供可供多个线程同时安全访问的无序包。对应非泛型列表List<T>。

// 包(Bag)和数据上的集(Set)的区别是包可包含重复元素，而集中不能包含重复元素。

// Count：获取无序包中的元素数量

// IsEmpty：判断无序包是否为空。

// TryPeek：从无序包中获取一个元素，但不进行移除。

// TryTask：从无序包获取一个元素并移除。

```

## 常用

```c#
// Demonstrates:
//      ConcurrentBag<T>.Add()
//      ConcurrentBag<T>.IsEmpty
//      ConcurrentBag<T>.TryTake()
//      ConcurrentBag<T>.TryPeek()
static void Main()
{
    // Add to ConcurrentBag concurrently
    ConcurrentBag<int> cb = new ConcurrentBag<int>();
    List<Task> bagAddTasks = new List<Task>();
    for (int i = 0; i < 500; i++)
    {
        var numberToAdd = i;
        bagAddTasks.Add(Task.Run(() => cb.Add(numberToAdd)));
    }

    // Wait for all tasks to complete
    Task.WaitAll(bagAddTasks.ToArray());

    // Consume the items in the bag
    List<Task> bagConsumeTasks = new List<Task>();
    int itemsInBag = 0;
    while (!cb.IsEmpty)
    {
        bagConsumeTasks.Add(Task.Run(() =>
        {
            int item;
            if (cb.TryTake(out item))
            {
                Console.WriteLine(item);
                itemsInBag++;
            }
        }));
    }
    Task.WaitAll(bagConsumeTasks.ToArray());

    Console.WriteLine($"There were {itemsInBag} items in the bag");

    // Checks the bag for an item
    // The bag should be empty and this should not print anything
    int unexpectedItem;
    if (cb.TryPeek(out unexpectedItem))
        Console.WriteLine("Found an item in the bag when it should be empty");
}

```

## 遍历

```c#
注意:SET 参数对象值 一律不能null 否则引发异常  变通方案可以设置为""空
常用标记 操作写法

正确写法
Hash.SetMemoryCacheDefault("");
错误写法
Hash.SetMemoryCacheDefault(null);

ConcurrentBag<int> list = new ConcurrentBag<int>();
Parallel.For(0, 10000, item =>
{
    list.Add(item);
});
Console.WriteLine("ConcurrentBag's count is {0}", list.Count());
int n = 0;
foreach (int i in list)
{
    if (n > 10)
        break;
    n++;
    Console.WriteLine("Item[{0}] = {1}", n, i);
}
Console.WriteLine("ConcurrentBag's max item is {0}", list.Max());
```
