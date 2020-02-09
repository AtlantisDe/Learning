# Console

- [将所有输出窗口文本重定向到即时窗口 - Jeff Gao - 博客园](https://www.cnblogs.com/0banana0/archive/2012/03/14/2396240.html)

```c#
System.Diagnostics.Trace.Listeners.Add(new System.Diagnostics.TextWriterTraceListener(Console.Out));

Console.WriteLine("Application_BeginRequest");
System.Diagnostics.Debug.WriteLine("Application_BeginRequest");
System.Diagnostics.Trace.WriteLine("Application_BeginRequest");

Console.WriteLine("{0,-20}{1}",
result.Members["ProcessName"].Value,
result.Members["Id"].Value);

Console.WriteLine("{0,-20}{1}",
result.Members["DeviceID"].Value,
result.Members["FreeSpace"].Value);
```
