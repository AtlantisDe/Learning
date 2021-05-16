# C# try

## 常用

```c#
// TryAddWithoutValidation
request.Headers.TryAddWithoutValidation("Connection", "keep-alive");
```

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

## API

```c#
            var root = new apiPublishDynamic
            {
                Expando = new ExpandoObject(),
                code = -1,
                message = "结果未知!"
            };

            try
            {


                root.code = 200;
                root.message = "百度自动推送Token信息保存配置成功!";

            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));

                root.code = 100;
                root.message = string.Format("异常[{0}]", ex.Message + "\r\n");


            }
            finally
            {
            }


            return root;


```

## 常用常用

```c#
try
{

}
catch (Exception ex)
{
    var exErr = string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
    Console.WriteLine(exErr);
    MessageBox.Show(exErr, "异常", MessageBoxButtons.OK, MessageBoxIcon.Information);
}
finally
{
}
```

## 测试异常 Demo

```c#
try
{

    string aaa =  null;
    int bb = aaa.Length;

}
catch (Exception ex)
{

    LogsExtenions.ConsoleLogger.Information( ex.Message);
    //LogsExtenions.DebugPrintExceptionLog(System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message);
}
finally
{
}
```
