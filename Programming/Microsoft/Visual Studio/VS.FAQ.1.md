# Visual Studio 常见问题

- [MSDN](<https://docs.microsoft.com/zh-cn/previous-versions/ms123401(v=msdn.10)>)
- [VS NuGet 加载本地程序包](https://www.git-scm.com/download/win)
- [NuGet](https://www.cnblogs.com/nizhenghua/p/6422078.html)
- [Create .NET apps faster with NuGet](https://www.nuget.org/)
- [再编写代码中报错：CS8107 C# 7.0 中不支持功能“xxxxxx”。请使用 7.1 或更高的语言版本。](https://www.cnblogs.com/heheblog/p/net_error_CS8107.html)
- [打开提示加载失败--该项目需要用户输入...](https://blog.csdn.net/zhengleiqing/article/details/38341037)

## 0. NuGet

## 1. 自适应调用 64 位 32 位 DLL

- 文件属性设置 如果比较新则复制/ 复制到输出目录 // 同时生成操作设置 无
- [C# 自适应调用 64 位 32 位 DLL - zinger 的博客 - CSDN 博客](https://blog.csdn.net/zingerchina/article/details/82586639)

## 2. c#应用程序生成的.application 和.exe.manifest 文件

- [c#应用程序生成的.application 和.exe.manifest 文件-CSDN 论坛](https://bbs.csdn.net/topics/390661303?page=1)

## 3. 选项/配置

- [Visual Studio 2017 代码右侧带缩略图的滚动条显示与隐藏](https://blog.csdn.net/jinzhengxi/article/details/82190483)

```c#
// 代码缩略图的窗口
// 方法其实就是：

// 1. 右键缩略图，在右击菜单中选择 "滚动条选项" (英文：Scroll Bar Options...)
滚动条 -- 所有语言 -- 使用垂直滚动条的缩略图模式 -- 中
// 2. 在"选项"界面中，将"使用垂直滚动条的缩略图模式" 改为 "使用垂直滚动条的条状模式", 缩略图就不见了，问题解决了。哈哈哈
```
