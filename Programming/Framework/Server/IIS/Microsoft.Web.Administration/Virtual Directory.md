# Virtual Directory

- [Virtual Directory &lt;virtualDirectory&gt;](https://docs.microsoft.com/en-us/iis/configuration/system.applicationhost/sites/site/application/virtualdirectory)
- [IIS: How to create virtualdirectory in website with Microsoft.Web.Administration](https://stackoverflow.com/questions/10371725/iis-how-to-create-virtualdirectory-in-website-with-microsoft-web-administration)
- [Using ServerManager to list virtual directories separated by type](https://stackoverflow.com/questions/41002985/using-servermanager-to-list-virtual-directories-separated-by-type)
- [C# 管理 IIS7(转) - Dsw - 博客园](https://www.cnblogs.com/netserver/archive/2009/01/04/1368423.html)

## 代码 1

```C#
using (var serverManager = new ServerManager())
{

}
```

```C#
var serverManager = new ServerManager();
serverManager.Sites["WebsiteName"].Applications["ApplicationName"].VirtualDirectories.Add("VirtualDirectoryName, "VirtualDirectoryPath");
```

## 代码 2

```C#
var serverManager = new ServerManager();
site = serverManager.Sites.Add(websiteName, physicalPath, port);
var dirs = site.Applications[0].VirtualDirectories;
```
