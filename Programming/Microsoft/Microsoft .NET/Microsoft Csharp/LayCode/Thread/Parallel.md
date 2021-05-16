# C# Parallel

- [Parallel Class (System.Threading.Tasks)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.tasks.parallel?view=netcore-3.1)
- [C#中的多线程 - 并行编程](https://www.cnblogs.com/zeroone/p/4789531.html) -[c# parallel.for 怎么控制并发数量，控制多 5 个并发量 - zhangzhiping35 - 博客园](https://www.cnblogs.com/zhangzhiping35/p/11058684.html)
- [C#并行编程中的 Parallel.Invoke - 左正 - 博客园](https://www.cnblogs.com/soundcode/p/6015996.html)

## 1. 相关代码

```c#
Parallel.Invoke
// 并行执行一组委托
Parallel.For
// C#for循环的并行版本
Parallel.ForEach
// C#foreach循环的并行版本


// 在Parallel.ForEach中是否有等同于“ continue”的内容？
Parallel.ForEach(items, parallelOptions, item =>
{
    if (!isTrue)
        continue;
});


// （主体只是为每个项目调用的函数）
return;
```

## 2. 参考一

```c#
// Using a named method.
Parallel.For(0, N, Method2);

// Using an anonymous method.
Parallel.For(0, N, delegate(int i)
{
    // Do Work.
});

// Using a lambda expression.
Parallel.For(0, N, i =>
{
    // Do Work.
});


var data = new[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };


Parallel.ForEach(data, new ParallelOptions { MaxDegreeOfParallelism = 4 }, i =>
{
        Console.WriteLine(Task.CurrentId);
});

Parallel.ForEach(data, new ParallelOptions { MaxDegreeOfParallelism = 4 }, num =>
            {
                Console.WriteLine(Task.CurrentId);
                double d = Math.Sqrt(num);
                Console.WriteLine("{0} on {1}", d, Thread.CurrentThread.ManagedThreadId);

                var th = Thread.CurrentThread;
            });

```

## 3. 传递参数

```c#

```

## 4. 匿名

```c#

```

### 1. 并发控制

- Console.WriteLine("Finish Thread={0}, i={1}", Thread.CurrentThread.ManagedThreadId, i);

```c#
// 退出任务循环
if (StopTask)
{
    loopState.Break();
}

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

### 2. Action

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

### 3. Parallel.ForEach

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

### 4. Break Parallel.ForEach

- [Use the ParallelLoopState.Break method:](https://stackoverflow.com/questions/12571048/break-parallel-foreach)

```c#
Parallel.ForEach(list,
    (i, state) =>
    {
       state.Break();
    });
```

### 5. Cancel a Parallel.For or ForEach Loop

- [How to: Cancel a Parallel.For or ForEach Loop](https://docs.microsoft.com/en-us/dotnet/standard/parallel-programming/how-to-cancel-a-parallel-for-or-foreach-loop)

```c#

```

### 6. “Parallel.ForEach” as background task

- [How to execute “Parallel.ForEach” as background task that will return control immediate to the calling method?](https://stackoverflow.com/questions/52455868/how-to-execute-parallel-foreach-as-background-task-that-will-return-control-im)

```c#

```

### 7. 非静态方法需要一个目标

```c#
// 非静态方法需要一个目标 并发线程处理上,执行List.add时候没加锁引发的问题
```
