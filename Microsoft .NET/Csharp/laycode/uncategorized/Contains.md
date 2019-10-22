# Contains

- [C# 让 String.Contains 忽略大小写 - 海~~D - 博客园](https://www.cnblogs.com/hai--d/p/4545940.html)

## 常用

### 调试

- tring.Contains 是大小写敏感的

```c#
Console.WriteLine("Hello world".Contains("h"));
Console.WriteLine("Hello world".Contains("H"));
Console.WriteLine("Hello world".Contains("111"));

False
True
False
```

### 高效点查询

```c#

Console.WriteLine("Hello world".ContainsCase("h"));
Console.WriteLine("Hello world".ContainsCase("H"));
Console.WriteLine("Hello world".ContainsCase("111"));

True
True
False

string title = "STRING";
bool contains = title.IndexOf("string", StringComparison.OrdinalIgnoreCase) >= 0;

public static bool Contains(this string source, string toCheck, StringComparison comp) {
    return source.IndexOf(toCheck, comp) >= 0;
}
```
