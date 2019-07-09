# C# Parallel

- [C#中的多线程 - 并行编程](https://www.cnblogs.com/zeroone/p/4789531.html) -[c# parallel.for 怎么控制并发数量，控制多 5 个并发量 - zhangzhiping35 - 博客园](https://www.cnblogs.com/zhangzhiping35/p/11058684.html)

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

```c#
Parallel.For(0,10,
new ParallelOptions(){MaxDegreeOfParallelism = 5},
(i, loopState) =>
{
    System.Diagnostics.Debug.WriteLine("Start Thread={0}, i={1}", Thread.CurrentThread.ManagedThreadId, i);

    Thread.Sleep(i*200);
    Console.WriteLine("Finish Thread={0}, i={1}", Thread.CurrentThread.ManagedThreadId, i);
});
```
