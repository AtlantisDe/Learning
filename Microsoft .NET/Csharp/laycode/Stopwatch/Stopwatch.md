# Stopwatch

- [【C#】记录程序耗时方法 - 青春本就不靠谱 - 博客园](https://www.cnblogs.com/on-fire/p/9522878.html)

## 耗时

### demo

```c#
System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
stopwatch.Reset();
stopwatch.Start();
// Here: 需要计算耗时的过程/方法
stopwatch.Stop();
stopwatch.Elapsed.TotalSeconds //这里是输出的总运行秒数,精确到毫秒的

//当然也可以输出分钟，小时等等。。。。。。

stopwatch.Elapsed.TotalHours;//以小时为单位
stopwatch.Elapsed.TotalMilliseconds；//以毫秒为单位
stopwatch.Elapsed.TotalMinutes；//以分钟为单位
stopwatch.Elapsed.TotalDays；//以天为单位

```

### demo1

```c#
System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
stopwatch.Reset();
stopwatch.Start();
stopwatch.Stop();
Console.WriteLine("成功导入{0}条数据 ，用时{1}秒。", demo_Guiditems.Count, stopwatch.Elapsed.TotalSeconds);
```
