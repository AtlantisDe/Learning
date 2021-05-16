# C# HttpClient

- [HttpClient Class (System.Net.Http)](https://docs.microsoft.com/zh-tw/dotnet/api/system.net.http.httpclient?view=netframework-4.8)
- [HttpClient Class (System.Net.Http)](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient?view=netframework-4.7.2)
- [C#中 HttpClient 使用注意：预热与长连接](https://www.cnblogs.com/dudu/p/csharp-httpclient-attention.html)
- [C# System.Net.Http.HttpClient 使用说明](https://www.cnblogs.com/lh173110/p/7799698.html)
- [C#使用 HttpClient 进行 GET&POST](https://blog.csdn.net/wangyi1e/article/details/29204987?utm_source=blogxgwz3)
- [C# 中使用 System.Net.Http.HttpClient 模拟登录博客园 (GET/POST)](https://www.cnblogs.com/amosli/p/3918538.html)
- [C# 解决“请求被中止: 未能创建 SSL/TLS 安全通道”的问题](https://www.cnblogs.com/xuliangxing/p/8384821.html)
- [C# HttpClient 高并发时怎么解决 TCP 连接数过多](https://q.cnblogs.com/q/90727)

## 0. 常用

```c#
// Copy as cURL (bash)  注意 不是 Copy all as cURL (bash)   不带all的那个选项

var handler = new HttpClientHandler();
handler.UseCookies = false; /*这里标记影响自动COOKIE 不影响请求HTTP Cookie选项*/

string sEncode = System.Web.HttpUtility.UrlEncode("我爱茂茂");
var response = httpClient.SendAsync(request).Result.Content.ReadAsStringAsync().Result;
var html = httpClient.SendAsync(request).Result.Content.ReadAsStringAsync().Result;
var html = httpclient.PostAsync(uri, content).Result.Content.ReadAsStringAsync().Result;


request.Content.Headers.ContentType = System.Net.Http.Headers.MediaTypeHeaderValue.Parse("application/x-www-form-urlencoded");
```

## 0. HTTP GET 版本 Curl 转请求处理

```c#
/*HTTP GET版本Curl转请求处理*/ 
var itemsHeaders = new List<Dot.Net.Common.Models.KeyValueItem>();
var httpGetRawUrl = "";
var arrLines = curlBashText.Split("\r\n".ToArray(), StringSplitOptions.RemoveEmptyEntries);
for (int k = 0; k < arrLines.Length; k++)
{
    var item = arrLines[k]; if (item.Contains("curl '")) { httpGetRawUrl = item.GetStringMid("curl '", @"' \"); }
    else if (item.Contains("-H '")) { itemsHeaders.Add(new Dot.Net.Common.Models.KeyValueItem { Key = item.GetStringMid("-H '", ": "), Value = item.GetStringMid(": ", @"' \") }); }
}

/*自动添加参数*/
foreach (var item in itemsHeaders)
{
    request.Headers.TryAddWithoutValidation(item.Key, item.Value);
}

```

## 1. 请求被中止: 未能创建 SSL/TLS 安全通道

```c#
System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12; //加上这一句

// 使用httpclient还有两点经验，一个是创建的MultiThreadedHttpConnectionManager 实例最好是全局的，否则会有多个连接池，而HttpClient是线程安全的，可以多个实例。另一个是，在处理请求的最后，也就是finnaly里中，要调用method.releaseConnection();回收连接，否则连接池就可能会爆了。
```

## 2. Header 添加

- 内容类型是内容的头部，而不是请求的头部，这就是失败的原因。AddWithoutValidation 正如 Robert Levy 所建议的那样，但是您也可以在创建请求内容时自己设置内容类型（请注意，代码片段在两个地方添加了“application / json”（对于 Accept 和 Content-Type 标头）
- [[C#]如何给 HttpClient 添加 Accept:text/plain 的请求头*已解决*博问 博客园](https://q.cnblogs.com/q/78951/)
- [如何为 HttpClient 请求设置 Content-Type 头？ - 问答 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/ask/27305)

```c#
new HttpClient().DefaultRequestHeaders.Accept.Clear();
new HttpClient().DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("text/plain");

// 错误写法
httpclient.DefaultRequestHeaders.Add("Content-Type", "application/json");
// 错误写法

// 正确写法
httpclient.DefaultRequestHeaders.Add("Authorization", "signStr");
httpclient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));//ACCEPT heade
```

## 3. Demo ReadAsStringAsync

```c#
var rst = response.Result;
if (rst.IsSuccessStatusCode)
{
    var contxt = rst.Content;
    var aaa = contxt.ReadAsStringAsync();
    var ccc = aaa.Result;

    if (ccc.Contains("SUCCESS") && ccc.Contains("接口调用成功"))
    {

        return "";
    }
}
```

## 3. GET GetAsync

```c#
using (HttpClient client = new HttpClient())
{
    try
    {
        Task<HttpResponseMessage> response = client.GetAsync("http://www.contoso.com/");
        response.Wait();
        if (response.Result != null)
        {
            var rst = response.Result;
            if (rst.IsSuccessStatusCode)
            {
                UserItem.StatusCode = rst.StatusCode;
            }
        }
    }
    catch (HttpRequestException e)
    {
        Console.WriteLine("\nException Caught!");
        Console.WriteLine("Message :{0} ", e.Message);
    }
}
```

## 4. GET HttpClientDoGet

```c#
public async void HttpClientDoGet()
{
    var uri = "http://api.wsncloud.com/device/v1/list?";
    var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None };

    using (var httpclient = new HttpClient(handler))
    {
        httpclient.BaseAddress = new Uri(uri);
        httpclient.DefaultRequestHeaders.Accept.Clear();
        httpclient.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

        HttpResponseMessage response = await httpclient.GetAsync("?ak=xxxxxxxxxxxxxxxxxxxx");
        if(response.IsSuccessStatusCode)
        {
            Stream myResponseStream = await response.Content.ReadAsStreamAsync();
            StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));
            string retString = myStreamReader.ReadToEnd();
            myStreamReader.Close();
            myResponseStream.Close();
            MessageBox.Show(retString);
        }
    }
}
```

## 5. POST Demo1 新版似乎有改动下面代码仅供参考 [已废弃]

```c#
public async void HttpClientDoPost()
{
    var uri = "http://api.wsncloud.com/sensor/v1/list?";
    var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None };
    using (var httpclient = new HttpClient(handler))
    {
        httpclient.BaseAddress = new Uri(uri);
        var content = new FormUrlEncodedContent(new Dictionary<string, string>()
            {
                {"ak", "65fc7ca4fc441d26f71bf3d691b278c2"},
                {"deviceId", "537eb34be4b022b7fbe19471"}
            });
        var response = await httpclient.PostAsync(uri, content);
        string responseString = await response.Content.ReadAsStringAsync();
        MessageBox.Show(responseString);
    }
}
```

## 6. 编码

```c#
var c = System.Web.HttpUtility.UrlEncode(a);


try
{
    var aa = tyorder001;
    IDictionary<string, string> para = new Dictionary<string, string>();
    para.Add("id", Bmm.urlEn(aa.id, false));
    para.Add("no", Bmm.urlEn(aa.no, false));
    para.Add("BuyInfo", Bmm.urlEnJson(aa.BuyInfo));
    postpackage.poststr = Bmm.poststr(para);



}
catch (Exception Ex)
{
    Console.WriteLine("异常[]:" + Ex.Message);
}

public static string urlEn(object obj, bool b = true)
{
    var a = Convert.ToString(obj);
    var c = System.Web.HttpUtility.UrlEncode(a);
    return c;

}
public static string urlEnJson(object obj)
{
    var a = Newtonsoft.Json.JsonConvert.SerializeObject(obj);
    var c = System.Web.HttpUtility.UrlEncode(a);
    return c;

}

```

## 7. Cookie

- [How do I set a cookie on HttpClient&#39;s HttpRequestMessage](https://stackoverflow.com/questions/12373738/how-do-i-set-a-cookie-on-httpclients-httprequestmessage)
- [C# request sending cookie with request using httpclient, C# - rextester](https://rextester.com/discussion/TQRQ88190/C-request-sending-cookie-with-request-using-httpclient)
- [[HOWTO] Set Cookie Header on DefaultRequestHeaders of HttpClient](https://d-fens.ch/2016/12/27/howto-set-cookie-header-on-defaultrequestheaders-of-httpclient/)
- [How do I set a cookie on HttpClient&#x27;s HttpRequestMessage](https://stackoverflow.com/questions/12373738/how-do-i-set-a-cookie-on-httpclients-httprequestmessage)

```c#
// 使用Cookie与遍历
/// <summary>Cookie存储器</summary>
static CookieContainer CookieContainer = new CookieContainer();
var handler = new HttpClientHandler() { CookieContainer = CookieContainer };
handler.UseCookies = true;
var cookieCollection = CookieContainer.GetCookies(request.RequestUri).Cast<Cookie>();
foreach (Cookie cookie in cookieCollection)
{
    Console.WriteLine(cookie.Name + ": " + cookie.Value);
}

// 读取Cookie
var cookieContainer = new CookieContainer();
var cookie = cookieContainer.GetCookies(request.RequestUri).Cast<Cookie>().FirstOrDefault(x => x.Name == cookieName);

Uri uri = new Uri("http://google.com");
IEnumerable<Cookie> responseCookies = cookies.GetCookies(uri).Cast<Cookie>();
foreach (Cookie cookie in responseCookies)
    Console.WriteLine(cookie.Name + ": " + cookie.Value);


httpclient.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36");
httpclient.DefaultRequestHeaders.Add("Cookie", cookie);

var cookieContainer = new CookieContainer();
cookieContainer.SetCookies(new Uri(uri),cookie);


// Creating cookie collection from header text
CookieCollection.TryParse(cookieHeaderString, out myCookieCollection);
// and getting the final header which would be sent by request
String cookieHeaderString = myCookieCollection.GetCookieHeaderString();


// Here's how you could set a custom cookie value for the request:

var baseAddress = new Uri("http://example.com");
var cookieContainer = new CookieContainer();
using (var handler = new HttpClientHandler() { CookieContainer = cookieContainer })
using (var client = new HttpClient(handler) { BaseAddress = baseAddress })
{
    var content = new FormUrlEncodedContent(new[]
    {
        new KeyValuePair<string, string>("foo", "bar"),
        new KeyValuePair<string, string>("baz", "bazinga"),
    });
    cookieContainer.Add(baseAddress, new Cookie("CookieName", "cookie_value"));
    var result = await client.PostAsync("/test", content);
    result.EnsureSuccessStatusCode();
```

### 0. Cookie 和 Session

- [Cookie 和 Session 的底层实现原理](https://blog.csdn.net/Mr_wxc/article/details/102636559)

### 0. CookieContainer Cookie 标头被 HttpClient 忽略

- UseCookies = false

```c#
var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None, UseCookies = false };

using (var httpClient = new HttpClient(new HttpClientHandler { UseCookies = false }))
{
    var uri = new Uri("http://www.example.com");
    httpClient.BaseAddress = uri;
    httpClient.DefaultRequestHeaders.Add("Cookie", "auth=ArbitrarySessionToken");
    var response = httpClient.GetAsync(uri).Result;
}
```

### 0. HttpClient

```c#
var cookieContainer = new CookieContainer();
cookieContainer.SetCookies(new Uri(uri), cookie);

var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None };
handler.CookieContainer = cookieContainer;
```

### 1. string to CookieContainer

- [CookieContainer.SetCookies(Uri, String) Method (System.Net)](https://docs.microsoft.com/en-us/dotnet/api/system.net.cookiecontainer.setcookies?view=netframework-4.8)
- [C# create cookie from string and send it](https://stackoverflow.com/questions/17594618/c-sharp-create-cookie-from-string-and-send-it)
- [Mapping Header cookie string to CookieCollection and vice versa](https://stackoverflow.com/questions/4792638/mapping-header-cookie-string-to-cookiecollection-and-vice-versa/22098000)

```c#

```

### 2. demo1

```c#
 var baseAddress = new Uri("http://requestb.in/122c1z31");
var cookieContainer = new CookieContainer();
using (var handler = new HttpClientHandler() { CookieContainer = cookieContainer })
using (var client = new HttpClient(handler) { BaseAddress = baseAddress })
{
    var content = new FormUrlEncodedContent(new[]
    {
        new KeyValuePair<string, string>("foo", "bar"),
        new KeyValuePair<string, string>("baz", "bazinga"),
    });
    cookieContainer.Add(baseAddress, new Cookie("CookieName", "madhav"));
    var result = client.PostAsync("", content).Result;
    result.EnsureSuccessStatusCode();
}
```

### 3. demo2

```c#
var baseAddress = new Uri("http://example.com");
using (var handler = new HttpClientHandler { UseCookies = false })
using (var client = new HttpClient(handler) { BaseAddress = baseAddress })
{
    var message = new HttpRequestMessage(HttpMethod.Get, "/test");
    message.Headers.Add("Cookie", "cookie1=value1; cookie2=value2");
    var result = await client.SendAsync(message);
    result.EnsureSuccessStatusCode();
}
```

## 8. DefaultRequestHeaders

```c#
client.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36");

// 错误写法
httpclient.DefaultRequestHeaders.Add("Content-Type", "application/json");
// 错误写法

// 正确写法
httpclient.DefaultRequestHeaders.Add("Authorization", "signStr");
httpclient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));//ACCEPT heade
httpclient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/x-www-form-urlencoded"));
```

```c#
HttpClientHandler httpClientHandler = new HttpClientHandler();
httpClientHandler.AllowAutoRedirect = true;
httpClientHandler.AutomaticDecompression = System.Net.DecompressionMethods.None;
httpClientHandler.UseCookies = false;
```

## 9. HttpClient-Get

- [HTTP HEAD request with HttpClient in .NET 4.5 and C#](https://stackoverflow.com/questions/16416699/http-head-request-with-httpclient-in-net-4-5-and-c-sharp)

### 1. GET Code 1

```C#
using (HttpClient client = new HttpClient())
{
    try
    {
        Task<HttpResponseMessage> response = client.GetAsync("http://www.demo.com");
        response.Wait();
        if (response.Result != null)
        {
            var rst = response.Result;
            if (rst.IsSuccessStatusCode)
            {
                var contxt = rst.Content;
                var task = contxt.ReadAsStringAsync();
                if (task.Wait(5000))
                {
                    var content = task.Result;

                }

            }
        }
    }
    catch (HttpRequestException ex)
    {
        Console.WriteLine("\nException Caught!");
        Console.WriteLine("Message :{0} ", ex.Message);
    }
}
```

### 1. GET Code 2

```C#
using (HttpClient client = new HttpClient())
{
    try
    {
        Task<HttpResponseMessage> response = client.GetAsync("http://demo");
        response.Wait();
        if (response.Result != null)
        {
            var rst = response.Result;
            if (rst.IsSuccessStatusCode)
            {
                var contxt = rst.Content;
                var aaa = contxt.ReadAsStreamAsync();
                if (aaa.Wait(5000))
                {
                    StreamReader myStreamReader = new StreamReader(aaa.Result, Encoding.GetEncoding("utf-8"));
                    string retString = myStreamReader.ReadToEnd();
                    myStreamReader.Close();
                    aaa.Result.Close();
                }

            }
        }
    }
    catch (HttpRequestException e)
    {
        Console.WriteLine("\nException Caught!");
        Console.WriteLine("Message :{0} ", e.Message);
    }
}

```

### 1. HTTP HEAD request

```C#
// 写法参考似乎有错误
using (HttpClient client = new HttpClient())
{
    try
    {
        var response = client.GetAsync("http://www.baidu.com", HttpCompletionOption.ResponseHeadersRead);
        response.Wait(100);
        if (response.Result != null)
        {
            var Html = response.Result.Content.ReadAsStringAsync().Result;
        }

    }
    catch (HttpRequestException e)
    {
        Console.WriteLine("\nException Caught!");
        Console.WriteLine("Message :{0} ", e.Message);
    }
}

//Demo
using (HttpClient client = new HttpClient())
{
    try
    {
        var Result = client.GetAsync("https://libs.baidu.com/jquery/1.9.0/jquery.min.js", HttpCompletionOption.ResponseHeadersRead).Result;
        if (Result != null)
        {
            var Dt1 = Result.Headers.Date;
        }

    }
    catch (HttpRequestException e)
    {
        Console.WriteLine("\nException Caught!");
        Console.WriteLine("Message :{0} ", e.Message);
    }
}


```

## 10. HttpClient-Post.Demo

### 1. POST DEMO

```c#
- FormUrlEncodedContent content = new FormUrlEncodedContent(authentication.ToDictionary<string>().AsEnumerable());
- FormUrlEncodedContent content = new FormUrlEncodedContent(authentication.ToKeyValue());

var content = new FormUrlEncodedContent(new Dictionary<string, string>()
{
    {"guid",  "888888888888"},
    {"ak", "65fc7ca4fc441d26f71bf3d691b278c2"},
    {"deviceId", "537eb34be4b022b7fbe19471"}
});


var dicValue = parameterItem.ToDictionary();
dicValue.Add("offset", apipublishRequestpackagePageitems.offset);
dicValue.Add("length", apipublishRequestpackagePageitems.limit);
var content = new FormUrlEncodedContent(dicValue.ToKeyValue());

```

```c#
FormUrlEncodedContent content = new FormUrlEncodedContent(new Dictionary<string, string>()
{
    ["client_id"] = authentication.ClientId,
    ["client_secret"] = authentication.ClientSecret,
    ["scope"] = authentication.Scope,
    ["code"] = authentication.Code,
    ["grant_type"] = authentication.GrantType,
    ["redirect_uri"] = authentication.RedirectUri
});
```

```c#
try
{
    var uri = "demo.com/aaa?";
    var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None };
    using (var httpclient = new HttpClient(handler))
    {
        httpclient.BaseAddress = new Uri(uri);
        var content = new FormUrlEncodedContent(new Dictionary<string, string>()
            {
                {"guid",  "888888888888"},
                {"ak", "65fc7ca4fc441d26f71bf3d691b278c2"},
                {"deviceId", "537eb34be4b022b7fbe19471"}

            });

        var response = httpclient.PostAsync(uri, content);
        //string responseString =  response.Content.ReadAsStringAsync();
        //MessageBox.Show(responseString);

        response.Wait();
        if (response.Result != null)
        {
            var rst = response.Result;
            if (rst.IsSuccessStatusCode)
            {
                var contxt = rst.Content;
                var stream = contxt.ReadAsStreamAsync();
                if (stream.Wait(5000))
                {
                    StreamReader myStreamReader = new StreamReader(stream.Result, Encoding.GetEncoding("utf-8"));
                    string retString = myStreamReader.ReadToEnd();
                    myStreamReader.Close();
                    stream.Result.Close();
                }

            }
        }

    }

}
catch (Exception ex)
{
    Console.WriteLine(string.Format("异常包: [{0}] [{1}] 异常消息:{2}", System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));
    root.code = 100;
    root.message = string.Format("异常[{0}]", ex.Message);
}
finally
{
}

```

### 2. FormUrlEncodedContent

- [Creating FormUrlEncodedContent Variables from Objects &#8211; bitScry](https://blog.bitscry.com/2018/12/14/creating-formurlencodedcontent-variables-from-objects/)

```c#
FormUrlEncodedContent content = new FormUrlEncodedContent(new Dictionary<string, string>()
{
    ["client_id"] = authentication.ClientId,
    ["client_secret"] = authentication.ClientSecret,
    ["scope"] = authentication.Scope,
    ["code"] = authentication.Code,
    ["grant_type"] = authentication.GrantType,
    ["redirect_uri"] = authentication.RedirectUri
});
```

### 3. ToDictionary

```c#
public static class ObjectExtensions
{
    public static IDictionary<string, object> ToDictionary(this object source)
    {
        return source.ToDictionary<object>();
    }

    public static IDictionary<string, T> ToDictionary<T>(this object source)
    {
        if (source == null) ThrowExceptionWhenSourceArgumentIsNull();

        var dictionary = new Dictionary<string, T>();
        foreach (PropertyDescriptor property in TypeDescriptor.GetProperties(source))
        {
            object value = property.GetValue(source);
            if (IsOfType<T>(value))
            {
                dictionary.Add(property.Name, (T)value);
            }
        }
        return dictionary;
    }

    private static bool IsOfType<T>(object value)
    {
        return value is T;
    }

    private static void ThrowExceptionWhenSourceArgumentIsNull()
    {
        throw new NullReferenceException("Unable to convert anonymous object to a dictionary. The source anonymous object is null.");
    }
}
```

### 4. ToKeyValue

```c#
public static class ObjectExtensions
{
    public static IDictionary<string, string> ToKeyValue(this object metaToken)
    {
        if (metaToken == null)
        {
            return null;
        }

        JToken token = metaToken as JToken;
        if (token == null)
        {
            return ToKeyValue(JObject.FromObject(metaToken));
        }

        if (token.HasValues)
        {
            var contentData = new Dictionary<string, string>();
            foreach (var child in token.Children().ToList())
            {
                var childContent = child.ToKeyValue();
                if (childContent != null)
                {
                    contentData = contentData.Concat(childContent)
                                             .ToDictionary(k => k.Key, v => v.Value);
                }
            }

            return contentData;
        }

        var jValue = token as JValue;
        if (jValue?.Value == null)
        {
            return null;
        }

        var value = jValue?.Type == JTokenType.Date ?
                        jValue?.ToString("o", CultureInfo.InvariantCulture) :
                        jValue?.ToString(CultureInfo.InvariantCulture);

        return new Dictionary<string, string> { { token.Path, value } };
    }
}
```

### 5. using any JsonProperty decorations

- This extension method has the advantage of using any JsonProperty decorations you might have on the object model so that you can control the key names.

```c#
FormUrlEncodedContent content = new FormUrlEncodedContent(authentication.ToKeyValue());
```

## 11. HttpClient.StreamContent

- [C# HttpClient StreamContent 用法*C#*淮阴侯](https://blog.csdn.net/u013710468/article/details/103787409)
- [如何使用 HttpContent? - 问答 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/ask/96160)

### 1.0 简单

```c#
    HttpClient httpClient = new HttpClient();
    httpClient.DefaultRequestHeaders.Add("User-Agent", "curl/7.12.1");
    var stringContent = new StringContent(Items);
    var response = httpClient.PostAsync(URL, stringContent).Result.Content.ReadAsStringAsync().Result;
```

### 1.0 复杂

```c#
        /// <summary>百度推送测试</summary>
        public static bool DebugDemoBaiduPush(bool IsDebugging = false)
        {
            if (IsDebugging == false) { return false; }


            var URL = "";
            var Items = "";

            HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Add("User-Agent", "curl/7.12.1");


            using (HttpRequestMessage request = new HttpRequestMessage())
            {
                request.Method = HttpMethod.Post;
                request.RequestUri = new Uri(URL);

                using (MemoryStream ms = new MemoryStream())
                {
                    //使用二进制序列化将你需要转送的对象转换成Stream
                    BinaryFormatter binaryFormatter = new BinaryFormatter();
                    binaryFormatter.Serialize(ms, Items);
                    ms.Position = 0; //重置ms的position，便于StreamContent读取流内容
                    request.Content = new StreamContent(ms, (int)ms.Length);
                    var res = httpClient.SendAsync(request).Result;
                    res.EnsureSuccessStatusCode();
                    //处理返回结果
                    var html = res.Content.ReadAsStringAsync().Result;
                }
            }




            return true;
        }
```

## 12. HttpClientHandler

- [c# &#8211; 使用 HttpClient,如何在 301 的情况下阻止自动重定向并获取原始状态代码和禁止 url - 代码日志](https://codeday.me/bug/20180612/177805.html)

```c#
public static async void makeRequest(int row, string url)
{
    string result;
    Stopwatch sw = new Stopwatch(); sw.Start();

    // added here
    HttpClientHandler httpClientHandler = new HttpClientHandler();
    httpClientHandler.AllowAutoRedirect = false;

    try
    {
        // passed in here
        using (HttpClient client = new HttpClient(httpClientHandler))
        {

        }
```

### 0. 常用 HttpClientHandler

```c#
// added here
HttpClientHandler httpClientHandler = new HttpClientHandler();
httpClientHandler.AllowAutoRedirect = false;
httpClientHandler.AutomaticDecompression = System.Net.DecompressionMethods.None;
httpClientHandler.UseCookies = false;


var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None };
handler.AutomaticDecompression = System.Net.DecompressionMethods.None;
handler.UseCookies = false;
```

### 1. 禁止重定向

- httpClientHandler.AllowAutoRedirect = false;

```c#
var handler = new HttpClientHandler() { AutomaticDecompression = DecompressionMethods.None, UseCookies = false };
```

## 13. HTTP Err

### 1.发生一个或多个错误

- [c# – 发生了一个或多个错误：PostAsJsonAsync - 程序园](http://www.voidcn.com/article/p-exwgxgms-buh.html)

```c#
catch (AggregateException err)
{
    foreach (var errInner in err.InnerExceptions)
    {
        Console.WriteLine(errInner);
    }
}
finally
{
}

catch (AggregateException ex)
{
    foreach (var errInner in ex.InnerExceptions)
    {
        Console.WriteLine(errInner);
    }
}
finally
{
}
```

### 2. 基础连接已经关闭: 连接被意外关闭,错误的解决

- [c# 基础连接已经关闭: 连接被意外关闭,错误的解决 - NET 未来之路 - 博客园](https://www.cnblogs.com/lonelyxmas/p/5138792.html)

## 14. 发送文本文件 POST

```c#
using (var httpClient = new HttpClient())
{
    using (var request = new HttpRequestMessage(new HttpMethod("POST"), "http://data.zz.baidu.com/urls?site=google.com&token=CdzAW999FjWf"))
    {
        request.Content = new StringContent(File.ReadAllText("urls.txt"));
        request.Content.Headers.ContentType = System.Net.Http.Headers.MediaTypeHeaderValue.Parse("text/plain");


        var response = await httpClient.SendAsync(request);
    }
}
```
