# C# Function

## 常用

## 代码 1

```c#
go_Demo_001();
bool go_Demo_001()
{

return true;
}

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
