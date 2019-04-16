# C# HTTP

- [TCP/IP协议族(一) HTTP简介、请求方法与响应状态码 - 青玉伏案 - 博客园](https://www.cnblogs.com/ludashi/p/6232060.html)

## 状态码

- [HTTP状态码详解](http://tool.oschina.net/commons?type=5)
- [HTTP状态码_百度百科](https://baike.baidu.com/item/HTTP%E7%8A%B6%E6%80%81%E7%A0%81/5053660?fr=aladdin)

```c#

```

## 其它

```c#
CookieContainer cc = new CookieContainer();
HttpItems items = new HttpItems();
HttpHelpers helper = new HttpHelpers();
HttpResults hr = new HttpResults();

string cookie = "";
items = new HttpItems();
items.Container = cc;
items.Cookie = cookie;
items.URL = urlitem.url;
items.Referer = "";
items.Method = "GET";
items.Postdata = "";
items.ResultType = ResultType.So;
items.Allowautoredirect = true;
hr = helper.GetHtml(items);

urlitem.StatusCode = hr.StatusCode;
if (hr.StatusCode == HttpStatusCode.OK)
{

}
else
{
    urlitem.Message = "本地网络检测环节,有异常,状态码:" + hr.StatusCode;
    return ipitemStates;
}
```