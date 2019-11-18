# C# Parallel

- [C#中的多线程 - 并行编程](https://www.cnblogs.com/zeroone/p/4789531.html) -[c# parallel.for 怎么控制并发数量，控制多 5 个并发量 - zhangzhiping35 - 博客园](https://www.cnblogs.com/zhangzhiping35/p/11058684.html)
- [C#并行编程中的 Parallel.Invoke - 左正 - 博客园](https://www.cnblogs.com/soundcode/p/6015996.html)

## 相关代码

```c#
Parallel.Invoke
// 并行执行一组委托
Parallel.For
// C#for循环的并行版本
Parallel.ForEach
// C#foreach循环的并行版本
```

## 参考一

```c#

```

## 传递参数

```c#

```

## 匿名

```c#

```

### 并发控制

- Console.WriteLine("Finish Thread={0}, i={1}", Thread.CurrentThread.ManagedThreadId, i);

```c#
Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 5000 }, (i, loopState) =>
{

});

Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 5 }, (i, loopState) =>
{

});


Parallel.For(0, aitems.Count, new ParallelOptions() { MaxDegreeOfParallelism = 10 }, (i, loopState) =>
{
    Content_Actionmode_Run(aitems[i], workertitem);
});


Parallel.For(0,10,new ParallelOptions(){MaxDegreeOfParallelism = 5},(i, loopState) =>
{
    System.Diagnostics.Debug.WriteLine("Start Thread={0}, i={1}", Thread.CurrentThread.ManagedThreadId, i);
    Thread.Sleep(i*200);
    Console.WriteLine("Finish Thread={0}, i={1}", Thread.CurrentThread.ManagedThreadId, i);
});
```

### Action

- Action

```c#
// An action to consume the ConcurrentQueue.
Action action = () =>
{
    int localSum = 0;
    int localValue;
    while (cq.TryDequeue(out localValue)) localSum += localValue;
    System.Threading.Interlocked.Add(ref outerSum, localSum);
};

// Start 4 concurrent consuming actions.
Parallel.Invoke(action, action, action, action);
```

### Parallel.ForEach

```c#
Parallel.ForEach(this.LoopBlockItems, new ParallelOptions { MaxDegreeOfParallelism = 4 }, LoopBlockItem =>
{

});

Parallel.ForEach(this.LoopBlockItems, new ParallelOptions { MaxDegreeOfParallelism = 4 }, webpage => { });


Parallel.ForEach(
    listOfWebpages,
    new ParallelOptions { MaxDegreeOfParallelism = 4 },
    webpage => { Download(webpage); }
);
```
