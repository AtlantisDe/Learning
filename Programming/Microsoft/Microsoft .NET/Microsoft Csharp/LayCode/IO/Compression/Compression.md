# Compression

- [How to: Compress and extract files](https://docs.microsoft.com/en-us/dotnet/standard/io/how-to-compress-and-extract-files)
- System.IO.Compression

## 常用

```c#
using System;
using System.IO.Compression;

class Program
{
    static void Main(string[] args)
    {
        string startPath = @".\start";
        string zipPath = @".\result.zip";
        string extractPath = @".\extract";

        ZipFile.CreateFromDirectory(startPath, zipPath);

        ZipFile.ExtractToDirectory(zipPath, extractPath);
    }
}
```
