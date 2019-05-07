# UrlEncode

- [C#对 Url 进行编码和解码 - a_dev 的专栏 - CSDN 博客](https://blog.csdn.net/a_dev/article/details/79478492)

```C#
string sEncode = System.Web.HttpUtility.UrlEncode("测试文件名称.doc");
string sFilePath = System.Web.HttpUtility.UrlDecode(sEncode);
```
