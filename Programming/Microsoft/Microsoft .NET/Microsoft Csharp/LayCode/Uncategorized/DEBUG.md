# DEBUG

- [How can I test if code is running in debug mode? - C# / C Sharp](https://bytes.com/topic/c-sharp/answers/269538-how-can-i-test-if-code-running-debug-mode)
- [How to know whether application is in release or debug mode using v...](https://forums.asp.net/t/1552928.aspx?How+to+know+whether+application+is+in+release+or+debug+mode+using+vb+net+code)
- [C# 测试代码#if DEBUG 使用 C# parasoft 的专栏-CSDN 博客](https://blog.csdn.net/parasoft/article/details/88237706)

## 常用代码

```c#
// Release编译的dll显示如下：
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
// 而Debug编译的dll将显示：
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.DisableOptimizations | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints | DebuggableAttribute.DebuggingModes.EnableEditAndContinue)]

```

```c#

// 如果在项目中设置"定义DEBUG常量(U)"（Define DEBUG constant(U)）为不勾选，则可以达到在Debug模式下使用调试代码。

//下面这个代码也是不准确的...
public class CheckDesingModel
{
    public static bool IsDesingMode()
    {
        bool ReturnFlag = false;
        if (LicenseManager.UsageMode == LicenseUsageMode.Designtime)
            ReturnFlag = true;
        else if (System.Diagnostics.Process.GetCurrentProcess().ProcessName == "devenv")
            ReturnFlag = true;
        if (ReturnFlag)
            LogsExtenions.DebuglogPrinting("设计模式");
        else
            LogsExtenions.DebuglogPrinting("非设计模式！");
        return ReturnFlag;
    }
}

#if DEBUG

    // 调试用代码

    ……

    ……

#endif
```

### 0. 代码示例

```c#
#if DEBUG

#endif
```

### 1. 代码示例

```c#
#if DEBUG

// 调试用代码
args = new string[1] { "demo" };

#endif

#if RELEASE

// 调试用代码
args = new string[1] { "demo" };

#endif
```
