# StringBuilder

- [StringBuilder Class (System.Text)](https://docs.microsoft.com/en-us/dotnet/api/system.text.stringbuilder?view=netframework-4.8)
- [为什么 StringBuilder 的效率要比 String 高?](https://blog.csdn.net/qq_31209193/article/details/81092958)
- [String、StringBuffer 和 StringBuilder 这三兄弟分别是做什么的？](https://baijiahao.baidu.com/s?id=1620369353038714999&wfr=spider&for=pc)
- [String、StringBuffer 与 StringBuilder 之间区别 - PointNet - 博客园](https://www.cnblogs.com/goody9807/p/6516374.html)
- [c#stringbuilder 是线程安全吗](https://zhidao.baidu.com/question/1864128537884500467.html)
- [.Net(C#) 实现 replace 字符串替换只替换一次的方法-CJavaPy](https://www.cjavapy.com/article/413/)
- [C#中 StringBuilder 类的使用 - 每天积累 - ITeye 博客](https://www.iteye.com/blog/fhuan123-841392)
- [C#系列之 String 和 StringBuilder - 陈珙 - 博客园](https://www.cnblogs.com/skychen1218/p/3593678.html)
- [C#实现字符替换的三种方法](https://blog.csdn.net/Cloudkings/article/details/78801153)
- String 字符串常量
- StringBuffer 字符串变量（线程安全）
- StringBuilder 字符串变量（非线程安全）

- StringBuilder 是 1.5 新引入的，其前身就是 StringBuffer。

```c#
// StringBuilder此类型的所有公共静态成员都是线程安全的。但是不保证所有实例成员都是线程安全的。

不是。.net只保证它提供的所有静态方法是线程安全的。

```

## 常用

### 1. demo

```c#
StringBuilder sb = new StringBuilder();


StringBuilder sb = new StringBuilder("ABC", 50);
sb.Append(new char[] { 'D', 'E', 'F' });
sb.AppendFormat("GHI{0}{1}", 'J', 'k');
Console.WriteLine("{0} chars: {1}", sb.Length, sb.ToString());
sb.Insert(0, "Alphabet: ");
sb.Replace('k', 'K');
Console.WriteLine("{0} chars: {1}", sb.Length, sb.ToString());

// This code produces the following output.
//
// 11 chars: ABCDEFGHIJk
// 21 chars: Alphabet: ABCDEFGHIJK

```

### 2. 实现 replace 字符串替换只替换一次的方法

#### 1. 使用 StringBuilder 替换

```c#
string str = "hello world! cjavapy!!!";
StringBuilder sb = new StringBuilder(str);
str = sb.Replace("!", "b", 0, str.IndexOf("!") + 1).ToString(); ;//指定替换的范围实现替换一次,并且指定范围中要只有一个替换的字符串
Console.WriteLine(str);//输出：hello worldb cjavapy!!!
Console.ReadKey();
```

#### 2. 使用正则表达式(Regex)替换

```c#
string str = "hello world! cjavapy!!!";
Regex regex = new Regex("!");//要替换字符串"!"
str = regex.Replace(str, "b", 1);//最后一个参数是替换的次数
Console.WriteLine(str);//输出：hello worldb cjavapy!!!
Console.ReadKey();
```

#### 3. 使用 IndexOf 和 Substring 替换

```c#
string str = "hello world! cjavapy!!!";
StringBuilder sb = new StringBuilder(str);
int index = str.IndexOf("!");
str = str.Substring(0, index) + "b" + str.Substring(index + 1);//指定替换的范围实现替换一次,并且指定范围中要只有一个替换的字符串
Console.WriteLine(str);//输出：hello worldb cjavapy!!!
Console.ReadKey();
```

#### 4. 通过扩展方法实现 ReplaceOne 扩展方法实现代码

```c#
public static class StringReplace
{
    public static string ReplaceOne(this string str, string oldStr, string newStr)
    {
            StringBuilder sb = new StringBuilder(str);
        int index = str.IndexOf(oldStr);
        if (index > -1)
            return str.Substring(0, index) + newStr + str.Substring(index + oldStr.Length);
        return str;
    }
}
```

#### 5. 委托替换 Demo

```c#

  //性能赛跑测试
public static bool FunDemo3()
{
    #region text
    var text = "";
    #endregion

    System.Diagnostics.Stopwatch stopwatch = new System.Diagnostics.Stopwatch();
    stopwatch.Reset();
    stopwatch.Start();
    stopwatch.Stop();

    StringDemoExtenions.ChangeEveryTimesNewwordDelegate newwordDelegate = new StringDemoExtenions.ChangeEveryTimesNewwordDelegate(delegate ()
    {
        return RandomExtenions.Xcharacter(8);
    });
    var tmp = text;
    tmp = StringDemoExtenions.ReplaceWithStringBuilder(tmp, "[随机5-15字符]", newwordDelegate);
    Console.WriteLine("StringBuilder和string分段组合用时{0}毫秒。", stopwatch.Elapsed.TotalMilliseconds);

    stopwatch.Reset();
    stopwatch.Start();
    tmp = text;
    tmp = StringDemoExtenions.ReplaceWithRegex(tmp, @"(\[随机5-15字符\])", newwordDelegate);
    stopwatch.Stop();
    Console.WriteLine("正册表达式用时{0}毫秒。", stopwatch.Elapsed.TotalMilliseconds);

    return true;
}

public static class StringDemoExtenions
{
    public delegate string ChangeEveryTimesNewwordDelegate();

    public static string ReplaceWithStringBuilder(string str, string oldStr, ChangeEveryTimesNewwordDelegate newwordDelegate )
    {
        string newStr;

        newStr = "";
        Console.WriteLine("将字符串中的{0}替换成{1}···", oldStr, newStr);
        StringBuilder strBuffer = new StringBuilder();
        int start = 0;
        int tail = 0;

        //一旦找不到需要替换的字符串(第一次IndexOf返回-1)
        //就说明没有该关键字符串，可以直接返回之前的字符串
        if (str.IndexOf(oldStr) == -1)
        {
            Console.WriteLine("没有找到需要替换的关键字符串!");
            return str;
        }

        //每次都不断循环，查找这个x
        //一旦找到了，就把它之前和上一个x之后的字符串拼接起来
        while (true)
        {
            start = str.IndexOf(oldStr, start);
            if (start == -1)
            {
                break;
            }
            strBuffer.Append(str.Substring(tail, start - tail));
            newStr = newwordDelegate();
            strBuffer.Append(newStr);
            start += oldStr.Length;
            tail = start;
        }

        //查找到最后一个位置之后
        //还要把剩下的字符串拼接进去
        strBuffer.Append(str.Substring(tail));
        return strBuffer.ToString();
    }

    public static string ReplaceWithRegex(string str, string oldStr, ChangeEveryTimesNewwordDelegate newwordDelegate)
    {
        string newStr;
        while (str.IndexOf(oldStr) > 0)
        {
            Regex regex = new Regex(oldStr);//要替换字符串
            newStr = newwordDelegate();

            str = regex.Replace(str, newStr, 1);//最后一个参数是替换的次数

        }

        return str;
    }

}


```
