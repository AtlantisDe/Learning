# byte

## 常用代码

```c#
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
