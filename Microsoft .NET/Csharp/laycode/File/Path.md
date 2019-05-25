# Path

- [C#的 path.GetFullPath 获取上级目录实现方法 - maanshancss - 博客园](https://www.cnblogs.com/maanshancss/p/4074529.html)
- [C#中的 Path 类的方法详解 - 孤行者程序之路的博客 - CSDN 博客](https://blog.csdn.net/qq_38507850/article/details/78866034)
- [C# Path 总结 - WYVE - 博客园](https://www.cnblogs.com/wyvern0618/p/9454627.html)
- [C# Path 用法解析 - u011976734 的博客 - CSDN 博客](https://blog.csdn.net/u011976734/article/details/79654399)
- [C#的 path.GetFullPath 获取上级目录实现方法](https://www.jb51.net/article/56773.htm)

## 常用代码

```c#
var root = Path.GetPathRoot(runpath);
var pathroot = new DirectoryInfo(runpath);
var Parent = pathroot.Parent.FullName;
```

## C#遍历指定文件夹中的所有文件和子文件夹

- [C#遍历指定文件夹中的所有文件和子文件夹 - 华山青竹 - 博客园](http://www.cnblogs.com/huashanqingzhu/p/6046861.html)

```C#
DirectoryInfo TheFolder=new DirectoryInfo(folderFullName);

//遍历文件夹
foreach(DirectoryInfo NextFolder in TheFolder.GetDirectories())
   this.listBox1.Items.Add(NextFolder.Name);
//遍历文件
foreach(FileInfo NextFile in TheFolder.GetFiles())
   this.listBox2.Items.Add(NextFile.Name);

---------------------------------------------------------------------------------------------------------------

如何获取指定目录包含的文件和子目录
    1. DirectoryInfo.GetFiles()：获取目录中（不包含子目录）的文件，返回类型为FileInfo[]，支持通配符查找；
    2. DirectoryInfo.GetDirectories()：获取目录（不包含子目录）的子目录，返回类型为DirectoryInfo[]，支持通配符查找；
    3. DirectoryInfo. GetFileSystemInfos()：获取指定目录下（不包含子目录）的文件和子目录，返回类型为FileSystemInfo[]，支持通配符查找；
如何获取指定文件的基本信息；
    FileInfo.Exists：获取指定文件是否存在；
    FileInfo.Name，FileInfo.Extensioin：获取文件的名称和扩展名；
    FileInfo.FullName：获取文件的全限定名称（完整路径）；
    FileInfo.Directory：获取文件所在目录，返回类型为DirectoryInfo；
    FileInfo.DirectoryName：获取文件所在目录的路径（完整路径）；
    FileInfo.Length：获取文件的大小（字节数）；
    FileInfo.IsReadOnly：获取文件是否只读；
    FileInfo.Attributes：获取或设置指定文件的属性，返回类型为FileAttributes枚举，可以是多个值的组合
    FileInfo.CreationTime、FileInfo.LastAccessTime、FileInfo.LastWriteTime：分别用于获取文件的创建时间、访问时间、修改时间；
```

## C#获取当前目录、上级目录

```C#
// 当前目录
stringpath= Environment.CurrentDirectory;
// 上级目录
string path = new DirectoryInfo("../").FullName;
// 上上级目录
string path = new DirectoryInfo("../../").FullName;

```

## 代码一

```c#
public static void TestPath()
        {


            string file = "App.config"; //c:\users\qqq\source\repos\StudyDesignMode\StudyDesignMode\bin\Debug\App.config


            /* 正常用法 */

            //取完整路径
            string fullpath = Path.GetFullPath(file);  //c:\users\qqq\source\repos\StudyDesignMode\StudyDesignMode\bin\Debug\App.config

            //取文件名
            string name = Path.GetFileName(@"D:\1\2\App.config"); //App.config

            //取扩展名
            string extension = Path.GetExtension(@"D:\1\2\App.config"); //.config

            //取文件名 不带扩展名
            string nameWithoutExtension = Path.GetFileNameWithoutExtension(@"D:\1\2\App.config"); //App

            //取所在文件夹
            string dir = Path.GetDirectoryName(@"D:\1\2\App.config"); //D:\1\2

            //取所在磁盘
            string root = Path.GetPathRoot(@"D:\1\2\App.config"); //D:\

            //连接路径
            string combine = Path.Combine(@"1", @"2"); // 1\2

            /* 异常用法 */

            //参数为null
            //string fullpath1 = Path.GetFullPath(null); //Exception

            //参数为空字符串
            //string fullpath2 = Path.GetFullPath("");  //Exception
            string fullpath3 = Path.GetFullPath(@"D:\\//\\//dfjk\\\\1///2\/\/\/\/\/3\");  //D:\dfjk\1\2\3\     忽略了多个 /  \ 为1个 \ 。保留了末尾的 \ 。

            //无扩展名
            string name1 = Path.GetFileName(@"D:\1\2\App"); //App

            //只有扩展名
            string name2 = Path.GetFileName(@"D:\1\2\.config"); //.config

            //无文件名
            string name3 = Path.GetFileName(@"D:\1\2\"); // ""

            //只有盘符
            string name4 = Path.GetFileName(@"D:"); //  ""

            //参数为null
            string name5 = Path.GetFileName(null); // null

            //参数为""
            string name6 = Path.GetFileName(""); // ""


            //无扩展名
            string extension1 = Path.GetExtension(@"D:\1\2\App"); //""
                                                                  //只有扩展名
            string extension2 = Path.GetExtension(@"D:\1\2\.config"); //.config
                                                                      //无文件名
            string extension3 = Path.GetExtension(@"D:\1\2\"); // ""
                                                               //只有盘符
            string extension4 = Path.GetExtension(@"D:"); //  ""

            //参数为null
            string extension5 = Path.GetExtension(null); //  null
                                                         //参数为""
            string extension6 = Path.GetExtension(""); // ""


            //参数为null
            //string combine1 = Path.Combine(null,null); // Exception
            //string combine2 = Path.Combine("", null); // Exception

            //参数为""
            string combine3 = Path.Combine("", ""); // ""

            //多个/ \
            string combine4 = Path.Combine(@"///1\\\2\3", @"4"); //     ///1\\\2\3\4

            //第二个参数以/开头
            string combine5 = Path.Combine(@"///1\\\2\3", @"/4"); //    /4
            //第二个参数以\开头
            string combine6 = Path.Combine(@"///1\\\2\3", @"\4"); //   \4

            //第一个参数以\结尾
            string combine7 = Path.Combine(@"///1\\\2\3\\", @"4"); //   ///1\\\2\3\\4
            //第一个参数以/结尾
            string combine8 = Path.Combine(@"///1\\\2\3/", @"4"); //   ///1\\\2\3/4

            //第二个参数以/开头
            string combine9 = Path.Combine(@"///1\\\2\3\", @"/4"); //   /4
            //第二个参数以\开头
            string combine10 = Path.Combine(@"///1\\\2\3\", @"\4"); //   \4

            //取所在文件夹
            string dir1 = Path.GetDirectoryName(@"D:\1\2\"); //D:\1\2

            string dir2 = Path.GetDirectoryName(Path.Combine(@"D:\1","Temp"));  //  D:\1
            string dir3 = Path.GetDirectoryName(Path.Combine(@"D:\1\", "Temp")); //  D:\1

        }
```

```txt
string dir4 = Path.GetDirectoryName(@"\\192.168.0.2\share\file_1.txt"); // \\192.168.0.2\share
string root1 = Path.GetPathRoot(@"\\192.168.0.2\share\file_1.txt");  //  \\192.168.0.2\share
string root2 = Path.GetPathRoot(@"192.168.0.2\share\file_1.txt");  //  ""
string root3 = Path.GetPathRoot(@"//192.168.0.2\share\file_1.txt"); //  \\192.168.0.2\share
string root4 = Path.GetPathRoot(@"//192.168.0.2\share\1\2file_1.txt"); //  \\192.168.0.2\share
```

## 只获取盘符

```c#
string volume = System.Windows.Forms.Application.StartupPath.Substring(0, System.Windows.Forms.Application.StartupPath.IndexOf(':'));
//  获取结果:D
```

## 程序运行变量相关

### 获取当前程序运行路径的方法集合

```c#
//获取当前进程的完整路径，包含文件名(进程名)。
string str = this.GetType().Assembly.Location;
result: X:\xxx\xxx\xxx.exe (.exe文件所在的目录+.exe文件名)

//获取新的 Process 组件并将其与当前活动的进程关联的主模块的完整路径，包含文件名(进程名)。
string str = System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName;
result: X:\xxx\xxx\xxx.exe (.exe文件所在的目录+.exe文件名)

//获取和设置当前目录（即该进程从中启动的目录）的完全限定路径。
string str = System.Environment.CurrentDirectory;
result: X:\xxx\xxx (.exe文件所在的目录)

//获取当前 Thread 的当前应用程序域的基目录，它由程序集冲突解决程序用来探测程序集。
string str = System.AppDomain.CurrentDomain.BaseDirectory;
result: X:\xxx\xxx\ (.exe文件所在的目录+"\")

//获取和设置包含该应用程序的目录的名称。(推荐)
string str = System.AppDomain.CurrentDomain.SetupInformation.ApplicationBase;
result: X:\xxx\xxx\ (.exe文件所在的目录+"\")

//获取启动了应用程序的可执行文件的路径，不包括可执行文件的名称。
string str = System.Windows.Forms.Application.StartupPath;
result: X:\xxx\xxx (.exe文件所在的目录)

//获取启动了应用程序的可执行文件的路径，包括可执行文件的名称。
string str = System.Windows.Forms.Application.ExecutablePath;
result: X:\xxx\xxx\xxx.exe (.exe文件所在的目录+.exe文件名)

//获取应用程序的当前工作目录(不可靠)。
string str = System.IO.Directory.GetCurrentDirectory();
result: X:\xxx\xxx (.exe文件所在的目录)
```

### System.AppDomain

```c#
// 文件夹路径
System.AppDomain.CurrentDomain.BaseDirectory
// 文件名
System.AppDomain.CurrentDomain.FriendlyName
```

### 设置和获取环境变量

- [C#设置和获取系统环境变量 - fsh001 - 博客园](https://www.cnblogs.com/fsh001/p/8654790.html)

```c#

```
