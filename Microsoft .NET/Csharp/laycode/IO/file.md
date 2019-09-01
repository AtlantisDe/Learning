# C#文件相关

- [C# byte[]数组和 string 的互相转化 (四种方法)](https://www.cnblogs.com/hbtmwangjin/articles/9141275.html)
- [C#：文件、byte[]、Stream 相互转换 - Cch。 - 博客园](https://www.cnblogs.com/Cchblogs/p/6946709.html)

## 1. 对话框操作

### 0. 编码读取

```c#
var encoding = CsharpLazycode.Module.FileEncoding.Util.EncodingType.GetType("E:\\ak.txt");
```

### 0. 扩展名

```c#
if (txtfinfo.Extension != ".txt")
{
return false;
}
```

### 1. 文件保存读取

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

### 2. 打开文件

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

### 3. 文件目录选择

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

FolderBrowserDialog path = new FolderBrowserDialog();
path.Description = "测试描述";
path.ShowNewFolderButton = true;
path.RootFolder = System.Environment.SpecialFolder.Desktop;
```

### 4. 窗体弹出选择目录或文件 的对话框

```c#
//弹出一个选择目录的对话框

privatevoid btnSelectPath_Click(object sender, EventArgs e) //弹出一个选择目录的对话框
 {
    FolderBrowserDialog path = new FolderBrowserDialog();
    path.ShowDialog();
    this.txtPath.Text = path.SelectedPath;
 }

//弹出一个选择文件的对话框

privatevoid btnSelectFile_Click(object sender, EventArgs e) //弹出一个选择文件的对话框
 {
    OpenFileDialog file = new OpenFileDialog();
    file.ShowDialog();
    this.txtFile.Text = file.SafeFileName;
 }
```

## 2. 读写文件操作

### 1. 一行一行读文件

```c#
StreamReader sr = new StreamReader(@"D:\1.aa", System.Text.Encoding.UTF8);
String line;
while ((line = sr.ReadLine()) != null)
{
    Console.WriteLine(line.ToString());
}
sr.Close();

using (var sr = new StreamReader(@"D:\1.aa", System.Text.Encoding.UTF8))
{
    String line;
    while ((line = sr.ReadLine()) != null)
    {
        Console.WriteLine(line.ToString());
    }
    sr.Close();
    sr.Dispose();
}
```

### 2. 一行一行读文件

```c#
 //一行一行读文件
var rcount = 0;

StreamReader sr = new StreamReader(@"D:\1.aa", System.Text.Encoding.UTF8);
String line;
while ((line = sr.ReadLine()) != null)
{
    Console.WriteLine(line.ToString());
    rcount++;
    if (rcount > 5)
    {
        break;
    }
}
sr.Close();

```

### 3. 文件写入字节集

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

### 4. 文本按行写入

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

### 5. 文本按行写入

- [How to: Write to a Text File - C# Programming Guide](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/file-system/how-to-write-to-a-text-file)
- [How to: Write text to a file](https://docs.microsoft.com/en-us/dotnet/standard/io/how-to-write-text-to-a-file)

```c#
using (System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\Users\Public\TestFolder\WriteLines2.txt", true))
{
    file.WriteLine("Fourth line");
}


System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\Users\Public\TestFolder\WriteLines2.txt", true);
file.WriteLine("Fourth line");
file.Close();
file.Dispose();
```

### 6. 文本写入[常用]

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

### 7. 文本读取

```c#
File.ReadAllText(ofd.FileName);
File.ReadAllText(ofd.FileName,Encoding.UTF8);
System.IO.File.ReadAllText("", System.Text.Encoding.UTF8);
 ViewBag.main = System.IO.File.ReadAllText(System.AppDomain.CurrentDomain.BaseDirectory + @"/Views/1.html", System.Text.Encoding.UTF8);
```

## 3. StreamReader / OpenText

- [Adding progress bar monitoring for StreamReader?](https://stackoverflow.com/questions/37344558/adding-progress-bar-monitoring-for-streamreader)

```c#
var reader = System.IO.File.OpenText(@"D:\wwwrootRes\demo.txt");
var line_new = reader.ReadLine();
while (line_new != null)
{
    line_new = reader.ReadLine();
}

reader.Close();
```

### 0. 操作与进度条

```c#
private void button_Load_Int_Click(object sender, EventArgs e)
    {
        Application.DoEvents();
        progressBar.Value = 0;
        using (StreamReader sr = new StreamReader(pathInt))
        {
            Stream baseStream = sr.BaseStream;
            long length = baseStream.Length;
            string line;
            while ((line = sr.ReadLine()) != null)
            {
                string strCode = line.Substring(4, 4);

                if (listBoxCodes.FindStringExact(strCode) == -1)
                    listBoxCodes.Items.Add(strCode);
                else
                    listBoxDuplicates.Items.Add(strCode)
                progressBar.Value = Convert.ToInt32((double)baseStream.Position / length * 100);
                Application.DoEvents();
            }
        }
    }
```

### 1. StreamReader 读操作

```c#
using (StreamReader sr = new StreamReader(@"D:\1.aa", encoding))
{
    Stream baseStream = sr.BaseStream;
    long length = baseStream.Length;

    string line;
    while ((line = sr.ReadLine()) != null)
    {
        progressValue = Convert.ToInt32((double)baseStream.Position / length * 100);

    }
}
```

### 2. List 泛型读取和保存文本文件

- [C# 使用 List 泛型读取和保存文本文件 - 曾祥展 - 博客园](https://www.cnblogs.com/zengxiangzhan/archive/2010/01/30/1659674.html)

```c#
List<string> list = mgr.ReadTextFileToList(@"C:\test.txt");//记取字符串
foreach (string s in list) Console.WriteLine(s); //显示出来′
Console.ReadKey(); //按′任一键关闭Console
```

### 66. 以独占的方式读写文件

- [c#通过 FileStream 读取、写入文件 - chenyangsocool - 博客园](https://www.cnblogs.com/chenyangsocool/p/7597601.html)

#### 2. System.IO.FileMode

- [C# System.IO.FileMode - 帅胡 - 博客园](https://www.cnblogs.com/hushaojun/p/10598970.html)

```c#
// Append 若存在文件，则打开该文件并查找到文件尾，或者创建一个新文件。 这需要 Append 权限
// Create 指定操作系统应创建新文件。 如果文件已存在，它将被覆盖。 这需要 Write 权限。 FileMode.Create 等效于这样的请求：如果文件不存在，则使用 CreateNew；否则使用 Truncate。 如果该文件已存在但为隐藏文件，则将引发 UnauthorizedAccessException异常。
// CreateNew 指定操作系统应创建新文件。 这需要 Write 权限。 如果文件已存在，则将引发 IOException异常。
// Open 指定操作系统应打开现有文件。 打开文件的能力取决于 FileAccess 枚举所指定的值。 如果文件不存在，引发一个 FileNotFoundException 异常。
// OpenOrCreate 指定操作系统应打开文件（如果文件存在）；否则，应创建新文件。 如果用 FileAccess.Read 打开文件，则需要 Read权限。 如果文件访问为 FileAccess.Write，则需要 Write权限。 如果用 FileAccess.ReadWrite 打开文件，则同时需要 Read 和 Write权限。
// Truncate 指定操作系统应打开现有文件。 该文件被打开时，将被截断为零字节大小。 这需要 Write 权限。 尝试从使用 FileMode.Truncate 打开的文件中进行读取将导致 ArgumentException 异常。

// 以下FileStream构造函数将打开一个现有文件 (FileMode.Open)。
FileStream s2 = new FileStream(name, FileMode.Open, FileAccess.Read, FileShare.Read);

```

```c#
FileStream objFileStream = new FileStream(fileName, FileMode.Append, FileAccess.Write,FileShare.None);
// FileShare.None 标识是独占
```

#### 3. FileStream 读写完美示例

```c#
var onlyrw_path = @"D:\Tmp\getarticleItem_guid.txt";
using (FileStream fsRead = new FileStream(onlyrw_path, FileMode.Open, FileAccess.ReadWrite, FileShare.None))
{
    byte[] data_demo = new byte[100];

    //文件指针指向0位置
    fsRead.Seek(0, SeekOrigin.Begin);
    //读入两百个字节
    fsRead.Read(data_demo, 0, (int)fsRead.Length);
    //提取字节数组

    //读取其它示例
    byte[] buffer = new byte[100];
    fsRead.Read(buffer, 0, buffer.Length);
    var Text = Encoding.UTF8.GetString(buffer, 0, buffer.Length);

    //文件指针指向0位置
    fsRead.Seek(0, SeekOrigin.Begin);

    //写入点数据
    byte[] data = System.Text.Encoding.UTF8.GetBytes("123456");
    //默认尾部追加
    //fsRead.Write(data, 0, data.Length);

    fsRead.Write(data, (int)fsRead.Seek(0, SeekOrigin.Begin), data.Length);

    fsRead.Close();
}
```

#### 4. FileStream 写

```c#
using (System.IO.FileStream fsWrite = new System.IO.FileStream(path, System.IO.FileMode.OpenOrCreate, System.IO.FileAccess.Write))
{
    byte[] buffer = Encoding.Default.GetBytes("Hi");
    fsWrite.Write(buffer, 0, buffer.Length);
    fsWrite.Close();
}

```

#### 5. FileStream 读

```c#
using (FileStream fsRead = new FileStream(path, FileMode.OpenOrCreate, FileAccess.Read))
{
byte[] buffer = new byte[1024 * 1024 * 5];
int r = fsRead.Read(buffer, 0, buffer.Length);
textBox1.Text = Encoding.Default.GetString(buffer, 0, r);
fsRead.Close();
}
```

#### 6. StreamWriter 写

```c#
System.IO.StreamWriter file = new System.IO.StreamWriter(path_new, true, Encoding.UTF8);
for (int i = 0; i < Countlist.Count; i++)
{
    var geoItem = Countlist[i];
    var newline = string.Format("{0},{1},{2},{3},{4}", geoItem.v1, geoItem.v2, geoItem.v3, geoItem.v4, geoItem.count);
    file.WriteLine(newline);
}

file.Close();
file.Dispose();
```

#### 1. byte[]数组和 string 的互相转化

- [C# byte[]数组和 string 的互相转化 (四种方法) - 无网不进 - 博客园](https://www.cnblogs.com/hbtmwangjin/articles/9141275.html)
- [C# byte[]与 string 互转 - s_Silencer 的博客 - CSDN 博客](https://blog.csdn.net/s_Silencer/article/details/83536308)

```c#
string str = System.Text.Encoding.Default.GetString ( byteArray );

string  str    = System.Text.Encoding.UTF8.GetString(bytes);
byte[] decBytes = System.Text.Encoding.UTF8.GetBytes(str);

string    str    = BitConverter.ToString(bytes);
String[] tempArr = str.Split('-');
byte[]   decBytes = new byte[tempArr.Length];
for (int i = 0; i < tempArr.Length; i++)
{
    decBytes[i] = Convert.ToByte(tempArr[i], 16);
}

// string类型转成byte[]：

byte[] byteArray = System.Text.Encoding.Default.GetBytes ( str );



// byte[]转成string：

string str = System.Text.Encoding.Default.GetString ( byteArray );



// string类型转成ASCII byte[]：

（"01" 转成 byte[] = new byte[]{ 0x30,0x31}）

byte[] byteArray = System.Text.Encoding.ASCII.GetBytes ( str );



// ASCIIbyte[]转成string：

（byte[] = new byte[]{ 0x30, 0x31} 转成"01"）

string str = System.Text.Encoding.ASCII.GetString ( byteArray );



// byte[]转16进制格式string：

new byte[]{ 0x30, 0x31}转成"3031":

publicstaticstring ToHexString ( byte[] bytes ) // 0xae00cf => "AE00CF "

{string hexString = string.Empty;

if ( bytes != null )

{

StringBuilder strB = new StringBuilder ();

for ( int i = 0; i < bytes.Length; i++ )

{

strB.Append ( bytes[i].ToString ( "X2" ) );

}

hexString = strB.ToString ();

}return hexString;

}



16进制格式string 转byte[]：

publicstaticbyte[] GetBytes(string hexString, outint discarded)

{

discarded = 0;

string newString = "";

char c;// remove all none A-F, 0-9, charactersfor (int i=0; i<hexString.Length; i++)

{

  c = hexString[i];if (IsHexDigit(c))

newString += c;

else

discarded++;

}// if odd number of characters, discard last characterif (newString.Length % 2 != 0){                discarded++;

newString = newString.Substring(0, newString.Length-1);            }

int byteLength = newString.Length / 2;byte[] bytes = newbyte[byteLength];string hex;int j = 0;for (int i=0; i<bytes.Length; i++){

 hex = new String(new Char[] {newString[j], newString[j+1]});

 bytes[i] = HexToByte(hex);                j = j+2;

 }

return bytes;

 }
```

## 5. 文件/目录是否存在判断

```c#
if (Directory.Exists(path))//判断目录是否存在
{}
if(File.Exists(filepath))//如果是文件的话
{
File.Delete(pa);
}

if (System.IO.File.Exists(OutPath))
{
System.IO.File.Delete(OutPath);
}

```

## 6. 文件资源

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

## 4. 多线程读写同一文件处理

- [C#多线程读写同一文件处理 - 天马 3798 - 博客园](https://www.cnblogs.com/tianma3798/p/8252553.html)
- [6 秒完成 50 万条多线程并发日志文件写入](http://www.ibcibc.com/thread-8060-1-1.html)

### 1. 文本多线程

```c#
  //go_Parallel_file_lockObj_Demo_001();
                bool go_Parallel_file_lockObj_Demo_001()
                {

                    //文本多线程
                    object lockObj_txt = new object();
                    var threadtxtpath = @"D:\Tmp\ThreadTextt.txt";

                    Thread Th_txt_1 = new Thread(delegate ()
                    {
                        Parallel.For(0, 0, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
                        {
                            lock (lockObj_txt)
                            {
                                using (System.IO.StreamWriter file = new System.IO.StreamWriter(threadtxtpath, true, Encoding.UTF8))
                                {
                                    var line_1 = string.Format("{0} {1}", "工作线程1: ", i);
                                    file.WriteLine(line_1);
                                    file.Close();
                                }
                            }


                        });
                    });
                    Th_txt_1.IsBackground = true;
                    Th_txt_1.Start();

                    Thread Th_txt_2 = new Thread(delegate ()
                    {
                        Parallel.For(0, 0, new ParallelOptions() { MaxDegreeOfParallelism = 1000 }, (i, loopState) =>
                        {
                            lock (lockObj_txt)
                            {
                                using (System.IO.StreamWriter file = new System.IO.StreamWriter(threadtxtpath, true, Encoding.UTF8))
                                {
                                    var line_1 = string.Format("{0} {1}", "工作线程2: ", i);
                                    file.WriteLine(line_1);
                                    file.Close();
                                }
                            }

                        });
                    });
                    Th_txt_2.IsBackground = true;
                    Th_txt_2.Start();



                    Thread Th_txt_3 = new Thread(delegate ()
                    {
                        CsharpLazycode.Module.Laycode.sys.WaitDelay(3 * 1000, true);
                        StreamReader sr_textdmo = new StreamReader(Aleseocore.Module.Aleseo.Host.Main.Method.Collectiontmp_articlepathok_path, System.Text.Encoding.UTF8);
                        String line_textdmo;
                        while ((line_textdmo = sr_textdmo.ReadLine()) != null)
                        {

                        }
                        sr_textdmo.Close();

                    });
                    Th_txt_3.IsBackground = true;
                    Th_txt_3.Start();

                    return true;
                }

```
