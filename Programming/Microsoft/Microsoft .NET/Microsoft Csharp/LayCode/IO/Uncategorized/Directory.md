# Directory

- [Directory Class (System.IO)](https://docs.microsoft.com/en-us/dotnet/api/system.io.directory?view=netframework-4.8)
- [C#创建文件夹 - 秋風落葉 - 博客园](https://www.cnblogs.com/qiantao/p/9389596.html)
- [Windows 一个文件夹下面最多可以放多少文件\_weixin_34138056 的博客-CSDN 博客](https://blog.csdn.net/weixin_34138056/article/details/85720515?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-5.channel_param&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-5.channel_param)

```c#
System.IO.DirectoryInfo
System.IO.Directory
System.IO.File
```

## 1. 用法

### 1. 重命名

```c#
Directory.Move(@"d:\textddd", @"d:\textAAA");

```

### 2. 枚举

```c#
// 对象信息
DirectoryInfo TheFolder = new DirectoryInfo(ResTemplatepath);

var SitesPath = $@"D:\Sites";
//遍历 文件夹
var directoryInfos = new System.IO.DirectoryInfo(SitesPath).GetDirectories();
foreach (var item in directoryInfos)
{
}

//遍历 文件夹
var directoryInfo = new System.IO.DirectoryInfo(Templates);
var getDirectories = directoryInfo.GetDirectories();
for (int i = 0; i < getDirectories.Count(); i++)
{
    var item = getDirectories[i];
    var b = item.FullName + "/config.json";
    var c = item.FullName + "/beizhu.txt";
    var d = item.FullName + "/version.json";
}

//遍历 文件夹

var TheFolder = new System.IO.DirectoryInfo(ResTemplatepath);
var aaa = TheFolder.GetDirectories();
for (int i = 0; i < aaa.Count(); i++)
{
var a = aaa[i];
var b = a.FullName + "/config.json";
var c = a.FullName + "/beizhu.txt";
var d = a.FullName + "/version.json";
}

//遍历 文件
var TheFolder = new System.IO.DirectoryInfo(item.FullName);
var fileItems = TheFolder.GetFiles();
foreach (var file in fileItems)
{

}

```

### 3. 创建

```c#
if (false == System.IO.Directory.Exists(subPath))
{
    //创建pic文件夹
    System.IO.Directory.CreateDirectory(subPath);
}
```

### 4. 删除文件夹

```c#
Directory.Delete(site.Nodes.Hostitem.Path);
```

## 2. 文件夹路径

### 1. 当前文件夹路径

```c#
 string currPath = Application.StartupPath;
```

### 2. AUX 命名的文件 文件夹

- [Windows 系统无法创建以 aux 命名的文件 - 林深处见鹿 - 博客园](https://www.cnblogs.com/hellovan/p/10508926.html)
- [Cannot create a directory named &quot;Aux&quot; or starting by &quot;Aux.&quot; on Windows 8.1](https://stackoverflow.com/questions/36225708/cannot-create-a-directory-named-aux-or-starting-by-aux-on-windows-8-1)

```c#
// Do not use the following reserved names for the name of a file:

// CON, PRN, AUX, NUL, COM1, COM2, COM3, COM4, COM5, COM6, COM7, COM8, COM9, LPT1, LPT2, LPT3, LPT4, LPT5, LPT6, LPT7, LPT8, and LPT9. Also avoid these names followed immediately by an extension; for example, NUL.txt is not recommended. For more information, see Namespaces.
```
