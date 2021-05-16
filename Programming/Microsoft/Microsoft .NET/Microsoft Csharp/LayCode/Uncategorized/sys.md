# C# 系统常用

## 延时不卡界面

```c#
public static void Delay(int milliSecond)
{
    int start = Environment.TickCount;
    while (Math.Abs(Environment.TickCount - start) < milliSecond)
    {
        Application.DoEvents();
    }
}
```

## 延时不卡界面 2

```c#
MessageBox.Show("aa", "title", MessageBoxButtons.OK, MessageBoxIcon.Information);
```
