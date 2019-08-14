# Directory

- [Directory Class (System.IO)](https://docs.microsoft.com/en-us/dotnet/api/system.io.directory?view=netframework-4.8)
- [C#创建文件夹 - 秋風落葉 - 博客园](https://www.cnblogs.com/qiantao/p/9389596.html)

## 用法

### 重命名

```c#
Directory.Move(@"d:\textddd", @"d:\textAAA");
```

### 创建

```c#
if (false == System.IO.Directory.Exists(subPath))
{
//创建pic文件夹
System.IO.Directory.CreateDirectory(subPath);
}
```

## 文件夹路径

### 当前文件夹路径

```c#
 string currPath = Application.StartupPath;
```
