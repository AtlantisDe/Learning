# Stopwatch

- [【C#】记录程序耗时方法 - 青春本就不靠谱 - 博客园](https://www.cnblogs.com/on-fire/p/9522878.html)
- [C# Stopwatch 详解 - 君莫笑秋 - 博客园](https://www.cnblogs.com/vaevvaev/p/6929967.html)

## 1. 耗时

### 1. demo

```c#

System.Diagnostics.Stopwatch Stopwatch = new System.Diagnostics.Stopwatch();

stopwatch.Reset(); stopwatch.Start();

stopwatch.Stop(); $"流程运行用时: {stopwatch.Elapsed.TotalSeconds} (秒) {stopwatch.Elapsed.TotalMilliseconds} (毫秒)".Log();



System.Diagnostics.Stopwatch Stopwatch = new System.Diagnostics.Stopwatch();
stopwatch.Reset();
stopwatch.Start();

// Here: 需要计算耗时的过程/方法

stopwatch.Stop();
System.Diagnostics.Debug.WriteLine($"流程运行用时: {stopwatch.Elapsed.TotalSeconds}(秒) {stopwatch.Elapsed.TotalMilliseconds}(毫秒)");
SerilogApp.Log.ConsoleLogger.Information($"流程运行用时: {stopwatch.Elapsed.TotalSeconds}(秒) {stopwatch.Elapsed.TotalMilliseconds}(毫秒)");


Console.WriteLine($"流程运行用时: {stopwatch.Elapsed.TotalSeconds}(秒) {stopwatch.Elapsed.TotalMilliseconds}(毫秒)");

stopwatch.Elapsed.TotalSeconds //这里是输出的总运行秒数,精确到毫秒的

//当然也可以输出分钟，小时等等。。。。。。

stopwatch.Elapsed.TotalHours;//以小时为单位
stopwatch.Elapsed.TotalMilliseconds；//以毫秒为单位
stopwatch.Elapsed.TotalMinutes；//以分钟为单位
stopwatch.Elapsed.TotalDays；//以天为单位

```

### 2. demo1

```c#
LogsExtenions.Log($"用时 {stopwatch.Elapsed.TotalSeconds}秒 {stopwatch.Elapsed.TotalMilliseconds}毫秒。");

LogsExtenions.Log($"成功导入{"0"}条数据 ，用时{stopwatch.Elapsed.TotalSeconds}秒。");
LogsExtenions.Log($"[{i}] 插入成功数量:{count} 用时 {stopwatch.Elapsed.TotalSeconds}(秒) {stopwatch.Elapsed.TotalMilliseconds}(毫秒)");

System.Diagnostics.Stopwatch Stopwatch = new System.Diagnostics.Stopwatch();
stopwatch.Reset();
stopwatch.Start();
stopwatch.Stop();

Console.WriteLine("成功导入{0}条数据 ，用时{1}秒。", demo_Guiditems.Count, stopwatch.Elapsed.TotalSeconds);


Console.WriteLine("流程运行用时{0}秒。", stopwatch.Elapsed.TotalSeconds);


Console.WriteLine($"[流程运行用时: {stopwatch.Elapsed.TotalSeconds}(秒) {stopwatch.Elapsed.TotalMilliseconds}(毫秒)");



Console.WriteLine("[{0}] 流程运行用时{1}秒。", "单次读词库", stopwatch.Elapsed.TotalSeconds);
Console.WriteLine("[{0}] 流程运行用时{1}毫秒。", "单次读词库", stopwatch.Elapsed.TotalMilliseconds);

```

## 2. 监测每个方法的执行次数和占用时间（测试 2）

- [C# 监测每个方法的执行次数和占用时间（测试 2） - 古兴越 - 博客园](https://www.cnblogs.com/guxingy/p/10132062.html)

```c#

```
