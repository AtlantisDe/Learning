# Hashtable

- 线程安全推荐使用
- 锁 hashtable 应该锁它的 SyncRoot 属性而不应该锁它的实例
- [C#中 HashTable 的用法 - 璇狼之风 - 博客园](https://www.cnblogs.com/houlin/p/3512480.html)
- [C#集合类(HashTable, Dictionary, ArrayList)与 HashTable 线程安全 - Mainz - 博客园](https://www.cnblogs.com/Mainz/archive/2008/04/06/CSharp_HashTable_Dictionary_ArrayList_Threadsafe.html)
- [C# 集合 — Hashtable 线程安全 - 蓝远波 - 博客园](https://www.cnblogs.com/lanyuanbo/p/5857038.html)
- [c# 变量，对象，静态类型，集合类的线程安全回顾 - NLazyo - 博客园](https://www.cnblogs.com/bile/p/6114506.html)
- [https://blog.csdn.net/seamonkey/article/details/583613](https://blog.csdn.net/seamonkey/article/details/583613) -[C#的线程安全类为何还是得加 lock ?-CSDN 论坛](https://bbs.csdn.net/topics/391982454)
- [Hashtable Class (System.Collections)](https://docs.microsoft.com/en-us/dotnet/api/system.collections.hashtable?view=netframework-4.8)

## DEMO

```c#
// 很高兴能解答这个问题。其实您只要记住一句话就好：线程安全和数据同步是两码事儿。
// 您的程序是线程安全的，不会出错（起码计算机是这么认为的）
// 但他的数据是不同步的，因为你是并发运行，速度太快，计算机也不确定谁先谁后。
// 所以你需要同步一下。就是LOCK起来。。C#有很多线程同步的类 什么信号量互斥量 锁 自旋锁。
// 看你需要选择合适的用。
```

### 1. 添加

```c#
root.hashtable.Add("aa", 123);
```

### 2. 读取

```c#
 string aaa = (string)hashtable["aa"];
```

### 3. 非局部变量原子操作

```c#
var ht = new System.Collections.Hashtable
{
    { "aa", AnalysisItem }
};

Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 5000 }, (i, loopState) =>
{
    lock (ht.SyncRoot)
    {
        var aaa = (AnalysisItem)ht["aa"];
        aaa.RequestTotalTimes += 1;
    }
});

```

### 4. 线程安全再次解说

```c#
var ht = new System.Collections.Hashtable();
System.Collections.Hashtable htSyn = System.Collections.Hashtable.Synchronized(new System.Collections.Hashtable());
var htSyn = System.Collections.Hashtable.Synchronized(new System.Collections.Hashtable());

HashTable与线程安全：

为了保证在多线程的情况下的线程同步访问安全，微软提供了自动线程同步的HashTable:

如果 HashTable要允许并发读但只能一个线程写, 要这么创建 HashTable实例:
//Thread safe HashTable
System.Collections.Hashtable htSyn = System.Collections.Hashtable.Synchronized(new System.Collections.Hashtable());

这样, 如果有多个线程并发的企图写HashTable里面的 item, 则同一时刻只能有一个线程写, 其余阻塞; 对读的线程则不受影响。

另外一种方法就是使用lock语句，但要lock的不是HashTable，而是其SyncRoot；虽然不推荐这种方法，但效果一样的，因为源代码就是这样实现的:
```

### 5. 多线程操作错误示例

```c#
//任务队列DEMO
var ht = new System.Collections.Hashtable();
System.Collections.Hashtable htSyn = System.Collections.Hashtable.Synchronized(new System.Collections.Hashtable());

Hashtable ht = new Hashtable();

Thread Th1 = new Thread(delegate ()
{

    Parallel.For(0, 999999999,
                        new ParallelOptions() { MaxDegreeOfParallelism = 100 },
    (i, loopState) =>
    {
        ht.Add(System.Guid.NewGuid().ToString("N"), CsharpLazycode.Module.Laycode.words.Util.GenerateSurname());

    });



});
Th1.IsBackground = true;
Th1.Start();


Thread Th2 = new Thread(delegate ()
{
    while (true)
    {
        foreach (var item in ht)
        {
            ht.Remove(item);
        }


    }


});
Th2.IsBackground = true;
Th2.Start();
```

### 6. foreach

- [【C#】-哈希表（Hashtable）foreach 循环](https://blog.csdn.net/myxzxd/article/details/86908339)

```c#
StringBuilder sb = new StringBuilder();
foreach (var item in ht.Keys)
{
    sb.Append(ht[item].ToString());
}
```
