# Extensions

- [Extension Methods - C# Programming Guide](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/extension-methods)

## 常用结构代码

```c#
DataEngineDemoExtenions

public static class DataEngineDemoExtenions
{
}
```

## Demo

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CsharpLazycode.Module.Extensions
{
    class ListExtenions
    {
    }
}

public static class ListExtensions
{
    public static string toStringWithNewline<T>(this List<T> list)
    {
        var tmp = "";
        for (int i = 0; i < list.Count; i++)
        {

        }

        return tmp;
    }
}

```
