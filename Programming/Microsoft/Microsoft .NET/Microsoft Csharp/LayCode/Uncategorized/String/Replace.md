# Replace

- [Replace Multiple Strings Effectively](https://chodounsky.net/2013/11/27/replace-multiple-strings-effectively/)

## 1. 常用

```c#
// 用 Strings.Replace 这样替换是不区分大小写的。

text = System.Text.RegularExpressions.Regex.Replace("Aa", "a", "b", RegexOptions.IgnoreCase);



Console.WriteLine("Aa".Replace("a","b"));
Console.WriteLine(System.Text.RegularExpressions.Regex.Replace("Aa", "a", "b", RegexOptions.IgnoreCase));

// Ab
// bb


// Replace 区分大小写实测
Console.WriteLine("Aa".Replace("a","b"));
// Ab

// C#中怎样进行忽略大小写的替换
using System.Text.RegularExpressions;
text = Regex.Replace(text,"test","OK",RegexOptions.IgnoreCase);

text = System.Text.RegularExpressions.Regex.Replace("Aa", "a", "b", RegexOptions.IgnoreCase);


```

### 1. 封装

```c#

HtmlContent = HtmlContent.ReplaceWithStringBuilder(new[]{Tuple.Create("Lorem", String.Empty)});

HtmlContent = HtmlContent.ReplaceWithStringBuilder(new[]
{
Tuple.Create("Lorem", String.Empty),
Tuple.Create("ipsum", String.Empty),
Tuple.Create("dolor", String.Empty),
Tuple.Create("Other", String.Empty),
Tuple.Create("New", String.Empty),
});

```

### 2. 迭代

```c#
public static string Replace(this string value, IEnumerable<Tuple<string, string>> toReplace)
{
    string result = value;
    foreach (var item in toReplace)
    {
        result = value.Replace(item.Item1, item.Item2);
    }
    return result;
}


public static string ReplaceWithStringBuilder(this string value, IEnumerable<Tuple<string, string>> toReplace)
{
    var result = new StringBuilder(value);
    foreach (var item in toReplace)
    {
        result.Replace(item.Item1, item.Item2);
    }
    return result.ToString();
}




var watch = new Stopwatch();
watch.Start();

for (int i = 0; i < 1000000; i++)
{
    string result = "Lorem ipsum dolor sit amet".Replace(new []
    {
        Tuple.Create("Lorem", String.Empty),
        Tuple.Create("ipsum", String.Empty),
        Tuple.Create("dolor", String.Empty),
        Tuple.Create("Other", String.Empty),
        Tuple.Create("New", String.Empty),
    });
}

watch.Stop();
Console.WriteLine("{0} ms with String Replace.", watch.ElapsedMilliseconds);
watch.Restart();

for (int i = 0; i < 10000; i++)
{
    string result = "Lorem ipsum dolor sit amet".ReplaceWithStringBuilder(new[]
    {
        Tuple.Create("Lorem", String.Empty),
        Tuple.Create("ipsum", String.Empty),
        Tuple.Create("dolor", String.Empty),
        Tuple.Create("Other", String.Empty),
        Tuple.Create("New", String.Empty),
    });
}

watch.Stop();
Console.WriteLine("{0} ms with StringBuilder.", watch.ElapsedMilliseconds);
Console.ReadKey();
```

### 3. C#：替换字符串（文字），仅替换第 1 次出现的

```c#

// C#：替换字符串（文字），仅替换第1次出现的
string s = "aaa";
Regex r = new Regex("a");
s=r.Replace(s,"b",1);
```
