# Console application

- [how to run a winform from console application?](https://stackoverflow.com/questions/277771/how-to-run-a-winform-from-console-application)
- [ConsoleColor Enum (System)](https://docs.microsoft.com/en-us/dotnet/api/system.consolecolor?view=netcore-3.1)

## 0. 常用

```c#
[STAThread] /*自己加上*/
using System.Windows.Forms;

Console.Title = "控制台 [日志打印] (中心)";


"您好,欢迎使用".Log();


Application.Run(new CollectionTool.Demo.WinForms.Frm_DemoTel());
System.Environment.Exit(0);
"任务停止结束,可以停止控制台了....".Log();
System.Environment.Exit(0);
//Console.ReadLine();




SerilogApp.Log.ConsoleLogger.Warning("任务停止结束,可以停止控制台了....");
System.Environment.Exit(0);
//Console.ReadLine();


internal static class NativeMethods
{
    [DllImport("kernel32.dll")]
    internal static extern Boolean AllocConsole();
}

static class Program
{

    static void Main(string[] args) {
        if (args.Length == 0) {
            // run as windows app
            Application.EnableVisualStyles();
            Application.Run(new Form1());
        } else {
            // run as console app
            NativeMethods.AllocConsole();
            Console.WriteLine("Hello World");
            Console.ReadLine();
        }
    }

}

[STAThread]
void Main(string[] args])
{
   Application.EnableVisualStyles();
   //Do some stuff...
   while(!Exit)
   {
       Application.DoEvents(); //Now if you call "form.Show()" your form won´t be frozen
       //Do your stuff
   }
}
```

### 1. Console.SetWindowSize(Int32, Int32) Method

- [Console.SetWindowSize(Int32, Int32) Method (System)](https://docs.microsoft.com/en-us/dotnet/api/system.console.setwindowsize?view=netcore-3.1)
- [How to get the screen size of Console Application?](https://stackoverflow.com/questions/10675732/how-to-get-the-screen-size-of-console-application)
- [Setting position of a Console Window opened in a WinForms App](https://stackoverflow.com/questions/1548838/setting-position-of-a-console-window-opened-in-a-winforms-app)
- [Console.SetWindowPosition(Int32, Int32) Method (System)](https://docs.microsoft.com/en-us/dotnet/api/system.console.setwindowposition?view=netcore-3.1)

```c#
var w = Console.WindowWidth;
var h = Console.WindowHeight;

// Form版本渲染
Screen.PrimaryScreen.Bounds
Screen.PrimaryScreen.WorkingArea

// 计算
var largestWindowX = Console.LargestWindowWidth;
var largestWindowY = Console.LargestWindowHeight;


int origWidth, width;
int origHeight, height;
origWidth = Console.WindowWidth;
origHeight = Console.WindowHeight;

width = origWidth / 2;
height = origHeight / 2;
Console.SetWindowSize(width, height);

```

### 2. 热更新

- [C#单个程序集代码热更新\_逍遥游 Free 的博客-CSDN 博客](https://blog.csdn.net/qq_22553301/article/details/79183793)

```c#

```
