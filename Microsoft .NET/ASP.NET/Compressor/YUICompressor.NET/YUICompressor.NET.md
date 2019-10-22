# YUICompressor.NET

- [YUICompressor-NET/YUICompressor.NET](https://github.com/YUICompressor-NET/YUICompressor.NET)
- 依赖:EcmaScript.NET

## 用法

```c#
Package Name: YUICompressor.NET
CLI: install-package YUICompressor.NET
```

### 1. css

```c#
//读取Css文件并压缩另存文件
CssCompressor compressor = new CssCompressor();
Console.WriteLine("默认编码：" + compressor.ContentType);
string filename = @"L:\ABCSolution\StaticFile\StaticFile\Css\WLSite.css";
string newfilename = @"L:\ABCSolution\StaticFile\StaticFile\Css\WLSite.min.css";

string source = File.ReadAllText(filename);
source = compressor.Compress(source);
File.WriteAllText(newfilename, source);
```

### 2. Js

```c#
//Javascript 压缩
JavaScriptCompressor compressor = new JavaScriptCompressor();
Console.WriteLine("默认编码：" + compressor.Encoding.EncodingName);
Console.WriteLine("默认文件类型：" + compressor.ContentType);
//使用utf-8 编码文件
compressor.Encoding = Encoding.UTF8;
string filename = @"L:\ABCSolution\StaticFile\StaticFile\Js\cover3.0.js";
string newfilename = @"L:\ABCSolution\StaticFile\StaticFile\Js\cover3.0.min.js";

string source = File.ReadAllText(filename);
source = compressor.Compress(source);
File.WriteAllText(newfilename, source);
```
