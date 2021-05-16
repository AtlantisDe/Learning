# C# Format

- [.NET 中的格式设置类型](https://docs.microsoft.com/zh-cn/dotnet/standard/base-types/formatting-types)
- [C#数字格式化 - microsoft-zh.cn - 博客园](https://www.cnblogs.com/sntetwt/p/8145886.html)
- [string.Format 对 C#字符串格式化 - itjeff - 博客园](https://www.cnblogs.com/itjeff/p/5775665.html)
- [这种写法用过没：string.Format(&quot;{0,-10}&quot;, 8) - 鹤冲天 - 博客园](https://www.cnblogs.com/ldp615/archive/2011/08/03/string-format-with-length.html)
- [C# String.Format - Andy Niu - 博客园](https://www.cnblogs.com/nzbbody/p/3414167.html)

## 1. 格式化集合

### 1. D-十进制数

```c#
Console.WriteLine(1.ToString("D5"));
25.ToString("D5");//结果：00025

var h2 = String.Format("{0:X8}", v2.ToCrc32());
```

### 2. 实现保留两位小数的方法

```c#
1、Math.Round(0.333333,2);//按照四舍五入的国际标准
2、double dbdata=0.335333; string str1=String.Format("{0:F}",dbdata);//默认为保留两位
3、float i=0.333333; int j=(int)(i * 100); i = j/100;
4、decimal.Round(decimal.Parse("0.3333333"),2)
5、private System.Globalization.NumberFormatInfo nfi = new System.Globalization.NumberFormatInfo(); float test=0.333333f; nfi.NumberDecimalDigits=2; string result=test.ToString("N", nfi);
6、string result= String.Format("{0:N2}",Convert.ToDecimal("0.333333").ToString());
7、Convert.ToDecimal("0.33333333").ToString("0.00");
```

### 3. 使用率

```c#
 SystemInfo.cpuUsage = Convert.ToDecimal(CsharpLazycode.Module.MySystem.Util.getCPUCounter()).ToString("0.00");
```

### 4. String.Format 复合格式设置 转义大括号

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

### 5. Format file sizes in KB, MB, GB

- [Format file sizes in KB, MB, GB, and so forth in C# - C# Helper](http://csharphelper.com/blog/2014/07/format-file-sizes-in-kb-mb-gb-and-so-forth-in-c/)

### 6. 数字带逗号（千分位符、金钱千分位字符）

- [C# 数字带逗号（千分位符、金钱千分位字符） - 王若伊\_恩赐解脱 - 博客园](https://www.cnblogs.com/jilodream/p/4219804.html)

```c#
// 如1234567变成1,234,567
// 方法：x.ToString("###,###")   或  1234567.ToString("N0")
1234567.ToString("N0")

```
