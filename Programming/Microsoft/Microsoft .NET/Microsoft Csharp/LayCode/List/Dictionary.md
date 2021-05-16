# Dictionary

- [Dictionary<TKey,TValue> Class (System.Collections.Generic)](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.dictionary-2?view=netframework-4.8)
- [C#Dictionary 键值对取值用法](https://www.bbsmax.com/A/QV5Zeg3VJy/)
- [C#Dictionary 键值对取值用法](https://www.bbsmax.com/A/QV5Zeg3VJy/)
- [C#中的 Dictionary 字典类介绍 - M_Q - 博客园](https://www.cnblogs.com/Maxq/p/5872386.html)
- [自定义 Dictionary 支持线程安全 - 跟着阿笨一起玩.NET - 博客园](https://www.cnblogs.com/51net/p/3963815.html)

## 1. 常用

```c#
System.Collections.Concurrent
Install-Package System.Collections.Concurrent -Version 4.3.0
```

## 2. 线程介绍

- 自定义 Dictionary 支持线程安全

```c#
// 线程安全集合类
ConcurrentQueue<T>
ConcurrentStack<T>
ConcurrentBag<T>
ConcurrentDictionary<TKey,TValue>

// 非线程安全集合类
Queue<T>
Stack<T>
List<T>
Dictionary<TKey,TValue>



var Words = resItem.Keywords;
var WordDic = new Dictionary<string, string>();
foreach (var item in Words)
{
    try
    {
        WordDic.Add($"[--{item.Md5()}--]", item);
    }
    catch (Exception)
    {
    }
}

Dictionary<string, string> openWith = new Dictionary<string, string>();

openWith.Add("txt", "notepad.exe");
openWith.Add("bmp", "paint.exe");
openWith.Add("dib", "paint.exe");
openWith.Add("rtf", "wordpad.exe");

// The Add method throws an exception if the new key is
// already in the dictionary.
try
{
    openWith.Add("txt", "winword.exe");
}
catch (ArgumentException)
{
    Console.WriteLine("An element with Key = \"txt\" already exists.");
}

openWith["doc"] = "winword.exe";

// The indexer throws an exception if the requested key is
// not in the dictionary.
try
{
    Console.WriteLine("For key = \"tif\", value = {0}.",
        openWith["tif"]);
}
catch (KeyNotFoundException)
{
    Console.WriteLine("Key = \"tif\" is not found.");
}

// When a program often has to try keys that turn out not to
// be in the dictionary, TryGetValue can be a more efficient
// way to retrieve values.
string value = "";
if (openWith.TryGetValue("tif", out value))
{
    Console.WriteLine("For key = \"tif\", value = {0}.", value);
}
else
{
    Console.WriteLine("Key = \"tif\" is not found.");
}

// ContainsKey can be used to test keys before inserting
// them.
if (!openWith.ContainsKey("ht"))
{
    openWith.Add("ht", "hypertrm.exe");
    Console.WriteLine("Value added for key = \"ht\": {0}",
        openWith["ht"]);
}

// When you use foreach to enumerate dictionary elements,
// the elements are retrieved as KeyValuePair objects.
Console.WriteLine();
foreach( KeyValuePair<string, string> kvp in openWith )
{
    Console.WriteLine("Key = {0}, Value = {1}",
        kvp.Key, kvp.Value);
}

// To get the values alone, use the Values property.
Dictionary<string, string>.ValueCollection valueColl =
    openWith.Values;

// The elements of the ValueCollection are strongly typed
// with the type that was specified for dictionary values.
Console.WriteLine();
foreach( string s in valueColl )
{
    Console.WriteLine("Value = {0}", s);
}

// To get the keys alone, use the Keys property.
Dictionary<string, string>.KeyCollection keyColl =
    openWith.Keys;

// The elements of the KeyCollection are strongly typed
// with the type that was specified for dictionary keys.
Console.WriteLine();
foreach( string s in keyColl )
{
    Console.WriteLine("Key = {0}", s);
}

// Use the Remove method to remove a key/value pair.
Console.WriteLine("\nRemove(\"doc\")");
openWith.Remove("doc");

if (!openWith.ContainsKey("doc"))
{
    Console.WriteLine("Key \"doc\" is not found.");
}
```
