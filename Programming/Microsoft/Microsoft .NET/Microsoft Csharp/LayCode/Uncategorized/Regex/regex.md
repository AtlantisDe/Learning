# C# 正则相关

- [.NET Regex Tester - Regex Storm](http://regexstorm.net/tester)
- [MatchCollection Class (System.Text.RegularExpressions)](https://docs.microsoft.com/en-us/dotnet/api/system.text.regularexpressions.matchcollection?view=net-5.0)
- [System.Text.RegularExpressions - .NET Regex.Match & Regex.Matches Online checker, tester and debugger for C# and VB.Net](http://www.systemtextregularexpressions.com/regex.match)

## 1. QuickStart

```c#

RegexOptions.IgnoreCase /*忽略大小写*/
if (Regex.IsMatch(myString, "/(你好)|(世界)|(多关键词查找)/")) {
     // 找到
} else ...

RegexOptions.IgnoreCase /*忽略大小写*/
if (Regex.IsMatch(myString, "/(你好)|(NBA)|(多关键词查找)/", System.Text.RegularExpressions.RegexOptions.IgnoreCase)) {
     // 找到
} else ...


// 匹配日期
var ymdmatchCollection = new System.Text.RegularExpressions.Regex(@"(\d+)-(\d+)-(\d+)").Matches(html);
var ymdItems = new List<string>();
foreach (Match match in ymdmatchCollection)
{
    var groups = match.Groups; var group = groups[0]; var v1 = group.Value; ymdItems.Add(v1);
}


var matchCollection1 = new System.Text.RegularExpressions.Regex(@"[[]栏目(\d+)名称[]]").Matches(html);
var matchCollection2 = new System.Text.RegularExpressions.Regex(@"类型:栏目(\d+)最新普通文章").Matches(html);


var hs1 = new HashSet<string>();
var hs2 = new HashSet<string>();
var hs3 = new HashSet<string>();
var hs4 = new HashSet<string>();


var matchCollection1 = new System.Text.RegularExpressions.Regex(@"[[]栏目(\d+)名称[]]").Matches(html);
var matchCollection2 = new System.Text.RegularExpressions.Regex(@"[[]栏目(\d+)链接[]]").Matches(html);
var matchCollection3 = new System.Text.RegularExpressions.Regex(@"类型:栏目(\d+)最新普通文章").Matches(html);
var matchCollection4 = new System.Text.RegularExpressions.Regex(@"类型:栏目(\d+)随机普通文章").Matches(html);




foreach (Match match in matchCollection1)
{
    GroupCollection groups = match.Groups;
    var group = groups[0];
    var v1 = group.Value;
    hs1.Add(v1);
}

// 匹配的字符串与其值
foreach (Match match in matchCollection)
{
    GroupCollection groups = match.Groups;
    var v1 = groups[0].Value;
    var v2 = groups[1].Value;
}

foreach (Match match in matchCollection)
{
    GroupCollection groups = match.Groups;

    var v1 = groups[0].Value;
    var v2 = groups[1].Value.ToInt32();
    if (hs.FindIndex(it => it.CategoryId == v2) == -1)
    {
        hs.Add(new RepairIsCategoryIdJianyi { Key = v1, CategoryId = v2 });
    }

}

// 转义
var matchCollection1 = new System.Text.RegularExpressions.Regex(@"\[--循环代码模块开始--\{循环次数:(\d+),类型:随机云标签\}--\] (?s)(?i)(.*?) \[--循环代码模块结束--\]", System.Text.RegularExpressions.RegexOptions.IgnorePatternWhitespace).Matches(Contents);


// 基本要领:
1. 如中括号,等属于特殊的字符需要用反注释起来.
// 基本案例如下:
// 要匹配
[栏目9名称]

// 正则表达式应该是这样的
[[]栏目(\d+)名称[]]


// 2. 案例二 这样没有特殊字符的就可以直接匹配
// 要匹配
[--循环代码模块开始--{循环次数:6,类型:栏目14最新普通文章(偏移量:1)}--]

// 正则表达式应该是这样的
类型:栏目(\d+)最新普通文章


using System;
using System.Text.RegularExpressions;

public class Test
{

    public static void Main ()
    {

        // Define a regular expression for repeated words.
        Regex rx = new Regex(@"\b(?<word>\w+)\s+(\k<word>)\b",
          RegexOptions.Compiled | RegexOptions.IgnoreCase);

        // Define a test string.
        string text = "The the quick brown fox  fox jumps over the lazy dog dog.";

        // Find matches.
        MatchCollection matches = rx.Matches(text);

        // Report the number of matches found.
        Console.WriteLine("{0} matches found in:\n   {1}",
                          matches.Count,
                          text);

        // Report on each match.
        foreach (Match match in matches)
        {
            GroupCollection groups = match.Groups;
            Console.WriteLine("'{0}' repeated at positions {1} and {2}",
                              groups["word"].Value,
                              groups[0].Index,
                              groups[1].Index);
        }
    }
}
// The example produces the following output to the console:
//       3 matches found in:
//          The the quick brown fox  fox jumps over the lazy dog dog.
//       'The' repeated at positions 0 and 4
//       'fox' repeated at positions 20 and 25
//       'dog' repeated at positions 50 and 54


```

## 2. 正则代码

```c#
private static string GetRegexStr_codes_str(string reString)
{
    System.Text.RegularExpressions.Regex reg;
    List<string> strList = new List<string>();
    string regexCode;
    regexCode = "\"codes_str\":\"(.*?)\",\"ii\":";


    reg = new System.Text.RegularExpressions.Regex(regexCode);
    System.Text.RegularExpressions.MatchCollection mc = reg.Matches(reString);
    for (int i = 0; i < mc.Count; i++)
    {
        GroupCollection gc = mc[i].Groups; //得到所有分组
        for (int j = 1; j < gc.Count; j++) //多分组 匹配的原始文本不要
        {
            string temp = gc[j].Value;
            if (!string.IsNullOrEmpty(temp))
            {
                strList.Add(temp); //获取结果   strList中为匹配的值
            }
        }
    }

    string aa = reString;

    for (int i = 0; i < strList.Count; i++)
    {
        aa = aa.Replace(strList[i], "");
    }

    return aa;
}
```

## 3. How to search strings

- [How to simplify an if condition having multiple OR cases](https://stackoverflow.com/questions/38339535/how-to-simplify-an-if-condition-having-multiple-or-cases)
- [.NET Regex Tester - Regex Storm](http://regexstorm.net/tester)
- [How to search strings (C# Guide)](https://docs.microsoft.com/en-us/dotnet/csharp/how-to/search-strings)
- [Regex.IsMatch vs string.Contains](https://stackoverflow.com/questions/2962670/regex-ismatch-vs-string-contains)

```c#
public static bool ContainsAny(this string self, params string[] criteria)
{
    foreach (string s in criteria)
    {
        if (self.Contains(s))
        {
            return true;
        }
    }
    return false;
}


if (Regex.IsMatch(myString, "/(LHG)|(UCK)|(SAN)|(AVB)|(AVM)|(SDS)|(DWW)|(WQP)/")) {
    mySecondString = "CATEGORY A";
} else ...

string factMessage = "Extension methods have all the capabilities of regular static methods.";

// Write the string and include the quotation marks.
Console.WriteLine($"\"{factMessage}\"");

// Simple comparisons are always case sensitive!
bool containsSearchResult = factMessage.Contains("extension");
Console.WriteLine($"Contains \"extension\"? {containsSearchResult}");

// For user input and strings that will be displayed to the end user,
// use the StringComparison parameter on methods that have it to specify how to match strings.
bool ignoreCaseSearchResult = factMessage.StartsWith("extension", System.StringComparison.CurrentCultureIgnoreCase);
Console.WriteLine($"Starts with \"extension\"? {ignoreCaseSearchResult} (ignoring case)");

bool endsWithSearchResult = factMessage.EndsWith(".", System.StringComparison.CurrentCultureIgnoreCase);
Console.WriteLine($"Ends with '.'? {endsWithSearchResult}");

// 前面的示例演示了使用这些方法的重点。默认情况下，搜索区分大小写。您使用StringComparison.CurrentCultureIgnoreCase枚举值指定不区分大小写的搜索



public static class WordCount
{
    /// <summary>
    /// Count words with instaniated Regex. 用实例化Regex计数单词。
    /// </summary>
    public static int CountWords4(string s)
    {
        Regex r = new Regex(@"[\S]+");
        MatchCollection collection = r.Matches(s);
        return collection.Count;
    }
    /// <summary>
    /// Count words with static compiled Regex. 使用静态编译正则表达式计算字数。
    /// </summary>
    public static int CountWords1(string s)
    {
        MatchCollection collection = Regex.Matches(s, @"[\S]+", RegexOptions.Compiled);
        return collection.Count;
    }
    /// <summary>
    /// Count words with static Regex.
    /// </summary>
    public static int CountWords3(string s)
    {
        MatchCollection collection = Regex.Matches(s, @"[\S]+");
        return collection.Count;
    }

    /// <summary>
    /// Count word with loop and character tests.
    /// </summary>
    public static int CountWords2(string s)
    {
        int c = 0;
        for (int i = 1; i < s.Length; i++)
        {
            if (char.IsWhiteSpace(s[i - 1]) == true)
            {
                if (char.IsLetterOrDigit(s[i]) == true ||
                    char.IsPunctuation(s[i]))
                {
                    c++;
                }
            }
        }
        if (s.Length > 2)
        {
            c++;
        }
        return c;
    }
}


```

### 0. 匹配 前后部分

```c#
// 常用两种模式
(.*?)
(.*)

// 涉及换行的时候注意 在源码中的编码差别
\r\n 与 \n


var itemMatchCollection = new System.Text.RegularExpressions.Regex("<a target='_blank' href=\"(.*?)\n\">").Matches(html);


// 示例
var itemMatchCollection = new System.Text.RegularExpressions.Regex("\"tel\":\"(.*?)\"").Matches(html);
var Items = new List<string>();
foreach (Match match in itemMatchCollection)
{
    var groups = match.Groups; var group = groups[1]; var v1 = group.Value; if (v1.IsNullOrEmpty() == false) { Items.Add(v1); }
}

// 如何复制被查找正则匹配的内容: 查找-->正则表达式-->输入表达式:[[].*?[]] 接着-->全部选择(A) 然后键盘Ctrl+C 复制 即可
[[].*?[]]

// 匹配括号内示例
(\([^\)]*\))

// 直接匹配中间部分字符
"tel":"(.*?)"

// 匹配中间部分,可以去掉问号?匹配就能匹配出来
<a target='_blank' href="(.*)">


```

### 1. 判断字符串是否只有数字和字母组成

```C#
// 正则表达式判断
/*

下面正则:满足数字或字母或者英文逗号
"^[0-9a-zA-Z.]+$"

下面正则:满足数字或字母
"^[0-9a-zA-Z]+$"

下面正则:满足必须包含数字和字母
"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]+$"


*/

if (System.Text.RegularExpressions.Regex.IsMatch("https://www.001.cn/shenghuo/75.html", @"shenghuo\/(\d+)\.html"))
{
    System.Diagnostics.Debug.WriteLine("是符合要求字符");
}
else
{
    System.Diagnostics.Debug.WriteLine("不是符合要求的字符");
}


if (System.Text.RegularExpressions.Regex.IsMatch("01123a.**aaS", "^[0-9a-zA-Z.]+$"))
{
    System.Diagnostics.Debug.WriteLine("是符合要求字符");
}
else System.Diagnostics.Debug.WriteLine("不是符合要求的字符");
```

### 2. 字符串中如何删除掉“特殊字符”

```C#
// 特殊字符包含下划线的话用这个
string 结果 = Regex.Replace(字符串, "[^0-9A-Za-z]", "");
// 不包含下划线用这个
Regex.Replace(字符串, "\W", "")
//经过测试似乎有bug 满足常规使用
 var a = Regex.Replace("asdfas@!#$^(&**&)*(_)❤❥웃유♋☮✌☏☢☠✔☑♚▲♪✈✞÷↑↓◆◇⊙■□△▽¿─│♥❣♂♀☿Ⓐ✍✉☣☤✘☒♛▼♫⌘☪≈←→◈◎☉★☆⊿※¡━┃♡ღツ☼☁❅♒✎©®™Σ✪✯☭➳卐√↖↗●◐Θ◤◥︻〖〗┄┆℃℉°✿ϟ☃☂✄¢€£∞✫★½✡×↙↘○◑⊕◣◢︼【】┅┇☽☾✚〓▂▃▄▅▆▇█▉▊▋▌▍▎▏↔↕☽☾の•▸◂(*_235234 你好我的世界 @#$%@#$^%#$^ -asd 你", @"\W", "");
```

### 3. 匹配

```c#
[[](\w+)[]]
```

### 4. 正则匹配时间模式 Regex for date pattern

- [YYYY-MM-DD HH:MM:SS - Regex Tester/Debugger](https://www.regextester.com/110436)
- [Regex for date pattern?](https://stackoverflow.com/questions/31817105/regex-for-date-pattern)
- [C# 正则表达式匹配 string 字符串中的时间串（yyyyMMdd） - 码农的崛起 - 博客园](https://www.cnblogs.com/zx724792526/p/11724009.html)
- [几个 C#日期、时间验证的正则表达式 dl020840504 的专栏-CSDN 博客](https://blog.csdn.net/dl020840504/article/details/17055531)
- [Getting Title at 6:14](https://gist.github.com/x-strong/5378739)

```c#
        /// <summary>
        /// 使用正则表达式判断是否为日期
        /// </summary>
        /// <param name="str" type=string></param>
        /// <returns name="isDateTime" type=bool></returns>
        public bool IsDateTime(string str)
        {
            bool isDateTime = false;
            // yyyy/MM/dd
            if (Regex.IsMatch(str, "^(?<year>\\d{2,4})/(?<month>\\d{1,2})/(?<day>\\d{1,2})$"))
                isDateTime = true;
            // yyyy-MM-dd
            else if (Regex.IsMatch(str, "^(?<year>\\d{2,4})-(?<month>\\d{1,2})-(?<day>\\d{1,2})$"))
                isDateTime = true;
            // yyyy.MM.dd
            else if (Regex.IsMatch(str, "^(?<year>\\d{2,4})[.](?<month>\\d{1,2})[.](?<day>\\d{1,2})$"))
                isDateTime = true;
            // yyyy年MM月dd日
            else if (Regex.IsMatch(str, "^((?<year>\\d{2,4})年)?(?<month>\\d{1,2})月((?<day>\\d{1,2})日)?$"))
                isDateTime = true;
            // yyyy年MM月dd日
            else if (Regex.IsMatch(str, "^((?<year>\\d{2,4})年)?(正|一|二|三|四|五|六|七|八|九|十|十一|十二)月((一|二|三|四|五|六|七|八|九|十){1,3}日)?$"))
                isDateTime = true;

            // yyyy年MM月dd日
            else if (Regex.IsMatch(str, "^(零|〇|一|二|三|四|五|六|七|八|九|十){2,4}年((正|一|二|三|四|五|六|七|八|九|十|十一|十二)月((一|二|三|四|五|六|七|八|九|十){1,3}(日)?)?)?$"))
                isDateTime = true;
            // yyyy年
            //else if (Regex.IsMatch(str, "^(?<year>\\d{2,4})年$"))
            //    isDateTime = true;

            // 农历1
            else if (Regex.IsMatch(str, "^(甲|乙|丙|丁|戊|己|庚|辛|壬|癸)(子|丑|寅|卯|辰|巳|午|未|申|酉|戌|亥)年((正|一|二|三|四|五|六|七|八|九|十|十一|十二)月((一|二|三|四|五|六|七|八|九|十){1,3}(日)?)?)?$"))
                isDateTime = true;
            // 农历2
            else if (Regex.IsMatch(str, "^((甲|乙|丙|丁|戊|己|庚|辛|壬|癸)(子|丑|寅|卯|辰|巳|午|未|申|酉|戌|亥)年)?(正|一|二|三|四|五|六|七|八|九|十|十一|十二)月初(一|二|三|四|五|六|七|八|九|十)$"))
                isDateTime = true;

            // XX时XX分XX秒
            else if (Regex.IsMatch(str, "^(?<hour>\\d{1,2})(时|点)(?<minute>\\d{1,2})分((?<second>\\d{1,2})秒)?$"))
                isDateTime = true;
            // XX时XX分XX秒
            else if (Regex.IsMatch(str, "^((零|一|二|三|四|五|六|七|八|九|十){1,3})(时|点)((零|一|二|三|四|五|六|七|八|九|十){1,3})分(((零|一|二|三|四|五|六|七|八|九|十){1,3})秒)?$"))
                isDateTime = true;
            // XX分XX秒
            else if (Regex.IsMatch(str, "^(?<minute>\\d{1,2})分(?<second>\\d{1,2})秒$"))
                isDateTime = true;
            // XX分XX秒
            else if (Regex.IsMatch(str, "^((零|一|二|三|四|五|六|七|八|九|十){1,3})分((零|一|二|三|四|五|六|七|八|九|十){1,3})秒$"))
                isDateTime = true;

            // XX时
            else if (Regex.IsMatch(str, "\\b(?<hour>\\d{1,2})(时|点钟)\\b"))
                isDateTime = true;
            else
                isDateTime = false;

            return isDateTime;
        }

```

### 5. 匹配 2020-11-10

```c#

(\d+)-(\d+)-(\d+)
var ymdItems = new System.Text.RegularExpressions.Regex(@"(\d+)-(\d+)-(\d+)").Matches(html);


// 匹配日期 全部匹配
var ymdmatchCollection = new System.Text.RegularExpressions.Regex(@"(\d+)-(\d+)-(\d+)").Matches(html);
var ymdItems = new List<string>();
foreach (Match match in ymdmatchCollection)
{
    var groups = match.Groups; var group = groups[0]; var v1 = group.Value; ymdItems.Add(v1);
}

// 匹配日期 按顺序匹配
var ymdmatchCollection = new System.Text.RegularExpressions.Regex(@"(\d+)-(\d+)-(\d+)").Matches(html);
var ymdItems = new List<string>();
for (int i = 0; i < ymdmatchCollection.Count; i++)
{
    Match match = ymdmatchCollection[i];
    var groups = match.Groups; var group = groups[0]; var v1 = group.Value; ymdItems.Add(v1);
}
```

### 5. 匹配 2021-02-09 11:02

```c#
(\d+)-(\d+)-(\d+) (\d+):(\d+)
var ymdmatchCollection = new System.Text.RegularExpressions.Regex(@"(\d+)-(\d+)-(\d+) (\d+):(\d+)").Matches(html);

```

### 7. 匹配 浮点数字

```c#

(\d+\.?\d+)万
(\-?\d+\.?\d+)万
(\-?\d+\.?\d+)亿
(\-?\d+\.?\d+)
(\-?\d+\.?\d+)%

```

### 8. 匹配 手机号码

```c#

Regex dReg = new Regex("[0-9]{11,11}");

// 直接匹配中间部分字符
"tel":"(.*?)"
```
