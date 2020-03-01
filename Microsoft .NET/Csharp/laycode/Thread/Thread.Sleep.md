# 11

-[SpinWait.SpinOnce 方法 (System.Threading)](https://docs.microsoft.com/zh-cn/dotnet/api/system.threading.spinwait.spinonce?view=netframework-4.7.2#moniker-applies-to)

- [Thread.Sleep(0) vs Sleep(1) vs Yeild - stg609 - 博客园](https://www.cnblogs.com/stg609/p/3857242.html)
- [C# SpinWait 实现\_C#\_weixin_34038293 的博客-CSDN 博客](https://blog.csdn.net/weixin_34038293/article/details/85957903)
- [Thread.Sleep() 和 Thread.SpinWait() - 茗::流 - 博客园](https://www.cnblogs.com/rose0705/articles/5860011.html)
- [SpinWait 的性能高于 Thread.Sleep*Java*发展是曲折的但也是前进的-CSDN 博客](https://blog.csdn.net/CNHK1225/article/details/78654071)

## 常用

```c#

Thread.Sleep(1000);
Thread.Sleep()方法：是强制放弃CPU的时间片，然后重新和其他线程一起参与CPU的竞争。


Thread.SpinWait(1000);
Thread.SpinWait()方法：只是让CPU去执行一段没有用的代码。当时间结束之后能马上继续执行，而不是重新参与CPU的竞争。



// 用Sleep()方法是会让线程放弃CPU的使用权。
// 用SpinWait()方法是不会放弃CPU的使用权。

每隔10毫秒执行一次。

do{
Thread.SpinWait(10);  //自旋10毫秒
Thread.Sleep(10);       //休眠10毫秒
}while(true);


// 结果：Thread.SpinWait(10);  CPU被占满 100% —— “自旋” （这个词的意思 或许就是说：没事做的时候，也要折腾一点事儿出来）。
当然：
// Thread.SpinWait(10);  精度准一点（没有线程的 唤醒时间，休眠10ms，实际休眠 10.001 ms）
// Thread.Sleep(10);  精度差一点（有线程的 唤醒时间，休眠10ms，实际休眠 10.1 ms）

/// <summary>申请锁</summary>
/// <param name="msTimeout"></param>
/// <returns></returns>
public Boolean Acquire(Int32 msTimeout)
{
    var ch = Client;
    var now = TimerX.Now;
    var sw = new SpinWait();

    // 循环等待
    var end = now.AddMilliseconds(msTimeout);
    while (true)
    {
        var expire = now.AddMilliseconds(msTimeout);

        // 申请加锁。没有冲突时可以直接返回
        var rs = ch.Add(Key, expire);
        if (rs) return true;

        now = DateTime.Now;
        if (now > end) break;

        // 死锁超期检测
        var dt = ch.Get<DateTime>(Key);
        if (dt <= now)
        {
            // 开抢死锁。所有竞争者都会修改该锁的时间戳，但是只有一个能拿到旧的超时的值
            expire = now.AddMilliseconds(msTimeout);
            var old = ch.Replace(Key, expire);
            // 如果拿到超时值，说明抢到了锁。其它线程会抢到一个为超时的值
            if (old <= now) return true;
        }

        // 没抢到，继续
        //Thread.Sleep(20);
        sw.SpinOnce();
    }

    return false;
}
```
