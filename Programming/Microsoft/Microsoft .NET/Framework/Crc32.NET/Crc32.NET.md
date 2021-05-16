# Crc32.NET

- [force-net/Crc32.NET](https://github.com/force-net/Crc32.NET)
- [Crc32.NET 1.2.0](https://www.nuget.org/packages/Crc32.NET/)
- [C#实现的 CRC32 算法](https://blog.csdn.net/lassewang/article/details/52766476)
- [C#实现 crc32 函数](https://blog.csdn.net/ciaos/article/details/12490911)
- [C# 中利用 CRC32 值判断文件是否重复 - 音乐让我说 - 博客园](https://www.cnblogs.com/Music/p/crc32-demo-in-dotnet.html)
- [CRC32 算法 C#中的实现 - 学习札记 - 博客园](https://www.cnblogs.com/Kconnie/p/3538194.html)
- [CRC32算法C#中的实现 - 学习札记 - 博客园](https://www.cnblogs.com/Kconnie/p/3538194.html)

## 常用

```c#
// This library 1170 MB/s
// Some notes
// I thought about making a pull request to Crc32 library, but it seems, this library was abandoned. Anyway, I implement my library to be fully compatible with Crc32 library. And you can switch from Crc32 library to this.
// Api interface was taken from Crc32C.NET library. It is very handy for using in applications.

var inputArray = new byte[realDataLength + 4];
// write real data to inputArray
Crc32Algorithm.ComputeAndWriteToEnd(inputArray); // last 4 bytes contains CRC
// transferring data or writing reading, and checking as final operation
if (!Crc32Algorithm.IsValidWithCrcAtEnd(inputArray))
throw new InvalidOperationException("Data was tampered");



var v1 = "9e55830d9f43400c9a4a3e4cde396b50".ToBytes();
var v2 = System.Text.Encoding.UTF8.GetBytes("9e55830d9f43400c9a4a3e4cde396b50");
var h2 = String.Format("{0:X8}", v2.ToCrc32()); /*A6344DA7*/
```

## 相关项目

- [CRC-32C (Castagnoli) for C++ and .NET](https://crc32c.machinezoo.com/)
- [Crc32C.NET 1.0.5](https://www.nuget.org/packages/Crc32C.NET/1.0.5.0)
- [tanglebones/ch-crc32](https://github.com/tanglebones/ch-crc32)
- [dariogriffo/Crc32](https://github.com/dariogriffo/Crc32)
- [klinkby/klinkby.checksum](https://github.com/klinkby/klinkby.checksum)

```c#
// Library Speed
// CH.Crc32 by Cliff Hammerschmidt 117 MB/s
// Crc32 by Dario Griffo 401 MB/s
// Klinkby.Checksum by Mads Breusch Klinkby 400 MB/s
// Data.HashFunction.CRC by Brandon Dahler 206 MB/s
// Dexiom.QuickCrc32 by Jonathan Paré 364 MB/s
// K4os.Hash.Crc by Milosz Krajewski 399 MB/s
// This library 1170 MB/s
```
