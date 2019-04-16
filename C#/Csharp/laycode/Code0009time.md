# C# Time

- [C# DateTime日期格式化](https://www.cnblogs.com/arxive/p/6415312.html)
- [C# TimeSpan 计算时间差(时间间隔)](https://www.cnblogs.com/999c/p/6170501.html)
- [C# .Net计算函数执行的时间](https://www.cnblogs.com/sntetwt/p/4612992.html)

## 相关代码

```c#
DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffff"); // => 2016-05-09 13:09:55:2350
DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss:ffff"); // => 2016/05/09 13:09:55:2350
DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss:ffff dddd"); // => 2016/05/09 13:09:55:2350 星期一
// yyyy-MM-dd HH:mm:ss.ffff

```

## 计算函数执行的时间

```c#
protected void StopwatchTest()
{
    System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
    stopwatch.Start(); //  开始监视代码
    //_________________要执行的函数______________________
    //Code……
    stopwatch.Stop(); //  停止监视
    TimeSpan timeSpan = stopwatch.Elapsed; //  获取总时间
    double hours = timeSpan.TotalHours; // 小时
    double minutes = timeSpan.TotalMinutes;  // 分钟
    double seconds = timeSpan.TotalSeconds;  //  秒数
    double milliseconds = timeSpan.TotalMilliseconds;  //  毫秒数
}
```