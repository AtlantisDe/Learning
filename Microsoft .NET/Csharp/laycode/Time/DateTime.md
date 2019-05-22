# C# Time

- [C# DateTime 日期格式化](https://www.cnblogs.com/arxive/p/6415312.html)
- [C# TimeSpan 计算时间差(时间间隔)](https://www.cnblogs.com/999c/p/6170501.html)
- [C# .Net 计算函数执行的时间](https://www.cnblogs.com/sntetwt/p/4612992.html)

## 相关代码

```c#
DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss:ffff"); // => 2016-05-09 13:09:55:2350
DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss:ffff"); // => 2016/05/09 13:09:55:2350
DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss:ffff dddd"); // => 2016/05/09 13:09:55:2350 星期一
// yyyy-MM-dd HH:mm:ss.ffff
DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");


```

```text
符号　　　　　　语法　　示例(2016-05-09 13:09:55:2350) 格式说明
y DateTime.Now.ToString() 2016/5/9 13:09:55 短日期 长时间
d DateTime.Now.ToString("d") 2016/5/9 短日期
D DateTime.Now.ToString("D") 2016年5月9日 长日期
f DateTime.Now.ToString("f") 2016年5月9日 13:09 长日期 短时间
F DateTime.Now.ToString("F") 2016年5月9日 13:09:55 长日期 长时间
g DateTime.Now.ToString("g") 2016/5/9 13:09 短日期 短时间
G DateTime.Now.ToString("G") 2016/5/9 13:09:55 短日期 长时间
t DateTime.Now.ToString("t") 13:09 短时间
T DateTime.Now.ToString("T") 13:09:55 长时间
u DateTime.Now.ToString("u") 2016-05-09 13:09:55Z
U DateTime.Now.ToString("U") 2016年5月9日 5:09:55本初子午线的长日期和长时间
m DateTime.Now.ToString("m") 5月9日
M DateTime.Now.ToString("M") 5月9日
r DateTime.Now.ToString("r") Mon, 09 May 2016 13:09:55 GMT
R DateTime.Now.ToString("R") Mon, 09 May 2016 13:09:55 GMT
y DateTime.Now.ToString("y") 2016年5月
Y DateTime.Now.ToString("Y") 2016年5月
o DateTime.Now.ToString("o") 2016-05-09T13:09:55.2350000
O DateTime.Now.ToString("O") 2016-05-09T13:09:55.2350000
s DateTime.Now.ToString("s") 2016-05-09T13:09:55
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
