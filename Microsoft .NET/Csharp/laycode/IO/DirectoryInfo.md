# DirectoryInfo

## 常用代码

### 1.0 枚举指定文件夹里文件

```c#
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
