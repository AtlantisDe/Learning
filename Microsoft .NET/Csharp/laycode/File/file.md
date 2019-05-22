# C#文件相关

- [C# byte[]数组和 string 的互相转化 (四种方法)](https://www.cnblogs.com/hbtmwangjin/articles/9141275.html)

## C#文件保存读取

```c#
SaveFileDialog saveFileDialog = new SaveFileDialog();
saveFileDialog.RestoreDirectory = true;
// saveFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
saveFileDialog.Title = "保存";
saveFileDialog.Filter = "AAA|*.aaa";
saveFileDialog.ShowDialog();

//获得用户要保存的文件的路径
string path = saveFileDialog.FileName;
if (path == "")
{
    return false;
}
using (System.IO.FileStream fsWrite = new System.IO.FileStream(path, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write))
{
    byte[] buffer = Encoding.Default.GetBytes("Hi");
    fsWrite.Write(buffer, 0, buffer.Length);
    fsWrite.Close();
}
MessageBox.Show("保存成功");

```

## C#打开文件

```C#
OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Excel文件(*.xls;*.xlsx)|*.xls;*.xlsx|所有文件|*.*";
            ofd.ValidateNames = true;
            ofd.CheckPathExists = true;
            ofd.CheckFileExists = true;
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                string strFileName = ofd.FileName;
                //其他代码
            }


using (FileStream fsRead = new FileStream(path, FileMode.OpenOrCreate, FileAccess.Read))
{
byte[] buffer = new byte[1024 * 1024 * 5];
int r = fsRead.Read(buffer, 0, buffer.Length);
textBox1.Text = Encoding.Default.GetString(buffer, 0, r);
fsRead.Close();
}

```

## C#文件目录选择

```c#
FolderBrowserDialog path = new FolderBrowserDialog();
path.ShowNewFolderButton = false;
path.ShowDialog();

if (path.SelectedPath == "") { return false; }
string[] files = System.IO.Directory.GetFiles(path.SelectedPath, "*.aa");
foreach (string file in files)
{
    Console.WriteLine(file);
}
```

## C#一行一行读文件

```c#
StreamReader sr = new StreamReader(@"D:\1.aa", System.Text.Encoding.UTF8);
String line;
while ((line = sr.ReadLine()) != null)
{
    Console.WriteLine(line.ToString());
}
```

## C#文件的写入

```c#
 FileStream fs = new FileStream("E:\\ak.txt", FileMode.Create);
//获得字节数组
byte[] data = System.Text.Encoding.Default.GetBytes("Hello World!");
//开始写入
fs.Write(data, 0, data.Length);
//清空缓冲区、关闭流
fs.Flush();
fs.Close();
```

## C#文本读取

```c#
File.ReadAllText(ofd.FileName);
File.ReadAllText(ofd.FileName,Encoding.UTF8);
```

## C#文本写入

```c#
System.IO.File.WriteAllText("e:\\asp_1.txt", "I LOVE YOU!");
System.IO.File.WriteAllText("d:/Work/Doc/tmp/2.txt", "I LOVE YOU!");
System.IO.File.WriteAllText("d:/Work/Doc/tmp/2.txt", "I LOVE YOU!", Encoding.UTF8);




//Link
try { System.IO.File.WriteAllText(root.urllinkspath, "", Encoding.UTF8); } catch (Exception) { }
try { System.IO.File.WriteAllText(root.fileslinkspath, "", Encoding.UTF8); } catch (Exception) { }

using (var aleDB = new Aleseocore.Module.Aledb.Class.aleDB(root.urllinkspath)) { aleDB.firstTimeinit(); }
using (var aleDB = new Aleseocore.Module.Aledb.Class.aleDB(root.fileslinkspath)) { aleDB.firstTimeinit(); }


```

## 文本按行写入

```c#
Console.WriteLine(root.pagepath);
                System.IO.File.WriteAllText(root.pagepath, root.articlebody, Encoding.UTF8);

                using (System.IO.StreamWriter file = new System.IO.StreamWriter(root.siteconfig.fileslinkspath, true))
                {
                    file.WriteLine(root.pagepath); file.Close();
                }

                using (System.IO.StreamWriter file = new System.IO.StreamWriter(root.siteconfig.urllinkspath, true))
                {
                    file.WriteLine(root.pageurl); file.Close();
                }
```

## C#文本按行写入

- [How to: Write to a Text File - C# Programming Guide](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/file-system/how-to-write-to-a-text-file)
- [How to: Write text to a file](https://docs.microsoft.com/en-us/dotnet/standard/io/how-to-write-text-to-a-file)

```c#
using (System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\Users\Public\TestFolder\WriteLines2.txt", true))
{
    file.WriteLine("Fourth line");
}
```

## C#文件/目录是否存在/操作

```c#
if (Directory.Exists(path))//判断目录是否存在
{}
if(File.Exists(filepath))//如果是文件的话
{}
File.Delete(pa);
```

## C#文件资源

```c#
System.Reflection.Assembly Asmb = System.Reflection.Assembly.GetExecutingAssembly();
var Names = Asmb.GetManifestResourceNames();
string strName = Names[7];
foreach (var item in Names) { Console.WriteLine(item); }
byte[] Resread(string f)
{
    System.IO.Stream ManifestStream = Asmb.GetManifestResourceStream(f);
    byte[] StreamData = new byte[ManifestStream.Length];
    ManifestStream.Read(StreamData, 0, (int)ManifestStream.Length);
    return StreamData;
}

Task.Static.WebRes = new Dictionary<string, byte[]>();
System.Text.Encoding ec = System.Text.Encoding.UTF8;
Task.Static.WebRes.Add("/home/home.html", Resread(Asmb.GetName().Name + ".Resources.home.home.html"));
Task.Static.WebRes.Add("/home/home.html", Resread("aa.Resources.home.home.html"));
Task.Static.WebRes.Add("/home/js/main_v1.0.0.js", Resread("aa.Resources.home.js.main_v1.0.0.js"));
Task.Static.WebRes.Add("/static/clipboard/clipboard.js", Resread("aa.Resources.static.clipboard.clipboard.js"));
Task.Static.WebRes.Add("/static/layui/layui.all.js", Resread("aa.Resources.static.layui.layui.all.js"));

```
