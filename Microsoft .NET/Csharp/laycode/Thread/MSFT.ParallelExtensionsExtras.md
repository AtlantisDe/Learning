# MSFT.ParallelExtensionsExtras

- [MSFT.ParallelExtensionsExtras 1.2.0](https://www.nuget.org/packages/MSFT.ParallelExtensionsExtras/)

## 常用

```c#
public static bool LimitedTaskDemo2()
{

    TaskFactory fac = new TaskFactory(new System.Threading.Tasks.Schedulers.LimitedConcurrencyLevelTaskScheduler(5));

    //TaskFactory fac = new TaskFactory();
    for (int i = 0; i < 1000; i++)
    {

        fac.StartNew(s =>
        {
            System.Threading.Thread.Sleep(1000);
            Console.WriteLine("Current Index {0}, ThreadId {1}", s, System.Threading.Thread.CurrentThread.ManagedThreadId);
        }, i);
    }

    CsharpLazycode.Module.Laycode.Sys.WaitDelay(1 * 60 * 1000, true);

    return true;
}

```
