# IEnumerable

- 递归操作
- [IEnumerable Interface (System.Collections)](https://docs.microsoft.com/en-us/dotnet/api/system.collections.ienumerable?view=netframework-4.8)
- [C# IEnumerable、List 在这儿有啥区别？如图？ - 知乎](https://www.zhihu.com/question/323080121/answer/688941002)

## 常用

```c#
// IEnumerable to string
IEnumerable<string> strs;
var v1 = String.Join("", strs);

var singleString = string.Join(",", _values.ToArray() );
```
