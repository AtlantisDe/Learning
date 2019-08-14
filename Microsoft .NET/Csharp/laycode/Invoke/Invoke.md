# Invoke | BeginInvoke

- [在创建窗口句柄之前,不能在控件上调用 Invoke 或 BeginInvoke](https://www.cnblogs.com/fish124423/archive/2012/10/16/2726543.html)
- [[C#基础]c#中的 BeginInvoke 和 EndEndInvoke](https://www.cnblogs.com/wolf-sun/p/5675791.html)

```C#
this.Invoke((EventHandler)delegate{});
if (this.IsHandleCreated)
{
}
```

## 在创建窗口句柄之前，不能在控件上调用 Invoke 或 BeginInvoke

```C#
// 先判断if (this.IsHandleCreated) 才能invoke
Control.Invoke：在拥有此控件的线程上先进先出顺序执行委托
Control.BeginInvoke:在拥有此控件线程上异步执行委托，也就是可能并非顺序执行，这个有点熟悉，貌似说过了


if (this.IsHandleCreated)
{
    this.Invoke((EventHandler)delegate
    {

        this.T_YunClientService_status.Text = yun_message;

    });
}


```
