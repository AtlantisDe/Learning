# Button

## 1. 常用代码

```c#
var btn = (Button)sender;

btn.Enabled = false;

btn.Enabled = true;


btn.Enabled = true; return;

// 线程版本
this.Invoke((EventHandler)delegate { btn.Enabled = true; });

```

## 2. 线程版本

```c#
var btn = (Button)sender;
btn.Enabled = false;

var workTh = new Thread(delegate ()
{
    try
    {


    }
    catch (Exception ex) { LogsExtenions.ExLog(System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message); }
    finally { this.Invoke((EventHandler)delegate { btn.Enabled = true; }); }
})
{ IsBackground = true };
workTh.Start();

```
