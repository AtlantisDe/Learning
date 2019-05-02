# C# try

## 常用

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
