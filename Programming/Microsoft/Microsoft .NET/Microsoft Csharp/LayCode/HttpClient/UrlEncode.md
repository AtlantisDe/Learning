# UrlEncode

- [C#对 Url 进行编码和解码 - a_dev 的专栏 - CSDN 博客](https://blog.csdn.net/a_dev/article/details/79478492)

```C#
// 引用:
System.Web


string sEncode = System.Web.HttpUtility.UrlEncode("测试文件名称.doc");
string sFilePath = System.Web.HttpUtility.UrlDecode(sEncode);

var data = System.Web.HttpUtility.UrlEncode(sdata, Encoding.UTF8);



/// <summary>UrlEncode UTF8编码 /默认是System.Text.Encoding.Default.GetBytes(str)</summary>
public static string UrlEncode(string str)
{
    try
    {
        StringBuilder sb = new StringBuilder();
        byte[] byStr = System.Text.Encoding.UTF8.GetBytes(str);
        for (int i = 0; i < byStr.Length; i++)
        {
            sb.Append(@"%" + Convert.ToString(byStr[i], 16));
        }

        return (sb.ToString());
    }
    catch (Exception)
    {

        return "";
    }
}


```
