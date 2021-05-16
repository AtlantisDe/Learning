# Diagnostics

## Trace Class

- [Trace Class (System.Diagnostics)](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.trace?view=netcore-3.1)
- [利用 C#自带组件强壮程序日志 成长的菜鸟-CSDN 博客 c# 自带日志](https://blog.csdn.net/liurong1420/article/details/51999710)
- [诊断日志知多少 | DiagnosticSource 在.NET 上的应用 - 「圣杰」 - 博客园](https://www.cnblogs.com/sheng-jie/p/how-much-you-know-about-diagnostic-in-dotnet.html)

```c#
Trace.Listeners.Add(new TextWriterTraceListener(Console.Out));
Trace.AutoFlush = true;
Trace.Indent();
Trace.WriteLine("Entering Main");
Console.WriteLine("Hello World.");
Trace.WriteLine("Exiting Main");
Trace.Unindent();
System.Diagnostics.Trace.TraceInformation("控制台...");

```
