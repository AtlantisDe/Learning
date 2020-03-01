# byte

- [C# byte[]转 string， string 转 byte[] 的四种方法 - 清语堂 - 博客园](https://www.cnblogs.com/wfy680/p/12004512.html)
- [C# string 类型和 byte[]类型相互转换 - 风雪江山 - 博客园](https://www.cnblogs.com/nimorl/p/9835102.html)

## 常用代码

```c#
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
// 16进制格式string 转byte[]：
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

newString = newString.Substring(0, newString.Length-1);}
int byteLength = newString.Length / 2;byte[] bytes = newbyte[byteLength];string hex;int j = 0;for (int i=0; i<bytes.Length; i++){
 hex = new String(new Char[] {newString[j], newString[j+1]});
 bytes[i] = HexToByte(hex);                j = j+2;
 }
return bytes;
 }


string  str    = System.Text.Encoding.UTF8.GetString(bytes);
byte[] decBytes = System.Text.Encoding.UTF8.GetBytes(str);

string    str    = BitConverter.ToString(bytes);
String[] tempArr = str.Split('-');
byte[]   decBytes = new byte[tempArr.Length];
for (int i = 0; i < tempArr.Length; i++)
{
    decBytes[i] = Convert.ToByte(tempArr[i], 16);
}

byte[] data = System.Text.Encoding.Default.GetBytes("Hello World!");
System.Text.Encoding.UTF8.GetBytes(obj)


// 申请内存缓冲区字节与长度

byte[] buffer = new byte[size];

var str = "Hello World!";
byte[] data = System.Text.Encoding.Default.GetBytes("Hello World!");
Console.WriteLine(data.Length);
Console.WriteLine(str.Length);
12
12

```

## Stream 和 byte[] 之间的转换

- [C# Stream 和 byte[] 之间的转换 - 大四月 - 博客园](https://www.cnblogs.com/gyl5201314/p/10400435.html)

```c#
/// <summary>
/// 将 Stream 转成 byte[]
/// </summary>
public byte[] StreamToBytes(Stream stream)
{
    byte[] bytes = new byte[stream.Length];
    stream.Read(bytes, 0, bytes.Length);

    // 设置当前流的位置为流的开始
    stream.Seek(0, SeekOrigin.Begin);
    return bytes;
}

/// <summary>
/// 将 byte[] 转成 Stream
/// </summary>
public Stream BytesToStream(byte[] bytes)
{
    Stream stream = new MemoryStream(bytes);
    return stream;
}

/// <summary>
/// 将 Stream 写入文件
/// </summary>
public void StreamToFile(Stream stream,string fileName)
{
    // 把 Stream 转换成 byte[]
    byte[] bytes = new byte[stream.Length];
    stream.Read(bytes, 0, bytes.Length);
    // 设置当前流的位置为流的开始
    stream.Seek(0, SeekOrigin.Begin);

    // 把 byte[] 写入文件
    FileStream fs = new FileStream(fileName, FileMode.Create);
    BinaryWriter bw = new BinaryWriter(fs);
    bw.Write(bytes);
    bw.Close();
    fs.Close();
}

/// <summary>
/// 从文件读取 Stream
/// </summary>
public Stream FileToStream(string fileName)
{
    // 打开文件
    FileStream fileStream = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.Read);
    // 读取文件的 byte[]
    byte[] bytes = new byte[fileStream.Length];
    fileStream.Read(bytes, 0, bytes.Length);
    fileStream.Close();
    // 把 byte[] 转换成 Stream
    Stream stream = new MemoryStream(bytes);
    return stream;
}

```
