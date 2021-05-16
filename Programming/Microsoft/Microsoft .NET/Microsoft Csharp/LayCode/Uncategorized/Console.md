# Console

- [将所有输出窗口文本重定向到即时窗口 - Jeff Gao - 博客园](https://www.cnblogs.com/0banana0/archive/2012/03/14/2396240.html)
- [Console.WriteLine()与 Debug.WriteLine()之间有什么区别？ - 问答 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/ask/97510)

## 1. QuickStart

```c#

// Console.WriteLine()是用于控制台模式程序。Visual Studio托管过程的一个很好的功能使其输出出现在Visual Studio输出窗口中，同时调试没有控制台的进程。这在调试时非常有用，但要注意，#ifdef DEBUG在准备创建发布版本时，应该删除此代码（或者将其封装）。否则会给你的程序增加不必要的开销。这使得它不太适合调试跟踪。

// Debug.WriteLine()如果使用DEBUG条件#defined 构建，则会生成跟踪信息。在Debug版本中默认处于打开状态。输出结束的地方可以在app.exe.config文件中配置。如果这个配置没有被覆盖，.NET会自动提供这个DefaultTraceListener类的一个实例。它将Debug.WriteLine()带有Windows OutputDebugString()API函数的文本发送给调试器。Visual Studio调试器使它出现在输出窗口中，就像Console.WriteLine()。

// 一个明显的优点Debug.WriteLine()是它在Release版本中不产生任何开销，这些调用被有效地移除。但是它不支持复合格式，你需String.Format()要这样做。对于调试跟踪，Debug类应该是选择。


System.Diagnostics.Trace.Listeners.Add(new System.Diagnostics.TextWriterTraceListener(Console.Out));


System.Diagnostics.Debug.WriteLine($"{articleItem.Title}");


Console.Title = "Demo Test";
Console.ForegroundColor = ConsoleColor.Red;
Console.BackgroundColor = ConsoleColor.Green;


Console.WriteLine("Application_BeginRequest");
System.Diagnostics.Debug.WriteLine("Application_BeginRequest");
System.Diagnostics.Trace.WriteLine("Application_BeginRequest");

Console.WriteLine("{0,-20}{1}",
result.Members["ProcessName"].Value,
result.Members["Id"].Value);

Console.WriteLine("{0,-20}{1}",
result.Members["DeviceID"].Value,
result.Members["FreeSpace"].Value);


System.IO.FileInfo fif = new System.IO.FileInfo(@"C:\Users\bycnb\Desktop\Tmp\1_files\001.gif");
System.Console.WriteLine(string.Format("文件信息:文件名{0} 日期:{1}", fif.Name, fif.CreationTime));
System.Console.WriteLine(string.Format("文件信息:文件名{0} 文件最后一次修改时间:{1}", fif.Name, fif.LastWriteTime));

System.Diagnostics.Debug.WriteLine(string.Format("文件信息:文件名{0} 日期:{1}", fif.Name, fif.CreationTime));
System.Diagnostics.Debug.WriteLine(string.Format("文件信息:文件名{0} 文件最后一次修改时间:{1}", fif.Name, fif.LastWriteTime));
```

## 2. 自动关闭控制台

```c#
要在调试停止时自动关闭控制台，请启用“工具”->“选项”->“调试”->“调试停止时自动关闭控制台”。
按任意键关闭此窗口. . .
```
