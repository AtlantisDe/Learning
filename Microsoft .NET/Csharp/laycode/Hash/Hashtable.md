# Hashtable

- 线程安全推荐使用
- [C#中 HashTable 的用法 - 璇狼之风 - 博客园](https://www.cnblogs.com/houlin/p/3512480.html)
- [C#集合类(HashTable, Dictionary, ArrayList)与 HashTable 线程安全 - Mainz - 博客园](https://www.cnblogs.com/Mainz/archive/2008/04/06/CSharp_HashTable_Dictionary_ArrayList_Threadsafe.html)
- [C# 集合 — Hashtable 线程安全 - 蓝远波 - 博客园](https://www.cnblogs.com/lanyuanbo/p/5857038.html)

## DEMO

### 线程安全再次解说

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

### 多线程操作错误示例

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

### 添加

```c#
root.hashtable.Add("aa", 123);
```

### 读取

```c#
 string aaa = (string)hashtable["aa"];
```
