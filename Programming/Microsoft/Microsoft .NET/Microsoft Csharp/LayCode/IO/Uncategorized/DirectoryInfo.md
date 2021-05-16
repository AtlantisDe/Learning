# DirectoryInfo

## 常用代码

```c#
var count = new System.IO.DirectoryInfo($@"C:\Windows\System32").GetFiles().Count();

```

### 1.0 枚举指定文件夹里文件

- [Method to get all files within folder and subfolders that will return a list](https://stackoverflow.com/questions/14305581/method-to-get-all-files-within-folder-and-subfolders-that-will-return-a-list)

```c#
// 包含子文件夹文件
var items6 = Directory.GetFiles(curDir, "*.*", SearchOption.AllDirectories).ToList();


public static List<String> GetAllFiles(String directory)
{
    return Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories).ToList();
}

private List<String> DirSearch(string sDir)
{
    List<String> files = new List<String>();
    try
    {
        foreach (string f in Directory.GetFiles(sDir))
        {
            files.Add(f);
        }
        foreach (string d in Directory.GetDirectories(sDir))
        {
            files.AddRange(DirSearch(d));
        }
    }
    catch (System.Exception excpt)
    {
        MessageBox.Show(excpt.Message);
    }

    return files;
}


//排序取文件
var textfiles = TheFolder.GetFiles().ToArray();
var textfiles = TheFolder.GetFiles().OrderBy(p => p.CreationTime).ToArray();

//文件夹文件队列测试
var curDir = @"D:\Work\Keyword";
var TheFolder = new System.IO.DirectoryInfo(curDir);
var textfiles = TheFolder.GetFiles().OrderBy(p => p.CreationTime).ToArray();
for (int i = 0; i < textfiles.Length; i++)
{
    var txtfinfo = textfiles[i];
    Console.WriteLine(string.Format("文件信息:文件名{0} 日期:{1}", txtfinfo.Name, txtfinfo.CreationTime));
}


```
