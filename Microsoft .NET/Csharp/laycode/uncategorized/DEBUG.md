# DEBUG

## 常用代码

```c#
// Release编译的dll显示如下：
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints)]
// 而Debug编译的dll将显示：
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.DisableOptimizations | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints | DebuggableAttribute.DebuggingModes.EnableEditAndContinue)]

```

```c#
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
