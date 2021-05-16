# ReaderWriterLockSlim

- Represents a lock that is used to manage access to a resource, allowing multiple threads for reading or exclusive access for writing.
- 表示用于管理对资源的访问的锁，从而允许多个线程进行读取或互斥访问进行写入。
- [ReaderWriterLockSlim Class (System.Threading)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.readerwriterlockslim?view=netcore-3.1)
- [C# 多线程锁之 ReaderWriterLockSlim - 郑小超 - 博客园](https://www.cnblogs.com/GreenLeaves/p/10618613.html)
- [让 C#轻松实现读写锁分离－－封装 ReaderWriterLockSlim - 冰麟轻武 - 博客园](https://www.cnblogs.com/blqw/p/3475734.html)
- [C#使用读写锁三行代码简单解决多线程并发写入文件时线程同步的问题 - 弎吩锺熱 ℃ - 博客园](https://www.cnblogs.com/Tench/p/6159763.html)
- [C#下多进程共同读写同一文件 - 敲代码的小阿狸 - 博客园](https://www.cnblogs.com/itZhy/p/3348050.html)

## 常用

```c#

```

## 1. C＃中的互斥锁可以在多个进程之间共享

- [C＃中的互斥锁可以在多个进程之间共享。这是多个进程写入单个文件的示例](https://stackoverflow.com/questions/18690537/multi-processes-readwrite-one-file)

```c#
// C＃中的互斥锁可以在多个进程之间共享。这是多个进程写入单个文件的示例：
EventWaitHandle waitHandle = new EventWaitHandle(true, EventResetMode.AutoReset, "SHARED_BY_ALL_PROCESSES");
waitHandle.WaitOne();
/* process file*/
waitHandle.Set();

using (var mutex = new Mutex(false, "Strand www.jakemdrew.com"))
{
    mutex.WaitOne();
    File.AppendAllText(outputFilePath,theFileText);
    mutex.ReleaseMutex();
}
```
