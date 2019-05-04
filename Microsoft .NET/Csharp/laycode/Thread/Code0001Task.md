# C# Task

## Task 异步获取返回值如 String 类型例子

```c#
Task<string> ReadAsStringAsync()

var contxt = rst.Content;
var aaa = contxt.ReadAsStringAsync();
var ccc = aaa.Result;
```
