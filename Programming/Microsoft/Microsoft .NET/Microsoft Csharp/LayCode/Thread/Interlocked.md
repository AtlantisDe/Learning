# Interlocked

- [Interlocked Class (System.Threading)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.interlocked?view=netframework-4.8)
- [C#中的原子操作 Interlocked，你真的了解吗？ - Zachary_Fan - 博客园](https://www.cnblogs.com/Zachary-Fan/p/interlocked.html)

## Examples

- 一般原子操作只进行一次操作，和 CPU 个数无关

### 1. 常用

```c#

```

### 2. 示例

```c#
public static class MyInterlockedExchangeExampleClass
{
    //0 for false, 1 for true.
    // 0 资源占用释放 1 使用资源
    private static int usingResource = 0;

    private const int numThreadIterations = 5;
    private const int numThreads = 10;

    public static void GO()
    {
        Thread myThread;
        Random rnd = new Random();

        for (int i = 0; i < numThreads; i++)
        {
            myThread = new Thread(new ThreadStart(MyThreadProc));
            myThread.Name = String.Format("线程:Thread{0}", i + 1);

            //Wait a random amount of time before starting next thread.
            Thread.Sleep(rnd.Next(0, 1000));
            myThread.Start();
        }
    }

    private static void MyThreadProc()
    {
        for (int i = 0; i < numThreadIterations; i++)
        {
            UseResource();

            //Wait 1 second before next attempt.
            Thread.Sleep(1000);
        }
    }

    //A simple method that denies reentrancy.
    static bool UseResource()
    {
        //0 indicates that the method is not in use.
        if (0 == Interlocked.Exchange(ref usingResource, 1))
        {
            Console.WriteLine("{0} [获取了锁] [操作资源] acquired the lock", Thread.CurrentThread.Name);

            //Code to access a resource that is not thread safe would go here.
            //Simulate some work
            Thread.Sleep(500);

            Console.WriteLine("{0} [出口锁] -[退出资源占用] exiting lock", Thread.CurrentThread.Name);

            //Release the lock
            Interlocked.Exchange(ref usingResource, 0);
            return true;
        }
        else
        {
            Console.WriteLine("   {0} [被拒绝了锁] [执行资源操作失败] was denied the lock", Thread.CurrentThread.Name);
            return false;
        }
    }

}

```
