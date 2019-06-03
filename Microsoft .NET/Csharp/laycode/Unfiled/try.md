# C# try

## 常用

## 异常抓取代码 1

```c#
try
{
}
catch (Exception Ex)
{
Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));
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
