# Encoding

## c# UrlEncode,UrlDecode

```c#
HttpUtility.UrlEncode(text);  //utf-8 编码
HttpUtility.UrlDecode(text);  //utf-8 解码
HttpUtility.UrlEncode(text, System.Text.Encoding.GetEncoding(936));  //gb2312编码
HttpUtility.UrlDecode(text, System.Text.Encoding.GetEncoding(936));  //gb2312解码

StreamReader myStreamReader = new StreamReader(aaa.Result, Encoding.GetEncoding("utf-8"));
StreamReader myStreamReader = new StreamReader(aaa.Result, Encoding.GetEncoding(936));
StreamReader myStreamReader = new StreamReader(aaa.Result, Encoding.GetEncoding("GB2312"));

Encoding utf8;
Encoding gb2312;
utf8 = Encoding.GetEncoding("UTF-8");
gb2312 = Encoding.GetEncoding("GB2312");
```

## Wiki

- [C# UTF-8 与 GB2312 编码的相互转化 - WSHBlog 的专栏 - CSDN 博客](https://blog.csdn.net/u014076894/article/details/40382567)

## 加密与解密

- [C#一个字符串的加密与解密 - 纳米程序员 - 博客园](https://www.cnblogs.com/wifi/articles/2482350.html)
