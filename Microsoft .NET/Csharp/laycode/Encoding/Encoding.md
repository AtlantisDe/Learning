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

Encoding.GetEncoding("UTF-16LE");
1200


```

## Wiki

- [C# UTF-8 与 GB2312 编码的相互转化 - WSHBlog 的专栏 - CSDN 博客](https://blog.csdn.net/u014076894/article/details/40382567)
- [C# Encoding.GetEncoding 编码列表 - gengyiping18 的专栏 - CSDN 博客](https://blog.csdn.net/gengyiping18/article/details/77620061)
- [C#获取文本文件的编码，自动区分 GB2312 和 UTF8 - Napol&#233;on - 博客园](https://www.cnblogs.com/guyun/p/4262587.html)
- [c# 获取网页源码，自动判断编码格式新方法！ - Crazy Coder - 博客园](https://www.cnblogs.com/swtseaman/archive/2012/10/04/2711836.html)
- [C# 自动识别文件的编码格式(支持 utf-8/gb3212/gbk/ascii 等多种格式) - 开发实例、源码下载 - 好例子网](https://www.haolizi.net/example/view_975.html)
- [C#判断文件编码——常用字法 - 技术经验 - W3xue](https://www.w3xue.com/exp/article/201811/8093.html)
- [C#如何自动识别文件的编码 / 张生荣](https://www.zhangshengrong.com/p/7B1LeWDawp/)

## 加密与解密

- [C#一个字符串的加密与解密 - 纳米程序员 - 博客园](https://www.cnblogs.com/wifi/articles/2482350.html)

## C# Encoding.GetEncoding 编码列表

```c#
For Example：
Encoding e1 = Encoding.GetEncoding( 12000 );

// Get a UTF-32 encoding by name.
Encoding e2 = Encoding.GetEncoding( "utf-32" );

// Check their equality.
Console.WriteLine( "e1 equals e2? {0}", e1.Equals( e2 ) );
```

### 相关常用

#### 取中文字符

```c#
Go_str_Chinese();

bool Go_str_Chinese()
{
      string socure = "Χ��Ⱥ������ ������Ϣ����-������";
      socure = "������ִ�����ط�ѡ�١���ʤ�� 16����ʧ������-������";
      socure = "强硬脱欧派vs中国女婿，英国新首相将从这两人中产生！";

      ArrayList itemList = new ArrayList();
      CharEnumerator CEnumerator = socure.GetEnumerator();
      Regex regex = new Regex("^[\u4E00-\u9FA5]{0,}$");
      while (CEnumerator.MoveNext())
      {
      if (regex.IsMatch(CEnumerator.Current.ToString(), 0))
      {
            itemList.Add(CEnumerator.Current.ToString());
      }
}

```

#### SCII、UTF-8、UTF-16BE、UTF-16LE 编码方式的区别

- [ASCII、UTF-8、UTF-16BE、UTF-16LE 编码方式的区别 - ErrorZero 的专栏 - CSDN 博客](https://blog.csdn.net/errorzero/article/details/8483344)

```c#
可以看到
UTF-8编码以 EF BB BF 开头

UTF-16BE编码以FE FF  开头

UTF-16LE编码以FF FE  开头

UTF-8编码方式对不同范围的字符用不同长度的位数编码以及大端与小端的区别。
```
