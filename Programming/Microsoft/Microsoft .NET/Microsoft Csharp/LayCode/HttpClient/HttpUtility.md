# HttpUtility

- 引用:System.Web
- System.Web.HttpUtility
- [HttpUtility Class (System.Web)](https://docs.microsoft.com/zh-cn/dotnet/api/system.web.httputility?view=net-5.0)

## 常用

```c#
// 将字符串转换为 HTML 编码字符串。
public static string HtmlEncode (string s);
// 将已经为 HTTP 传输进行过 HTML 编码的字符串转换为已解码的字符串。
public static string HtmlDecode (string s);

string sEncode = System.Web.HttpUtility.UrlEncode("测试文件名称.doc");
string sFilePath = System.Web.HttpUtility.UrlDecode(sEncode);

// 查询字段值
var query = System.Web.HttpUtility.ParseQueryString(StarUri.Query);
       var query = System.Web.HttpUtility.ParseQueryString(uri.Query, Encoding.UTF8);
var userId = query.Get("id");


// System.Web

// 重新辅助后的字符串地址
var query = System.Web.HttpUtility.ParseQueryString(uri.Query, Encoding.UTF8);

var uri = new Uri(url);
var query = System.Web.HttpUtility.ParseQueryString(uri.Query); 
query.Set("pagenum", (i + 1).ToString()); 
var newUrlstr = $"{uri.Scheme}://{uri.Host}{uri.LocalPath}?{query.ToString()}";



// 赋值相关操作
var query = System.Web.HttpUtility.ParseQueryString(uri.Query, Encoding.UTF8);

var uri = new Uri("https://www.google.com/mob/zmt?id=2622756899");
var query = System.Web.HttpUtility.ParseQueryString(uri.Query);
var var2 = query.Get("id");
query.Set("id", "123");
query.Set("user", "666");
```
