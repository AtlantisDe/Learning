# Process

- [Process.GetProcessesByName Method (System.Diagnostics)](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.process.getprocessesbyname?view=netcore-3.1)
- [Process..::.GetProcessesByName 方法使用 - Robin99 - 博客园](https://www.cnblogs.com/yinhaiming/articles/1676887.html)
- [C# 中运行 exe 程序 - 慧由心生 - 博客园](https://www.cnblogs.com/shenchao/p/3556466.html)
- [[Solved] execute an exe file in C# - CodeProject](https://www.codeproject.com/Questions/304308/execute-an-exe-file-in-Csharp)
- [C#杀死一个进程与杀死进程的所有派生进程](http://www.liangshunet.com/ca/201409/134246140.htm)
- [C# 强制关闭当前程序进程（完全 Kill 掉不留痕迹） - 东方雎的专栏 - CSDN 博客](https://blog.csdn.net/proglovercn/article/details/42734379)
- [c#启动 EXE 文件（简单的） - 阿文 sky - 博客园](https://www.cnblogs.com/TBW-Superhero/p/5570650.html)
- [JAVA 和 C# 调用外部.exe 文件，传值并等等 exe 完成，获取返回值 - code_dream - 博客园](https://www.cnblogs.com/liuruitao/p/5715522.html)
- [window 下强制杀死某个进程用 taskkill /pid 进程号 -t -f 命令 - newhanzhe 的博客 - CSDN 博客](https://blog.csdn.net/newhanzhe/article/details/81135090)

## 常用

```c#
// Get the current process.
Process currentProcess = Process.GetCurrentProcess();


// Get all instances of Notepad running on the local
// computer.
Process [] localByName = Process.GetProcessesByName("notepad");


// Get all instances of Notepad running on the specifiec
// computer.
// 1. Using the computer alias (do not precede with "\\").
Process [] remoteByName = Process.GetProcessesByName("notepad", "myComputer");

// 2. Using an IP address to specify the machineName parameter.
Process [] ipByName = Process.GetProcessesByName("notepad", "169.0.0.0");


// Get all processes running on the local computer.
Process [] localAll = Process.GetProcesses();


// Get all processes running on the remote computer.
Process [] remoteAll = Process.GetProcesses("myComputer");


// Get a process on the local computer, using the process id.
Process localById = Process.GetProcessById(1234);


// Get a process on a remote computer, using the process id.
Process remoteById = Process.GetProcessById(2345, "myComputer");
```

### 结束进程

```c#
taskkill /im cmd.exe /f
taskkill /im WerFault.exe /f
taskkill /im csrss.exe /f
taskkill /im CefSharp.BrowserSubprocess.exe /f
taskkill /pid 928 -t -f
taskkill /im chrome.exe /f
```

### 运行程序

```c#
Process myProcess = new Process();
try
{
    myProcess.StartInfo.UseShellExecute = false;
    // You can start any process, HelloWorld is a do-nothing example.
    myProcess.StartInfo.FileName = "C:\\HelloWorld.exe";
    myProcess.StartInfo.CreateNoWindow = true;
    myProcess.Start();
    // This code assumes the process you are starting will terminate itself.
    // Given that is is started without a window so you cannot terminate it
    // on the desktop, it must terminate itself or you can do it programmatically
    // from this application using the Kill method.
}
catch (Exception e)
{
    Console.WriteLine(e.Message);
}
```

### C#如何判断程序调用的 exe 已结束

- [C#如何判断程序调用的 exe 已结束 - - ITeye 博客](https://dnanhui.iteye.com/blog/883323)

#### 方法一：这种方法会阻塞当前进程，直到运行的外部程序退出

```c#
System.Diagnostics.Process exep = System.Diagnostics.Process.Start(@"C:\Windows\Notepad.exe");
exep.WaitForExit();//关键，等待外部程序退出后才能往下执行
MessageBox.Show("Notepad.exe运行完毕");
```

### 方法二：为外部进程添加一个事件监视器，当退出后，获取通知，这种方法时不会阻塞当前进程，你可以处理其它事情

```c#
System.Diagnostics.Process exep = new System.Diagnostics.Process();
exep.StartInfo.FileName = @"C:\Windows\Notepad.exe";
exep.EnableRaisingEvents = true;
exep.Exited += new EventHandler(exep_Exited);
exep.Start();

//exep_Exited事件处理代码，这里外部程序退出后激活，可以执行你要的操作
void exep_Exited(object sender, EventArgs e)
{
    MessageBox.Show("Notepad.exe运行完毕");
}
```

### C# 调用外部.exe 文件，传值并等等 exe 完成，获取返回值

- [C#如何判断程序调用的 exe 已结束 - - ITeye 博客](https://dnanhui.iteye.com/blog/883323)
- [c#调用 exe 捕获返回值 - 积水成渊，蛟龙生焉。 - CSDN 博客](https://blog.csdn.net/u013230291/article/details/80615828)
- [https://www.itsvse.com/thread-2813-1-24.html](https://www.itsvse.com/thread-2813-1-24.html)
- [C# 运行控制台程序中文乱码 - 张&amp;娟 - 博客园](https://www.cnblogs.com/zjxyz2008zhangjuan/p/7246646.html)

#### 1. 方法一：获取返回值

```c#
string path = @"C:\GateWay\PrjCheck.exe";
string fileName = path;
Process p = new Process();
p.StartInfo.UseShellExecute = false;
p.StartInfo.RedirectStandardOutput = true;
p.StartInfo.FileName = fileName;
p.StartInfo.CreateNoWindow = true;
p.StartInfo.Arguments = "IHSUSAA_1508211711";//参数以空格分隔，如果某个参数为空，可以传入””
p.StartInfo.StandardOutputEncoding = Encoding.UTF8;
p.Start();
p.WaitForExit();
//此处可以返回一个字符串，此例是返回压缩成功之后的一个文件路径
string output = p.StandardOutput.ReadToEnd();
```

#### 2. 方法二：获取返回值

```c#
try
{
    var ProcessStartInfo = new ProcessStartInfo() { };
    ProcessStartInfo.FileName = @"C:\Windows\System32\curl.exe";
    ProcessStartInfo.Arguments = "-H 'Content-Type:text/plain' --data-binary @D:\\Tmp\\T\\urls.site.txt \"http://data.zz.baidu.com/urls?site=www.0.com&token=Mc3V999EjBSI0Ip\"";

    ProcessStartInfo.UseShellExecute = false;
    ProcessStartInfo.RedirectStandardInput = true;
    ProcessStartInfo.RedirectStandardOutput = true;
    ProcessStartInfo.RedirectStandardError = false;
    ProcessStartInfo.CreateNoWindow = true;
    ProcessStartInfo.WindowStyle = ProcessWindowStyle.Hidden;

    var process = Process.Start(ProcessStartInfo);

    string resaultValue = process.StandardOutput.ReadToEnd();
    process.WaitForExit();
    process.Close();

}
catch
{

}



 Process p = new Process();
bool returnvalue = false;

try
{

    p.StartInfo.FileName = "cmd.exe";//设定程序名
    p.StartInfo.UseShellExecute = false; //关闭Shell的使用
    p.StartInfo.RedirectStandardInput = true;//重定向标准输入
    p.StartInfo.RedirectStandardOutput = true;//重定向标准输出
    p.StartInfo.RedirectStandardError = true;//重定向错误输出
    p.StartInfo.CreateNoWindow = true;//设置不显示窗口
    p.StartInfo.StandardOutputEncoding = Encoding.UTF8;
    p.StartInfo.StandardOutputEncoding = Encoding.Default;
    string pingrst; p.Start(); p.StandardInput.WriteLine("ping -n 2 -w 1 -S " + strIp + " " + "www.baidu.com");
    p.StandardInput.WriteLine("exit");

    string strRst = p.StandardOutput.ReadToEnd();
    //Console.WriteLine(strRst);
    if (strRst.IndexOf("(100% 丢失)") != -1 || strRst.IndexOf("(100% loss)") != -1)
    {
        pingrst = "无法连接互联网";
        returnvalue = false;
    }
    else
    {
        pingrst = "连接";
        returnvalue = true;
    }
    Console.WriteLine($"IP: {strIp} 状态:{pingrst}");
}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
}
finally
{
    p.Close();
}
```
