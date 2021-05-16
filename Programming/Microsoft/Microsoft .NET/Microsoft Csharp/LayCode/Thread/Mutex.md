# Mutex

- Mutex
- [Mutex Class (System.Threading)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.mutex?view=netcore-3.1)
- [Multi processes read&amp;write one file](https://stackoverflow.com/questions/18690537/multi-processes-readwrite-one-file)
- [c# 多线程 --Mutex（互斥锁） - 田志良 - 博客园](https://www.cnblogs.com/tianzhiliang/archive/2010/09/01/1814822.html)

## 常用

```c#
using (var mutex = new Mutex(false, "Strand www.Google.com"))
{
    mutex.WaitOne();
    File.AppendAllText(outputFilePath,theFileText);
    mutex.ReleaseMutex();
}



System.IO.StreamWriter file = new System.IO.StreamWriter(@"D:\Tmp\Txt\WriteLines1.txt", true);


Parallel.For(0, 100000, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
{
    using (var mutex = new System.Threading.Mutex(false, "Strand1"))
    {
        mutex.WaitOne();
        file.WriteLine(i);
        mutex.ReleaseMutex();
    }

});

LogsExtenions.DebuglogPrinting("写入完毕!");


file.Close();
```
