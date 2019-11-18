# C# Thread

- [C#　用匿名委托的方式简化 Thread 和 Controle.Invoke 的写法](https://www.xuebuyuan.com/532327.html)
- [C#综合揭秘——细说多线程（上）](https://www.cnblogs.com/leslies2/archive/2012/02/07/2310495.html)
- [C#中如何判断当前线程是否为主线程](https://blog.csdn.net/coffeecato/article/details/53336896)
- [c#多线程总结（纯干货）](https://www.cnblogs.com/wyt007/p/9486752.html)
- [C# 多线程](http://www.runoob.com/csharp/csharp-multithreading.html)

## 线程安全

- [多线程下 C#如何保证线程安全? - 心灵智者 - 博客园](https://www.cnblogs.com/janghe/p/7875093.html)

## 相关代码

```c#

```

## 参考一

```c#
Thread oThread = new Thread(new ThreadStart(threadMethod));
private void threadMethod(){
};
```

## 传递参数

```c#
public static void myStaticParamThreadMethod(Object obj)  {
Console.WriteLine(obj);}

Thread thread = new Thread(myStaticParamThreadMethod);
thread.start(obj);
```

## 匿名

```c#
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

## 线程间 UI 操作

```c#
if (this.IsHandleCreated)
{
    this.Invoke((EventHandler)delegate
    {


    });
}
```

## IDE0017 可以简化对象初始化

```c#
Thread oThread = new Thread(delegate(){}){IsBackground = true};
oThread.Start();
```
