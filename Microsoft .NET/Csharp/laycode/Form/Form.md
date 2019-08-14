# Form

- [在创建窗口句柄之前,不能在控件上调用 Invoke 或 BeginInvoke](https://www.cnblogs.com/fish124423/archive/2012/10/16/2726543.html)

## 属性

```C#
this.components
this.IsDisposed
this.Parent.IsHandleCreated
Control.Invoke：在拥有此控件的线程上先进先出顺序执行委托
Control.BeginInvoke:在拥有此控件线程上异步执行委托，也就是可能并非顺序执行，这个有点熟悉，貌似说过了
```

## 线程安全

- [winform 多线程 - 我为女狂 - CSDN 博客](https://blog.csdn.net/qq_36598803/article/details/77641635)

```c#
Thread oThread = new Thread(delegate ()
{
    var frm_th = new System.Windows.Forms.Form() { Text = "我是子 线程的 winform", Width = 500 };
    frm_th.Show();
    frm_th.Shown += (object sender, EventArgs e) =>
    {
    };

});
oThread.IsBackground = true;
oThread.Start();
```

## 常用代码

### 图标

```c#
this.Icon = Properties.Resources.M;
```
