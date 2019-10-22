# C# try

## 常用

## 异常抓取代码 1

```c#
try
{
}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
}
finally
{
}

try
{
}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常信息:{0}", ex.Message));
}
finally
{
}
```

## 异常抓取代码 2

```c#
try
{
}
catch (Exception ex)
{
    var exErr = string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
    Console.WriteLine(exErr);
}
finally
{
}
```

## 综合常用 Catch

```c#
catch (AggregateException ex)
{
    Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));
    root.code = 100;
    root.message = string.Format("异常[{0}]", ex.Message + "\r\n" + rebody);

    foreach (var errInner in ex.InnerExceptions)
    {
        Console.WriteLine(errInner);
    }
}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message));
}
```
