# char

- [C#中 char[]与 string 之间的转换 - 顺德早茶 - 博客园](https://www.cnblogs.com/wintalen/archive/2010/12/20/1911599.html)

```c#
// string 转换成 Char[]
　　string ss = "abcdefg";
　　char[] cc = ss.ToCharArray();

// Char[] 转换成string
　　string s = new string(cc);

// 此外,byte[] 与 string 之间的装换
　　byte[] bb = Encoding.UTF8.GetBytes(ss);
　　string s = Encoding.UTF8.GetString(bb);

// 下面我们利用 StringBuilder 来进行数组 与 string 间的转换 ， 很简单，代码如下

using System.Text;

StringBuilder sb = new StringBuilder();
foreach(char c in cc)
{
    sb.Append(c);
}
string s = sb.ToString();

// StringBuilder 的 Append 方法支持多种参数，所以数组转换成string基本上都可以用它。

// 另外 string[] 转换成string,.Net框架提供了一个使用的方法
string strOr = "OR";
string result = string.Concat(new string[]{" A ",strOr," B ",Environment.NewLine," C ",strOr," D "});
```
