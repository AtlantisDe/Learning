# Obsolete

- [C#标记 [已弃用] 的方法 - 夜黔 - 博客园](https://www.cnblogs.com/Yukisora/p/8580314.html)

## C#标记 [已弃用] 的方法

```c#
[Obsolete]//标记该方法已弃用
/// <summary>
/// 你应该调用本类的 OpenMessageBox 方法
/// </summary>
public override void OpenBox()
{
    Debug.LogError("你应该调用本类的 OpenMessageBox 方法");
}
```

## 使用丢弃

```c#
 _ = new List<wordsaledbitem>();
```
