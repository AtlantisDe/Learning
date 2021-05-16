# ZipFile Class

- [ZipFile Class (System.IO.Compression)](https://docs.microsoft.com/en-us/dotnet/api/system.io.compression.zipfile?view=netframework-4.8)

## 常用

### 1. 解压

```c#
public static bool Jieya()
{


    string startPath = @".\start";
    string zipPath = @".\result.zip";
    string extractPath = @".\extract";

    System.IO.Compression.ZipFile.CreateFromDirectory(startPath, zipPath);
    System.IO.Compression.ZipFile.ExtractToDirectory(zipPath, extractPath);


    return true;
}
```

### 2. 覆盖解压

- [[Solved] [C#] FileZip class | Extract even if file already exist. - CodeProject](https://www.codeproject.com/Questions/493544/5bC-23-5dplusFileZipplusclassplus-7cplusExtractplu)

```c#
ZipArchive zipArchive = ZipFile.OpenRead(@"\patch001.zip");
foreach (ZipArchiveEntry entry in zipArchive.Entries)
{
    entry.ExtractToFile(Application.StartupPath + entry.Name, true);
}
zipArchive.Dispose();
```
