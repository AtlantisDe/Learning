# C# Split

- [C#中 Split 用法](https://www.cnblogs.com/wangfuyou/p/6101992.html)
- [C#中 Split 分隔字符串的应用（C#、split、分隔、字符串）](https://www.cnblogs.com/canfengfeixue/p/8269263.html)
- [js 去空格 回车 制表符 换页符\_summerlin_sx 的博客-CSDN 博客](https://blog.csdn.net/summerlin_sx/article/details/84808880)
- [js 去空格的两种方法 - 风不动 - 博客园](https://www.cnblogs.com/achao6/p/13328625.html)

## 1. 常用代码示例

### 1. 常用

```c#
// \r是回车符,\n是换行符
// \t 制表符


//去空格和回车

function trim(vStr) { return vStr.replace(/(^\s+)|(\s+$)/g, ""); }

说明下这个正则的意思：

\s 匹配任何空白字符，包括空格、制表符、换页符等等。等价于 [ \f\n\r\t\v]。

\f 匹配一个换页符

\n 匹配一个换行符。

\r 匹配一个回车符。

\t 匹配一个制表符。

\v 匹配一个垂直制表符。

+表示匹配前一个字符一次或多次。

^表示匹配输入的开头，

$表示匹配输入的末尾。

g全称是global，全局匹配。

 

或者

str.replace(/[\r\n]/g,"");

js去空格的两种方法
去掉前后空格

str.trim(); 

去掉所有空格（前后以及中间） 这个OK

str.replace(/\s/g,"");


text = text.Replace(@"\r\n", "\r\n");


var items = body.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var arrLines = body.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries);

var arr = body.Split("|".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var arr = line.Split(",".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var arr = line.Split("    ".ToArray(), StringSplitOptions.RemoveEmptyEntries);
var arrlines = tmp.Split(new string[] { "[--分割线--]" }, StringSplitOptions.RemoveEmptyEntries);

var arrlines = webPageContent.ContentsInnerText.Split("。".ToArray(), StringSplitOptions.None);

```

### 2. 字符串 new 用法

```c#
rq.Qs = new[] { "您好,我来自外太空!" };
rq.Qs = new[] { body };
```

### 3. 常用两次分割代码

```c#

var str = File.ReadAllText(path, Encoding.UTF8);
var arrLines = str.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries);
for (int i = 0; i < arrLines.Length; i++)
{
    var item = arrLines[i];
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
