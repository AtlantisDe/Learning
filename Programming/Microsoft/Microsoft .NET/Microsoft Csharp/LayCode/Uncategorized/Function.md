# C# Function

## 常用

### 1. 代码 1

```c#
go_Demo_001();
bool go_Demo_001()
{

return true;
}

try
{
}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
}
finally
{
}
```

### 2. 异常抓取代码 2

```c#
try
{
}
catch (Exception ex)
{
    var exErr = string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
    Console.WriteLine(exErr);
}
finally
{
}
```

### 3. 委托中的匿名方法

```c#
myDelegate = new Module.RunAction.Main.Entity.actionitem.RunCode
(
    delegate ()
    {
    System.Console.Write("Hello, ");
    System.Console.WriteLine("World!");
    }
)


System.Timers.Timer aTimer = new System.Timers.Timer();
aTimer.Elapsed += new System.Timers.ElapsedEventHandler(delegate (object sender, System.Timers.ElapsedEventArgs e)
{

}); //到达时间的时候执行事件；
aTimer.Interval = 2 * 1000; // 设置引发时间的时间间隔 此处设置为1秒（1000毫秒）
aTimer.AutoReset = true;//设置是执行一次（false）还是一直执行(true)；
aTimer.Enabled = true; //是否执行System.Timers.Timer.Elapsed事件；

```
