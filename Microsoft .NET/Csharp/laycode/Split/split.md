# C# Split

- [C#中 Split 用法](https://www.cnblogs.com/wangfuyou/p/6101992.html)

## 1. 常用代码示例

### 1. 常用

```c#
var arrlines = body.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var arr = body.Split("|".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var arr = line.Split(",".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var arr = line.Split("    ".ToArray(), StringSplitOptions.RemoveEmptyEntries);
```

### 2. 字符串 new 用法

```c#
rq.Qs = new[] { "您好,我来自外太空!" };
rq.Qs = new[] { body };
```

### 3. 常用两次分割代码

```c#
var body = File.ReadAllText(path, Encoding.UTF8);
var arrlines = body.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries);
for (int i = 0; i < arrlines.Length; i++)
{
    var item = arrlines[i];
    var arr = item.Split("|".ToArray(), StringSplitOptions.RemoveEmptyEntries);
    if (arr.Length >= 3)
    {
    }
}

var tmp = "";
for (int i = 0; i < list.Count; i++)
{
    tmp = tmp + list[i] + (i < list.Count - 1 ? "\r\n" : "");
}
```

### 4. 用字符串分隔

```c#
using System.Text.RegularExpressions;
string str="aaajsbbbjsccc";
string[] sArray=Regex.Split(str,"js",RegexOptions.IgnoreCase);
foreach (string i in sArray) Response.Write(i.ToString() + "<br>");
```

### 5. 用多个字符来分隔

```c#
string str="aaajbbbscccjdddseee";
string[] sArray=str.Split(new char[2] {'j','s'});
foreach(string i in sArray) Response.Write(i.ToString() + "<br>");
```

### 6. 用单个字符来分隔

```c#
string str="aaajbbbjccc";
string[] sArray=str.Split('j');
foreach(string i in sArray) Response.Write(i.ToString() + "<br>");
```

### 7. 逐字分割

```c#
var te = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~！＂＃＄％＆＇（）＊＋，－．／：；＜＝＞？＠［＼］＾＿｀｛｜｝～";
var arr = te.ToArray();
foreach (var item in arr)
{
    Console.WriteLine(item);
}

var arr = str.ToArray();
for (int i = 0; i < arr.Length; i++)
{
    var item = arr[i];
}
```

### 99. 其它汇总示例

```c#
// String.Split 方法有6个重载函数：
// 程序代码
public string[] Split(params char[] separator)
public string[] Split(char[] separator, int count)
public string[] Split(char[] separator, StringSplitOptions options)
public string[] Split(string[] separator, StringSplitOptions options)
public string[] Split(char[] separator, int count, StringSplitOptions options)
public string[] Split(string[] separator, int count, StringSplitOptions options)
// 下边我们通过一些实例来说明下怎么使用(以下string words = "1,2.3,,4";)：
// 1. public string[] Split(params char[] separator)
// 程序代码
string[] split = words.Split(new Char[] { ',' });//返回:{"1","2.3","","4"}
string[] split = words.Split(new Char[] { ',', '.' });//返回:{"1","2","3","","4"}
// 2. public string[] Split(char[] separator, int count)
// 程序代码
string[] split = words.Split(new Char[] { ',', '.' }, 2);//返回:{"1","2.3,,4"}
string[] split = words.Split(new Char[] { ',', '.' }, 6);//返回:{"1","2","3","","4"}
// 3. public string[] Split(char[] separator, StringSplitOptions options)
// 程序代码
string[] split = words.Split(new Char[] { ',', '.' }, StringSplitOptions.RemoveEmptyEntries);//返回:{"1","2","3","4"} 不保留空元素
string[] split = words.Split(new Char[] { ',', '.' }, StringSplitOptions.None);//返回:{"1","2","3","","4"} 保留空元素
// 4. public string[] Split(string[] separator, StringSplitOptions options)
// 程序代码
string[] split = words.Split(new string[] { ",", "." }, StringSplitOptions.RemoveEmptyEntries);//返回:{"1","2","3","4"} 不保留空元素
string[] split = words.Split(new string[] { ",", "." }, StringSplitOptions.None);//返回:{"1","2","3","","4"} 保留空元素
// 5. public string[] Split(char[] separator, int count, StringSplitOptions options)
// 程序代码
string[] split = words.Split(new Char[] { ',', '.' }, 2, StringSplitOptions.RemoveEmptyEntries);//返回:{"1","2.3,,4"} 不保留空元素
string[] split = words.Split(new Char[] { ',', '.' }, 6, StringSplitOptions.None);//返回:{"1","2","3","","4"} 保留空元素
// 6. public string[] Split(string[] separator, int count, StringSplitOptions options)
// 程序代码
string[] split = words.Split(new string[] { ",", "." }, 2, StringSplitOptions.RemoveEmptyEntries);//返回:{"1","2.3,,4"} 不保留空元素
string[] split = words.Split(new string[] { ",", "." }, 6, StringSplitOptions.None);//返回:{"1","2","3","","4"} 保留空元素
// 需要注意的是没有重载函数public string[] Split(string[] separator)，所以我们不能像VB.NET那样使用words.Split(",")，而只能使用words.Split(','）
```
