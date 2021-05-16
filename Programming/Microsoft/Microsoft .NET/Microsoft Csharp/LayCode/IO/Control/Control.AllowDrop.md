# Control.AllowDrop

- [Control.AllowDrop Property (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.control.allowdrop?view=netcore-3.1)
- [C# 实现文件拖拽功能（Winform） 大道至简，知易行难-CSDN 博客 c# 拖拽文件](https://blog.csdn.net/shufac/article/details/95045732)

## 常用

```c#
// Gets or sets a value indicating whether the control can accept data that the user drags onto it.
// 获取或设置一个值，该值指示控件是否可以接受用户拖动到其上的数据。


// 1、关键知识点说明：
// 通过DragEnter事件获得被拖入窗口的“信息”(可以是若干文件，一些文字等等)，在DragDrop事件中对“信息”进行解析。窗体的AllowDrop属性必须设置成true;且必须有DragEnter事件(单独写DragDrop事件是不会具有拖拽功能的)。

// 2、属性设置

// 1）AllowDrop 属性设为True

// 3、代码实现
```
