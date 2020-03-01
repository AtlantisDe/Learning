# Stopwatch

- [【C#】记录程序耗时方法 - 青春本就不靠谱 - 博客园](https://www.cnblogs.com/on-fire/p/9522878.html)
- [C# Stopwatch 详解 - 君莫笑&#183;秋 - 博客园](https://www.cnblogs.com/vaevvaev/p/6929967.html)

## 耗时

### demo

```c#
System.Diagnostics.Stopwatch Stopwatch = new System.Diagnostics.Stopwatch();
Stopwatch.Reset();
Stopwatch.Start();
// Here: 需要计算耗时的过程/方法
Stopwatch.Stop();
Stopwatch.Elapsed.TotalSeconds //这里是输出的总运行秒数,精确到毫秒的

//当然也可以输出分钟，小时等等。。。。。。

Stopwatch.Elapsed.TotalHours;//以小时为单位
Stopwatch.Elapsed.TotalMilliseconds；//以毫秒为单位
Stopwatch.Elapsed.TotalMinutes；//以分钟为单位
Stopwatch.Elapsed.TotalDays；//以天为单位

```

### demo1

```c#
System.Diagnostics.Stopwatch Stopwatch = new System.Diagnostics.Stopwatch();
Stopwatch.Reset();
Stopwatch.Start();
Stopwatch.Stop();
Console.WriteLine("成功导入{0}条数据 ，用时{1}秒。", demo_Guiditems.Count, Stopwatch.Elapsed.TotalSeconds);


Console.WriteLine("流程运行用时{0}秒。", Stopwatch.Elapsed.TotalSeconds);

Console.WriteLine("[{0}] 流程运行用时{1}秒。", "单次读词库", Stopwatch.Elapsed.TotalSeconds);
Console.WriteLine("[{0}] 流程运行用时{1}毫秒。", "单次读词库", Stopwatch.Elapsed.TotalMilliseconds);
```
