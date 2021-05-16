# FileInfo

- [FileSystem.GetFileInfo(String) Method (Microsoft.VisualBasic.FileIO)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualbasic.fileio.filesystem.getfileinfo?view=netframework-4.8)
- [C# -- 使用 FileInfo 获取文件信息 - 在代码的世界里游走 - 博客园](https://www.cnblogs.com/ChengWenHao/p/CSharpFileInfo.html)
- [C#获取文件夹/文件的大小以及占用空间 - dota 编程 - 博客园](https://www.cnblogs.com/chenpeng-dota/articles/2176470.html)

## 常用

```c#
FileInfo fif = new FileInfo(strFilePath);
System.IO.FileInfo fif = new  System.IO.FileInfo(@"D:\4a44b9d28d.html");
Console.WriteLine(string.Format("文件信息:文件名{0} 日期:{1}", fif.Name, fif.CreationTime));
Console.WriteLine(string.Format("文件信息:文件名{0} 文件最后一次修改时间:{1}", fif.Name, fif.LastWriteTime));


static void Main(string[] args)
        {
            GetFileInfo(@"D:\Test.xlsx");
            Console.ReadKey();
        }
        private static void GetFileInfo(string strFilePath)
        {
            StringBuilder sb = new StringBuilder();
            if (File.Exists(strFilePath))
            {
                FileInfo fif = new FileInfo(strFilePath);
                sb.AppendLine(string.Format("文件创建时间：{0}", fif.CreationTime.ToString()));
                sb.AppendLine(string.Format("文件最后一次读取时间：{0}", fif.LastAccessTime.ToString()));
                sb.AppendLine(string.Format("文件最后一次修改时间：{0}", fif.LastWriteTime.ToString()));
                sb.AppendLine(string.Format("文件创建时间(UTC)：{0}", fif.CreationTimeUtc.ToString()));
                sb.AppendLine(string.Format("文件最后一次读取时间(UTC)：{0}", fif.LastAccessTimeUtc.ToString()));
                sb.AppendLine(string.Format("文件最后一次修改时间(UTC)：{0}", fif.LastWriteTimeUtc.ToString()));
                sb.AppendLine(string.Format("文件目录：{0}", fif.Directory));
                sb.AppendLine(string.Format("文件目录名称：{0}", fif.DirectoryName));
                sb.AppendLine(string.Format("文件扩展名：{0}", fif.Extension));
                sb.AppendLine(string.Format("文件完整名称：{0}", fif.FullName));
                sb.AppendLine(string.Format("文件名：{0}", fif.Name));
                sb.AppendLine(string.Format("文件字节长度：{0}", fif.Length));
                Console.WriteLine(sb.ToString());
            }
        }
```
