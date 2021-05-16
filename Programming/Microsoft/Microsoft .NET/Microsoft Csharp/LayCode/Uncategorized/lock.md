# lock

- [Getting Title at 22:41](https://www.cnblogs.com/liuqiyun/p/9118382.html)

## 常用

```c#
/// <summary>APP自动更新任务容器 锁</summary>
public object AppTaskItemsLock { get; set; }

/// <summary>APP自动更新任务容器 锁</summary>
public object AppTaskItemsLock = new object();


var lockgo = new object();
lock (lockgo)
{

}


Lock = new object();

lock (TempCount.Lock)
{
    TempCount.Count += 1;
}
```

## 锁测试代码

```c#
//锁 多线程测试
object lockObject = new object();

Thread ThreadLock1 = new Thread(delegate ()
{
    Parallel.For(0, 6, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
    {
        lock (lockObject)
        {
            while (true)
            {
                CsharpLazycode.Module.Laycode.sys.WaitDelay(CsharpLazycode.Module.Laycode.random.NextIncludeMax(3, 5) * 1000, true);
                Console.WriteLine(string.Format("我在并发{0}线程里,占用锁", i + 1));
                break;
            }
        }
    });
});
ThreadLock1.IsBackground = true;
ThreadLock1.Start();

Thread Th_lock_2 = new Thread(delegate ()
{
    Parallel.For(0, 8, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
    {
        lock (lockObject)
        {
            Console.WriteLine(string.Format("我在并发{0}线程里,饥饿锁", i + 1));
        }
    });
});
Th_lock_2.IsBackground = true;
Th_lock_2.Start();

```
