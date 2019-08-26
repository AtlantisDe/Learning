# GUID

-[C# System.Guid.NewGuid() 格式化 - Alan_YN - 博客园](https://www.cnblogs.com/AlanYN/p/6559418.html)

## 全球唯一标识符

```C#
// - 数据库长度字段定义长度32位常用
System.Guid.NewGuid().ToString("N");

// 32位字符串
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

System.Guid.NewGuid().ToString("D");

// 连字符分隔的32位字符串
// xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

System.Guid.NewGuid().ToString("B");

// 在大括号中、由连字符分隔的32位字符串
// {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}

System.Guid.NewGuid().ToString("P");

// 在圆括号中、由连字符分隔的32位字符串
// (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)
```
