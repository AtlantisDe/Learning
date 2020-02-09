# ConcurrentQueue

- [ConcurrentQueue<T> Class (System.Collections.Concurrent)](https://docs.microsoft.com/en-us/dotnet/api/system.collections.concurrent.concurrentqueue-1?view=netframework-4.8)

```c#
入队(EnQueue) 、出队(TryDequeue) 、是否为空(IsEmpty)、获取队列内元素数量(Count)。
// 队列（Queue）代表了一个先进先出的对象集合。当您需要对各项进行先进先出的访问时，则使用队列。当您在列表中添加一项，称为入队，当您从列表中移除一项时，称为出队。
// ConcurrentQueue<T>队列是一个高效的线程安全的队列，是.Net Framework 4.0，System.Collections.Concurrent命名空间下的一个数据结构。
// 如上图所示，出队失败时返回false 而不是像入队一样进行回退操作，因为出队失败的原因只有一个就是当队列内所有段的元素为空时，所以出队设计成了返回bool值的函数。
```

## Examples

### 1. Demo

```c#
public static bool Demo2()
{
    // Construct a ConcurrentQueue.
    System.Collections.Concurrent.ConcurrentQueue<string> cq = new System.Collections.Concurrent.ConcurrentQueue<string>();

    Parallel.For(0, 100000, new ParallelOptions() { MaxDegreeOfParallelism = 100 }, (i, loopState) =>
    {
        cq.Enqueue(i.ToString());
    });

    Parallel.For(0, 100000, new ParallelOptions() { MaxDegreeOfParallelism = 100 }, (i, loopState) =>
    {
        var localValue = "";
        cq.TryDequeue(out localValue);

        //cq.TryDequeue(out string localValue);
    });

    return true;
}

```
