# Directory

- [Directory Class (System.IO)](https://docs.microsoft.com/en-us/dotnet/api/system.io.directory?view=netframework-4.8)
- [C#创建文件夹 - 秋風落葉 - 博客园](https://www.cnblogs.com/qiantao/p/9389596.html)

## 用法

### 重命名

```c#
Directory.Move(@"d:\textddd", @"d:\textAAA");
```

### 枚举

```c#
DirectoryInfo TheFolder = new DirectoryInfo(ResTemplatepath);

var directoryInfo = new System.IO.DirectoryInfo(Templates);
var getDirectories = directoryInfo.GetDirectories();
for (int i = 0; i < getDirectories.Count(); i++)
{
    var item = getDirectories[i];
    var b = item.FullName + "/config.json";
    var c = item.FullName + "/beizhu.txt";
    var d = item.FullName + "/version.json";
}

var TheFolder = new System.IO.DirectoryInfo(ResTemplatepath);
var aaa = TheFolder.GetDirectories();
for (int i = 0; i < aaa.Count(); i++)
{
var a = aaa[i];
var b = a.FullName + "/config.json";
var c = a.FullName + "/beizhu.txt";
var d = a.FullName + "/version.json";
}
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
