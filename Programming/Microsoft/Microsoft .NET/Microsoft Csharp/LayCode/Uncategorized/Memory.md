
# Memory

- [C#查看程序占用系统的内存](https://blog.csdn.net/lhypang2006/article/details/2584874?utm_source=blogxgwz2)

```c#
public double GetProcessUsedMemory()
{

    double usedMemory = 0;

    usedMemory = Process.GetCurrentProcess().WorkingSet64 / 1024.0 / 1024.0;

    return usedMemory;

}
```
