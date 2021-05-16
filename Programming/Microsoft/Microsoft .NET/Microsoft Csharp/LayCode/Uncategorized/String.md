# C# string

- [[C#] String 与 string 的区别 - 笑笑小白 - 博客园](https://www.cnblogs.com/rosesmall/p/8351808.html)
- [C#中 bool 与 Boolean 有什么区别*C#*码农橙子 Yang-CSDN 博客](https://blog.csdn.net/yang8421/article/details/23588719)

## 0. 常用

```c#
var x = string.Join("|", items.Select(s => s.IP).ToArray());
var x = string.Join(",", items);

```

## 1. 占位符

- [.net core 中 String 常量前 @和\$符号的用法](https://www.jianshu.com/p/069537ec3003)
- [c#字符串占位符使用方法 C# Txwtech 笛科思-CSDN 博客](https://blog.csdn.net/txwtech/article/details/83039071)

```c#
// 4.5.1的语法糖。
// String 用法。
// @表示不进行转义。比如
String testStr= @" line1 \'
this is line2 \j
this is line3
"
// 除了双引号，所有字符都不会被转义
var name = "Chilly";
Console.WriteLine($"Hello,{name}. It's a pleasure to meet you!");
// $表示启用占位符{},这里 {name} 会被替换成Chilly.(和StringFormat() 用法相似)
```

## 2. 取文本中间

```c#
var curdir0 = "a1a".GetStringMidFromEnd1("a", "a");
var curdir1 = "/1/".GetStringMidFromEnd1("/", "/");
var curdir2 = @"123456".GetStringMidFromEnd1(@"2", @"56");
var curdir3 = @"iloveseo".GetStringMidFromEnd1(@"lo", @"seo");
```

```c#
        /// <summary>
        /// 取文本中间
        /// </summary>
        /// <param name="allStr">原字符</param>
        /// <param name="firstStr">前面的文本</param>
        /// <param name="lastStr">后面的文本</param>
        /// <returns>返回获取的值</returns>
        public static string GetStringMid(string str, string str1, string str2)
        {
            int leftlocation;//左边位置
            int rightlocation;//右边位置
            int strmidlength; ;//中间字符串长度
            string strmid;//中间字符串
            leftlocation = str.IndexOf(str1);
            //获取左边字符串头所在位置
            if (leftlocation == -1)//判断左边字符串是否存在于总字符串中
            {
                return "";
            }
            leftlocation = leftlocation + str1.Length;//获取左边字符串尾所在位置
            rightlocation = str.IndexOf(str2, leftlocation);
            //获取右边字符串头所在位置
            if (rightlocation == -1 || leftlocation > rightlocation)//判断右边字符串是否存在于总字符串中，左边字符串位置是否在右边字符串前
            {
                return "";
            }
            strmidlength = rightlocation - leftlocation;//计算中间字符串长度
            strmid = str.Substring(leftlocation, strmidlength);//取出中间字符串
            return strmid;//返回中间字符串
        }
```

## 3. WIKi

- [C#：替换字符串（文字），仅替换第 1 次出现的 - 鞠勇鸿的技术专栏 - CSDN 博客](https://blog.csdn.net/jyh_jack/article/details/86505579)
- [Replace first occurrence of pattern in a string](https://stackoverflow.com/questions/8809354/replace-first-occurrence-of-pattern-in-a-string)
- [C# 过滤特殊字符，保留中文，字母，数字，和- - 土豆爸爸 2016 - 博客园](https://www.cnblogs.com/wohexiaocai/p/9283309.html)

## 4. 替换字符串 仅替换第 1 次出现的

```c#
string s = "aaa";
Regex r = new Regex("a");
s=r.Replace(s,"b",1);
```

## 5. 字符串排序

- [Getting Title at 23:17](https://www.cnblogs.com/tpfOfBlog/p/6282709.html?utm_source=itdadao&utm_medium=referral)

```c#
string[] arr = {"g","b","q","w"};
arr = arr.OrderBy(p => p).ToArray();

```

## 6. String.Format 复合格式设置 转义大括号

- [复合格式设置](https://docs.microsoft.com/zh-cn/dotnet/standard/base-types/composite-formatting?redirectedfrom=MSDN)

```c#
// 为什么会出现$符号,c#6.0才出现的新特性
var s = string.Fromat("{0}+{1}={2}",12,23,12+23)
var s = $"{12}+{23}={12+23}"

// 转义大括号
前两个左大括号 ("{{") 被转义，生成一个左大括号。
之后的三个字符 ("{0:") 被解释为格式项的开始。

var a = $"123";
var s = $"{{{a}}}";
Console.WriteLine(s);
// 输出
{123}

```

## 7. 文本去重

- [C# 使用 String.Join 和 Distinct 方法 去除字符串中重复字符 - Jokeny 的个人空间 - OSCHINA](https://my.oschina.net/jokeny/blog/1590518)

```c#
string str="165,52,aa,165,68,aa,56,52";
string newStr= String.Join(",",test.Split(',').Distinct());

string newStr0 = String.Join(",", "c20ad4d76fe97759aa27a0c99bff6710".ToArray().Distinct());
string newStr1 = String.Join(",", "002ad4d76fe97759aa27a0c99bff6710".ToArray().Distinct());
string newStr3 = String.Join(",", "001ad4d76fe97759aa27a0c99bff6710".ToArray().Distinct());

var path1 = @"D:\Date\So.txt";
var path2 = @"D:\Date\So_已去重.txt";
String str = System.IO.File.ReadAllText(path1, System.Text.Encoding.UTF8);
String newStr = String.Join("\r\n", str.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries).Distinct());
System.IO.File.WriteAllText(path2, newStr, System.Text.Encoding.UTF8);

```

## 8. String.Join on a List of Objects

- [String.Join on a List of Objects](https://stackoverflow.com/questions/10540584/string-join-on-a-list-of-objects)

```c#
var x = string.Join("|", myList.Select(x => x.ToString()).ToArray());

var x = string.Join("|", items.Select(s => s.IP).ToArray());
```

## 9. EndsWith / StartsWith

```c#

```

## 10. StringComparison

- [两个字符串对比提升比较性能用 StringComparison.OrdinalIgnoreCase - ApiRap - 博客园](https://www.cnblogs.com/Warmsunshine/p/11525879.html)
- [C#字符串查找速度优化--StringComparison.Ordinal\_新手小白的博客-CSDN 博客](https://blog.csdn.net/w199753/article/details/83421165)
- [StringComparison 枚举 - 周宏伟 - 博客园](https://www.cnblogs.com/zhw511006/archive/2010/07/09/1774591.html)
- [equals 和==在字符串比较中的效率问题\_zhangjiesoft 的专栏-CSDN 博客](https://blog.csdn.net/zhangjiesoft/article/details/6597603)<>
- [String 类型 equals 方法和 int == 方法效率比较 - 哎哟，不错哦 - 博客园](https://www.cnblogs.com/wangjinyu/p/9835770.html)

```c#
var str1 = "A11b1";
var str2 = "a11B1";
var boolRst = str1.Equals(str2, StringComparison.OrdinalIgnoreCase);
```
