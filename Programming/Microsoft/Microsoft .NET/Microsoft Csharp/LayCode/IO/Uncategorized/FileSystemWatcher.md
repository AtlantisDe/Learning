# FileSystemWatcher

- [FileSystemWatcher Class (System.IO)](https://docs.microsoft.com/en-us/dotnet/api/system.io.filesystemwatcher?view=netframework-4.8)
- [C# FileSystemWatcher 监听文件事件 - 踏叶乘风 - 博客园](https://www.cnblogs.com/champaign/p/6202376.html)
- [Monitor multiple hard drive using FileSystemWatcher](https://social.msdn.microsoft.com/Forums/en-US/72b7997f-811a-4de7-9602-90cf38597423/monitor-multiple-hard-drive-using-filesystemwatcher-c?forum=csharplanguage)
- [How to set filter for FileSystemWatcher for multiple file types?](https://stackoverflow.com/questions/6965184/how-to-set-filter-for-filesystemwatcher-for-multiple-file-types)

## 1. 常用

```c#
string[] drives = Environment.GetLogicalDrives();

// Since .Net Core 3.x and .Net 5 Preview you can simply add multiple filters to the Filters collection
var watcher = new FileSystemWatcher();
watcher.Path = "/your/path";
watcher.Filters.Add("*.yml");
watcher.Filters.Add("*.yaml");
watcher.NotifyFilter = NotifyFilters.LastWrite | NotifyFilters.FileName;
watcher.EnableRaisingEvents = true;

var watcher = new FileSystemWatcher
    {
        Path = "/your/path",
        Filters = {"*.yml", "*.yaml"},
        NotifyFilter = NotifyFilters.LastWrite | NotifyFilters.FileName,
        EnableRaisingEvents = true,
    };

// 低版本
FileSystemWatcher objWatcher = new FileSystemWatcher();
objWatcher.Filter = "*.*";
objWatcher.Changed += new FileSystemEventHandler(OnChanged);

private static void OnChanged(object source, FileSystemEventArgs e)
{
    // get the file's extension
    string strFileExt = getFileExt(e.FullPath);

    // filter file types
    if (Regex.IsMatch(strFileExt, @"\.txt)|\.doc", RegexOptions.IgnoreCase))
    {
        Console.WriteLine("watched file type changed.");
    }
}


void File_Changed(object sender, FileSystemEventArgs e)
{
    FileInfo f = new FileInfo(e.FullPath);

    if (f.Extension.Equals(".jpg") || f.Extension.Equals(".png"))
    {
       //Logic to do whatever it is you're trying to do goes here
    }
}
```

## 2. Dokan.NET

- [dokan-dev/dokan-dotnet](https://github.com/dokan-dev/dokan-dotnet)

```c#

```
