# Form

- [在创建窗口句柄之前,不能在控件上调用 Invoke 或 BeginInvoke](https://www.cnblogs.com/fish124423/archive/2012/10/16/2726543.html)
- [c# Winform 多线程操作 - 伪装大牛 - 博客园](https://www.cnblogs.com/SoftWareIe/p/9650947.html)
- [How can I open multiple forms in C#?](https://stackoverflow.com/questions/12052670/how-can-i-open-multiple-forms-in-c)
- [Winform c# 多线程处理实例 - SDP 软件快速开发平台 - 博客园](https://www.cnblogs.com/szzzzn/p/11169423.html)
- [winform 多线程经典实例超级简单易懂-冯海滨博客](http://www.fenghaibin.com/?id=1322)
- [winform 多线程，操作主线程用户界面 小鹰信息技术服务部-CSDN 博客 winform 多线程](https://blog.csdn.net/zhouyingge1104/article/details/84728772)
- [Spawn a new thread to open a new window and close it from a different thread](https://stackoverflow.com/questions/4698080/spawn-a-new-thread-to-open-a-new-window-and-close-it-from-a-different-thread)
- [C#多线程中访问 winform 控件 (解决 Winform 对象当前正在其他地方使用) - 小张.NET - 博客园](https://www.cnblogs.com/xiaozhang/p/12769176.html)

## 0. 常用

```c#
public System.Windows.Forms.Form ParentWindow { get; set; }

```

## 1. 属性

```C#
this.components
this.IsDisposed
this.Parent.IsHandleCreated
Control.Invoke：在拥有此控件的线程上先进先出顺序执行委托
Control.BeginInvoke:在拥有此控件线程上异步执行委托，也就是可能并非顺序执行，这个有点熟悉，貌似说过了

C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.7.2\WindowsBase.dll
WindowsBase
```

## 2. 线程安全

- [winform 多线程 - 我为女狂 - CSDN 博客](https://blog.csdn.net/qq_36598803/article/details/77641635)

```c#
Thread oThread = new Thread(delegate ()
{
    var frm = new System.Windows.Forms.Form() { Text = "我是子 线程的 winform", Width = 500 };
    frm.Show();
    frm.Shown += (object sender, EventArgs e) =>
    {
    };

});
oThread.IsBackground = true;
oThread.Start();
```

## 3. 常用代码

### 1. 图标

```c#
this.Icon = Properties.Resources.M;
```

### 2. Anchor

```c#
button1.Anchor = (AnchorStyles.Bottom | AnchorStyles.Right);

Anchor = (AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right)

```

### 3. 输入框窗口

```c#
using (var frm = new MetroFramework.Forms.MetroForm())
{
    frm.Text = $"当前操作: {item.BaiduUser} /  {item.NetEase163User}";
    frm.Size = new Size(888, 366);
    var br = new Google.Net.WinForms.Engine.Chrome.Uc.HelloBrowser { Dock = DockStyle.Fill };
    frm.Controls.Add(br);
    frm.Shown += (object sender0, EventArgs e0) =>
    {
        br.LoadUrl = "https://www.baidu.com/";
    };

    frm.ShowDialog();
}
```

### 4. CheckBox

```c#

// CheckStateChanged 事件
this.C_Demo.CheckStateChanged += C_Demo_CheckStateChanged;


```
