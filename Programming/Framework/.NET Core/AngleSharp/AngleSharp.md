# AngleSharp

- [AngleSharp - Home](http://anglesharp.github.io/)
- [AngleSharp/AngleSharp](https://github.com/AngleSharp/AngleSharp)
- [.NET Core 网络数据采集 -- 使用 AngleSharp 做 html 解析 - solenovex - 博客园](https://www.cnblogs.com/cgzl/p/8970582.html)
- [AngleSharp - Example Code](https://anglesharp.github.io/docs/Examples.html)

## Documentation

- [AngleSharp - Documentation](http://anglesharp.github.io/docs.html)

## Example Code

- [AngleSharp - Example Code](http://anglesharp.github.io/docs/Examples.html)

## 安装 AngleSharp

### 通过 Nuget

```c#
- 即可: https://www.nuget.org/packages/AngleSharp
```

```shell
Install-Package AngleSharp
```

### 或者 dotnet-cli

```shell
dotnet add package AngleSharp
```

## .NET Core 代码示例 1 复杂 HTML 解析

- [.NET Core 网络数据采集 -- 使用 AngleSharp 做 html 解析 - solenovex - 博客园](https://www.cnblogs.com/cgzl/p/8970582.html)

```C#
public static async Task ReadWithAngleSharpAsync()
{
    var htmlSourceCode = await SendRequestWithHttpClientAsync();
    var parser = new HtmlParser();
    var document = await parser.ParseAsync(htmlSourceCode);

    Console.WriteLine($"Serializing the (original) document: {document.QuerySelector("h1").OuterHtml}");
    Console.WriteLine($"Serializing the (original) document: {document.QuerySelector("html > body > h1").OuterHtml}");
}
```
