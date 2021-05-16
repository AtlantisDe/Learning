# PerformanceCounter

- [C# 获取实时网速利用 PerformanceCounter 以及 NetworkInterface - chscomfaner 的博客 - CSDN 博客](https://blog.csdn.net/chscomfaner/article/details/82784999)
- [PerformanceCounter Class (System.Diagnostics)](https://docs.microsoft.com/zh-cn/dotnet/api/system.diagnostics.performancecounter?redirectedfrom=MSDN&view=netframework-4.8)

## 代码

### 代码示例 1

```c#
Process p = /*get the desired process here*/;
PerformanceCounter ramCounter = new PerformanceCounter("Process", "Working Set", p.ProcessName);
PerformanceCounter cpuCounter = new PerformanceCounter("Process", "% Processor Time", p.ProcessName);
while (true)
{
    Thread.Sleep(500);
    double ram = ramCounter.NextValue();
    double cpu = cpuCounter.NextValue();
    Console.WriteLine("RAM: "+(ram/1024/1024)+" MB; CPU: "+(cpu)+" %");
}
```

### 代理示例 2

```c#
 System.Diagnostics.PerformanceCounter cpuCounter;
System.Diagnostics.PerformanceCounter ramCounter;

cpuCounter = new System.Diagnostics.PerformanceCounter("Processor", "% Processor Time", "_Total");
ramCounter = new System.Diagnostics.PerformanceCounter("Memory", "Available MBytes");

var a = cpuCounter.NextValue() + "%";
var b = ramCounter.NextValue() + "MB";
```
