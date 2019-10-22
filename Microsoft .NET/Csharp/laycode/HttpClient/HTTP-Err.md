# HTTP Err

## 常用

### 1.发生一个或多个错误

- [c# – 发生了一个或多个错误：PostAsJsonAsync - 程序园](http://www.voidcn.com/article/p-exwgxgms-buh.html)

```c#
catch (AggregateException err)
{
    foreach (var errInner in err.InnerExceptions)
    {
        Console.WriteLine(errInner);
    }
}
finally
{
}

catch (AggregateException ex)
{
    foreach (var errInner in ex.InnerExceptions)
    {
        Console.WriteLine(errInner);
    }
}
finally
{
}
```

### 2. 基础连接已经关闭: 连接被意外关闭,错误的解决

- [c# 基础连接已经关闭: 连接被意外关闭,错误的解决 - NET 未来之路 - 博客园](https://www.cnblogs.com/lonelyxmas/p/5138792.html)
