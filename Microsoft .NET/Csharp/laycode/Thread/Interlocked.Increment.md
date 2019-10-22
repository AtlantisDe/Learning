# Interlocked.Increment Method

- [Interlocked.Increment Method (System.Threading)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.interlocked.increment?view=netframework-4.8)

## 常用

### 1. 常用代码

```c#
System.Threading.Interlocked.Increment(ref visits);
System.Threading.Interlocked.Add(ref visits,2);
```

### 2. 常用 DEMO

```c#
public static bool Go()
{
    long visits = 0;
    Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 5000 }, (i, loopState) =>
    {
        System.Threading.Interlocked.Increment(ref visits);
    });
    return true;
}
```
