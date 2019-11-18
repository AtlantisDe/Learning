# C# Timer

- [C# 定时器](https://blog.csdn.net/m0_37742963/article/details/100772913)
- [[转][C#].NET 中的三种 Timer 的区别和用法 - 米斯特唐 - 博客园](https://www.cnblogs.com/xiaoheihei/p/10021264.html)
- [C# Timer 定时任务](https://www.cnblogs.com/cmsqc/p/10784218.html)

```c#
// 1.定义在System.Windows.Forms里
// 2.定义在System.Threading.Timer类里
// 3.定义在System.Timers.Timer类里

// System.Timers.Timer和System.Threading.Timer很类似，他们是通过.NET Thread Pool实现的，轻量，计时精确，对应用程式、消息没有特别的需要。
// System.Timers.Timer还能够应用于WinForm，完全取代上面的Timer控件。他们的缺点是不支持直接的拖放，需要手工编码。
```

## 复制

### 1. Demo

```c#
System.Threading.Timer

static void Main()
{
　Timer t = new Timer(Test,null,0,1000);
　var t = new System.Threading.Timer(Test, null, 0, 1000);
　Console.ReadLine();
}
public static void Test(object o)
{
　Console.WriteLine("nihao");
　GC.Collect();
//  强制对所有代进行即时垃圾回收。
}

```

### 2. Demo

```c#
private void Load()
{
    System.Timers.Timer aTimer = new System.Timers.Timer();
    aTimer.Elapsed += new ElapsedEventHandler(theout); //到达时间的时候执行事件；
    // 设置引发时间的时间间隔 此处设置为1秒（1000毫秒）
    aTimer.Interval = 100000;
    aTimer.AutoReset = true;//设置是执行一次（false）还是一直执行(true)；
    aTimer.Enabled = true; //是否执行System.Timers.Timer.Elapsed事件；
}
public void theout(object source, System.Timers.ElapsedEventArgs e)
{
    ArrayList AutoTask = new ArrayList();
    AutoTask.Add("8:30:00");
    AutoTask.Add("9:30:00");
    AutoTask.Add("10:30:00");
    AutoTask.Add("11:34:15");

    for (int n = 0; n < 4; n++)
    {
        if (DateTime.Now.ToLongTimeString().Equals(AutoTask[n]))
        {
            MessageBox.Show("现在时间是" + AutoTask[n]);
        }
    }
}


```

### 3. 常用匿名委托

```c#
System.Timers.Timer aTimer = new System.Timers.Timer();
aTimer.Elapsed += new System.Timers.ElapsedEventHandler(delegate (object sender, System.Timers.ElapsedEventArgs e)
{
var timetask = (System.Timers.Timer)sender;
    timetask.Enabled = false;



try
{

}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
}
finally
{
    timetask.Enabled = true;
}


}); //到达时间的时候执行事件；
aTimer.Interval = 2 * 1000; // 设置引发时间的时间间隔 此处设置为1秒（1000毫秒）
aTimer.AutoReset = true;//设置是执行一次（false）还是一直执行(true)；
aTimer.Enabled = true; //是否执行System.Timers.Timer.Elapsed事件；

```
