# IsNumber

- [Char.IsNumber Method (System)](https://docs.microsoft.com/en-us/dotnet/api/system.char.isnumber?view=netframework-4.8)
- [C#中有无像vb一样的IsNumeric函数? - 调试易](https://www.debugease.com/csharp/1449686.html)

```c#
using System;

public class IsNumberSample {
public static void Main() {
    string str = "non-numeric";

    Console.WriteLine(Char.IsNumber('8'));// Output: "True"
    Console.WriteLine(Char.IsNumber(str, 3));// Output: "False"
}
}

// (1,34): error CS1012: Too many characters in character literal

Console.WriteLine(Char.IsNumber('88888888888888888888'));
Console.WriteLine(Char.IsNumber("dasdsa", 3));

```
