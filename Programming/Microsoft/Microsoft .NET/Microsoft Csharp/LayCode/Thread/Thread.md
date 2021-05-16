# C# Thread

- [Thread Class (System.Threading)](https://docs.microsoft.com/en-us/dotnet/api/system.threading.thread?view=netcore-3.1)
- [C#　用匿名委托的方式简化 Thread 和 Controle.Invoke 的写法](https://www.xuebuyuan.com/532327.html)
- [C#综合揭秘——细说多线程（上）](https://www.cnblogs.com/leslies2/archive/2012/02/07/2310495.html)
- [C#中如何判断当前线程是否为主线程](https://blog.csdn.net/coffeecato/article/details/53336896)
- [c#多线程总结（纯干货）](https://www.cnblogs.com/wyt007/p/9486752.html)
- [C# 多线程](http://www.runoob.com/csharp/csharp-multithreading.html)
- [C#中线程的建立、挂起、继续与销毁 ShineRoyal-CSDN 博客 c# 销毁线程](https://blog.csdn.net/qq_27508477/article/details/87177332)

## 1. 线程安全

- [C#Thread 学习 - 翻白眼的哈士奇 - 博客园](https://www.cnblogs.com/yaosj/p/10682580.html#_label1)
- [多线程下 C#如何保证线程安全? - 心灵智者 - 博客园](https://www.cnblogs.com/janghe/p/7875093.html)

## 2. 相关代码

```c#
System.Threading.Thread.Sleep(5000);



```

## 3. 参考一

```c#
Thread oThread = new Thread(new ThreadStart(threadMethod));
private void threadMethod(){
};
```

## 4. 传递参数

```c#
public static void myStaticParamThreadMethod(Object obj)  {
Console.WriteLine(obj);}

Thread thread = new Thread(myStaticParamThreadMethod);
thread.start(obj);
```

## 6. 匿名

```c#
var oThread = new Thread(delegate ()
{

})
{ IsBackground = true };
oThread.Start();

Thread oThread = new Thread(delegate () { })
{
    IsBackground = true
};
oThread.Start();

Thread oThread = new Thread(delegate(){});
oThread.IsBackground = true;
oThread.Start();



var oThread = new System.Threading.Thread(delegate () { });
oThread.IsBackground = true;
oThread.Start();


var Th1 = new Thread(delegate ()
{

    Parallel.For(0, 10000000, new ParallelOptions() { MaxDegreeOfParallelism = 5000 }, (i, loopState) =>
    {

    });

})
{
    IsBackground = true
};
Th1.Start();
```

```c#
Thread t = new Thread(delegate(){});
t.IsBackground = true;
t.Start();
```

```c#
Thread thread_ui = new Thread(delegate ()
{
    while (true)
    {
    }
});
thread_ui.IsBackground = true;
thread_ui.Start();
```

## 7. 线程间 UI 操作

```c#
var th = new Thread(delegate ()
{

    if (this.IsHandleCreated)
    {
        this.Invoke((EventHandler)delegate
        {

        });
    }
})
{ IsBackground = true };
th.Start();


if (this.IsHandleCreated)
{
    this.Invoke((EventHandler)delegate
    {
    });
}
```

## 8. IDE0017 可以简化对象初始化

```c#
Thread oThread = new Thread(delegate(){}){IsBackground = true};
oThread.Start();

```

## 9. 线程销毁

## 10. ManualResetEvent

- [详解 ManualResetEvent - li-peng - 博客园](https://www.cnblogs.com/li-peng/p/3291306.html)

```c#
// 当初始化为true时，为终止状态
static ManualResetEvent _mre = new ManualResetEvent(true);
// 当初始化为false时，为非终止状态

// 终止状态时WaitOne()允许线程访问下边的语句
// 非终止状态时WaitOne()阻塞线程，不允许线程访问下边的语句


// 接下来你可能就会想当在非终止状态时怎么让线程继续执行，怎么再让它停下来，这就要用了set()和Reset()方法了
// 把非终止状态改为终止状态用Set()方法
// 把终止状态改为非终止状态用Reset()方法

static ManualResetEvent _mre = new ManualResetEvent(false);

var exitEvent = new System.Threading.ManualResetEvent(false);
using (var client = new Websocket.Client.WebsocketClient(new Uri("ws://xxx")))
{
    Task.Run(() => client.Send(""));
    exitEvent.WaitOne();
}
```

## 11. 实现每隔规定的时间段自动执行程序

```c#
// 方法一： 使用System.Timers.Timer 类
System.Timers.Timer time = new System.Timers.Timer(30000); //实例化Timer类，规定每隔30秒执行一次
            time.Elapsed +=new System.Timers.ElapsedEventHandler(aa); //当达到规定的时间内执行aa 这个方法
            time.AutoReset = true;//false 执行一次，true 一直执行
            time.Enabled = true;//设置是否执行time.Elapsed 时间

   private void aa(object source, System.Timers.ElapsedEventArgs e)
   {
    //方法体
   }


// 方法二：使用线程执行方法，在方法中实现死循环，在每个循环中执行join 方法
Thread testThread = new Thread(bb);
testThread.Start();
 
 
private void bb()
{
     while (true)
      {
        //方法体
        testThread.Join(30000); //设定阻止时间
                
     }
}

// 以上两种方法比较常见也比较简单。可在实际中使用。

```
