# MetroFramework

- [How to use Winforms Modern UI Metro framework](https://csharp-tutorials1.blogspot.com/2016/12/how-to-use-winforms-modern-ui-metro.html)
- [Metroframework](http://thielj.github.io/MetroFramework/)
- [MetroFramework](https://github.com/AshishKilmist/MetroFramework)
- [peters/winforms-modernui](https://github.com/peters/winforms-modernui)
- [AshishKilmist/MetroFramework /MetroFramework.Demo/MainForm.cs](https://github.com/AshishKilmist/MetroFramework/blob/master/MetroFramework.Demo/MainForm.cs)
- [peters/winforms-modernui](https://github.com/peters/winforms-modernui)

## 0. MetroFramework 代码

```c#



public MetroFramework.Forms.MetroForm ParentWindow { get; set; }

Textarea1Btn : MetroFramework.Forms.MetroForm

MetroFramework.Controls.MetroUserControl

MetroFramework.MetroTaskWindow.ShowTaskWindow(this,"SubControl in TaskWindow", new TaskWindowControl(), 10);

MetroFramework.MetroMessageBox.Show(this, "This is a sample `default` MetroMessagebox ", "MetroMessagebox");

MetroFramework.MetroMessageBox.Show(this, "文件不存在!", "警告");

this.Icon = Nasa.Net.Properties.Resources.Admin;


```

## 1. 安装

- [MetroModernUI 1.4.0](https://www.nuget.org/packages/MetroModernUI)

```c#
Install-Package MetroModernUI -Version 1.4.0
```

## 2. 常用操作

### 1. 打开窗口

```c#
using (var frm = new MetroFramework.Forms.MetroForm())
{
    frm.Text = $"当前操作: {item.BaiduUser} /  {item.NetEase163User}";
    frm.Size = new Size(888, 366);
    frm.Controls.Add(new GoogleEmpire.Net.WinForms.Engine.SmallTools.Uc.UcTemplateTool { Dock = DockStyle.Fill });

    frm.ShowDialog();
}

/*默认代码 以下代码不能同时加上否则 将导致不能再任务栏显示图标*/
//frm.ShowInTaskbar = true;
//frm.MaximizeBox = true;
//frm.MinimizeBox = true;
//frm.StartPosition = FormStartPosition.CenterParent;

frm.WindowState = FormWindowState.Maximized;

```

### 2. DEMO Code

```c#
this.Icon = Test.Net.Properties.Resources.MainIco;
```
