# lock

- [Getting Title at 22:41](https://www.cnblogs.com/liuqiyun/p/9118382.html)

## 锁测试代码

```c#
//锁 多线程测试
object lockObj_lock = new object();

Thread Th_lock_1 = new Thread(delegate ()
{
    Parallel.For(0, 6, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
    {
        lock (lockObj_lock)
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
Th_lock_1.IsBackground = true;
Th_lock_1.Start();

Thread Th_lock_2 = new Thread(delegate ()
{
    Parallel.For(0, 8, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
    {
        lock (lockObj_lock)
        {
            Console.WriteLine(string.Format("我在并发{0}线程里,饥饿锁", i + 1));
        }
    });
});
Th_lock_2.IsBackground = true;
Th_lock_2.Start();

```
