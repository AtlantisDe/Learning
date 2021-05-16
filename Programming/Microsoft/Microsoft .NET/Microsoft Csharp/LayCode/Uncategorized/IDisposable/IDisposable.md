# IDisposable

- [深入理解 C#中的 IDisposable 接口 - 进击的辣条 - 博客园](https://www.cnblogs.com/wyt007/p/9304564.html)

## 接口释放资源代码

### 接口

```C#
public class MyClass:IDisposable
{
    /// <summary>执行与释放或重置非托管资源关联的应用程序定义的任务。</summary>
    public void Dispose()
    {
    }
}
```

### Using

```C#
public class MyClass:IDisposable
using(var mc = new MyClass())
{
}
```

### Demo

```C#
public class MyClass : IDisposable
{
    /// <summary>
    /// 模拟一个非托管资源
    /// </summary>
    private IntPtr NativeResource { get; set; } = Marshal.AllocHGlobal(100);
    /// <summary>
    /// 模拟一个托管资源
    /// </summary>
    public Random ManagedResource { get; set; } = new Random();
    /// <summary>
    /// 释放标记
    /// </summary>
    private bool disposed;
    /// <summary>
    /// 为了防止忘记显式的调用Dispose方法
    /// </summary>
    ~MyClass()
    {
        //必须为false
        Dispose(false);
    }
    /// <summary>执行与释放或重置非托管资源关联的应用程序定义的任务。</summary>
    public void Dispose()
    {
        //必须为true
        Dispose(true);
        //通知垃圾回收器不再调用终结器
        GC.SuppressFinalize(this);
    }
    /// <summary>
    /// 非必需的，只是为了更符合其他语言的规范，如C++、java
    /// </summary>
    public void Close()
    {
        Dispose();
    }
    /// <summary>
    /// 非密封类可重写的Dispose方法，方便子类继承时可重写
    /// </summary>
    /// <param name="disposing"></param>
    protected virtual void Dispose(bool disposing)
    {
        if (disposed)
        {
            return;
        }
        //清理托管资源
        if (disposing)
        {
            if (ManagedResource != null)
            {
                ManagedResource = null;
            }
        }
        //清理非托管资源
        if (NativeResource != IntPtr.Zero)
        {
            Marshal.FreeHGlobal(NativeResource);
            NativeResource = IntPtr.Zero;
        }
        //告诉自己已经被释放
        disposed = true;
    }
}
```
