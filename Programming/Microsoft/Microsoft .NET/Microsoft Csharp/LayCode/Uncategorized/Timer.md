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

## 常用

### 0. 定时任务

```c#
//依赖注册服务

/// <summary>定时任务</summary>
System.Timers.Timer aTimer = new System.Timers.Timer();
aTimer.Elapsed += new System.Timers.ElapsedEventHandler(delegate (object sender1, System.Timers.ElapsedEventArgs ee)
{
    var timetask = (System.Timers.Timer)sender1;
    timetask.Enabled = false;
    try
    {

        App.Net.Core.Engine.FsWatcher.App.FsWatcher.Driver.WatchFolderInit();


    }
    catch (Exception ex)
    {
        Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
    }
    finally
    {
        timetask.Enabled = true;
    }
});
aTimer.Interval = 1 * 60 * 1000;
aTimer.AutoReset = true;
aTimer.Enabled = true;

```

### 1. System.Threading.Timer

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

### 2. 定时任务 AutoTask

```c#
// 定时任务调度演示示例


System.Timers.Timer aTimer = new System.Timers.Timer();
aTimer.Elapsed += new System.Timers.ElapsedEventHandler(delegate (object sender, System.Timers.ElapsedEventArgs e)
{
    var timetask = (System.Timers.Timer)sender; timetask.Enabled = false;
    try
    {
        var AutoTask = new List<string>();
        AutoTask.Add("15:54:45");
        AutoTask.Add("15:54:50");
        AutoTask.Add("15:54:56");
        var nowHMS = DateTime.Now.ToLongTimeString();
        if (AutoTask.Contains(nowHMS) == true)
        {
            $"现在时间是{nowHMS}".Log();
        }

    }
    catch (Exception ex) { Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message)); }
    finally { timetask.Enabled = true; }
});
aTimer.Interval = 1 * 1000;
aTimer.AutoReset = true;
aTimer.Enabled = true;


System.Timers.Timer aTimer = new System.Timers.Timer();
aTimer.Elapsed += new System.Timers.ElapsedEventHandler(delegate (object sender, System.Timers.ElapsedEventArgs e)
{
    var timetask = (System.Timers.Timer)sender; timetask.Enabled = false;
    try
    {
        var AutoTask = new System.Collections.ArrayList();             
        AutoTask.Add("15:46:45");
        AutoTask.Add("15:46:50");
        AutoTask.Add("15:46:56");
        for (int n = 0; n < AutoTask.Count; n++)
        {
            if (DateTime.Now.ToLongTimeString().Equals(AutoTask[n]))
            {
                $"现在时间是{AutoTask[n]}".Log();
            }
        }
    }
    catch (Exception ex) { Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message)); }
    finally { timetask.Enabled = true; }
});
aTimer.Interval = 1 * 1000;
aTimer.AutoReset = true;
aTimer.Enabled = true;


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


});
aTimer.Interval = 2 * 1000;
aTimer.AutoReset = true;
aTimer.Enabled = true;
```

### 4. 站点时间演示 推荐 System.Timers.Timer

```c#
    /// <summary></summary>
    public class Demo
    {
        //定时任务擎仓库
        public static ConcurrentDictionary<string, System.Timers.Timer> HostTimers = new ConcurrentDictionary<string, System.Timers.Timer>();

        /// <summary>SiteItem</summary>
        public class SiteItem : System.ComponentModel.ISite
        {
            public IComponent Component => throw new NotImplementedException();

            public IContainer Container => throw new NotImplementedException();

            public bool DesignMode { get; set; }

            public string Name { get; set; }

            public object GetService(Type serviceType)
            {
                throw new NotImplementedException();
            }
        }

        /// <summary></summary>
        public static bool DebugDemo(bool IsDebugging = false)
        {
            if (IsDebugging == false) { return false; }

            for (int i = 0; i < 10000; i++)
            {
                System.Timers.Timer aTimer = new System.Timers.Timer();
                aTimer.Elapsed += new System.Timers.ElapsedEventHandler(delegate (object sender, System.Timers.ElapsedEventArgs e)
                {

                       var timer = (System.Timers.Timer)sender;
                    timer.Enabled = false;

                    try
                    {
                        Console.WriteLine($"{timer.Site.Name} 正在执行...");

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
                    }
                    finally
                    {
                        timer.Enabled = true;
                    }

                });
                aTimer.Interval = ExtenionsRandom.NextIncludeMax(3, 20) * 1000;
                //aTimer.Interval = 2 * 1000;
                aTimer.Site = new SiteItem {  Name = $"站点:{i}" };

                aTimer.AutoReset = true;
                aTimer.Enabled = true;
                HostTimers.TryAdd(i.ToString(), aTimer);

            }

            return true;


        }
    }
```

### 5. 销毁对象正确用法 与 错误用法

```c#
var timer = SiteTimers[guid];
timer.Enabled = false;
timer.Close();
// 以下方法错误 禁止使用
timer.Dispose();
```
