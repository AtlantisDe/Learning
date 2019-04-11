# C#程序启动引发问题

## 相关代码

```c#
// System.InvalidOperationException:“在应用程序中创建第一个 IWin32Window 对象之前，必须调用 SetCompatibleTextRenderingDefault。”
Application.SetCompatibleTextRenderingDefault(false);
//这里才能出现UI控件
```
