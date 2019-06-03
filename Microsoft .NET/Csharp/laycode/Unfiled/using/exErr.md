# exErr 异常日志

## 常用代码

```c#
var exErr = string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
```
