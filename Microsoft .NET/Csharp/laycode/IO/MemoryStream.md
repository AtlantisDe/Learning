# MemoryStream

- [C# 温故而知新：Stream 篇（五） - 逆时针の风 - 博客园](https://www.cnblogs.com/JimmyZheng/archive/2012/04/14/2446507.html)
- [C#使用 MemoryStream 类读写内存 - 烟雨沐沐 - 博客园](https://www.cnblogs.com/niyl/p/10136912.html)
- [YouTube](https://www.youtube.com/watch?v=eMVDR7anePY)

## 用法

### 代码 1

```c#
byte[] byteArray;
char[] charArray;
UnicodeEncoding uniEncoding = new UnicodeEncoding();
// Create the data to write to the stream.
byte[] firstString = uniEncoding.GetBytes("一二三四五");
byte[] secondString = uniEncoding.GetBytes("上山打老虎");
```
