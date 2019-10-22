# exceptions

- [How to: Create User-Defined Exceptions](https://docs.microsoft.com/en-us/dotnet/standard/exceptions/how-to-create-user-defined-exceptions)
- [YouTube](https://www.youtube.com/watch?v=19JoW_NHDE4)
- [C# 自定义异常类 throw 语句抛出异常 - YouxiBug - CSDN 博客](https://blog.csdn.net/u011528448/article/details/25248241)
- [YouTube](https://www.youtube.com/watch?v=9qHb-2Edg7o)

```c#
using System;

public class EmployeeListNotFoundException : Exception
{
    public EmployeeListNotFoundException()
    {
    }

    public EmployeeListNotFoundException(string message)
        : base(message)
    {
    }

    public EmployeeListNotFoundException(string message, Exception inner)
        : base(message, inner)
    {
    }
}
```
