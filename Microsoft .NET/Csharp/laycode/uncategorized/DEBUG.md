# DEBUG

## 常用代码

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
