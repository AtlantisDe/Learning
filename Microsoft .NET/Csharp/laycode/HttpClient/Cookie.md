# Cookie

- [How do I set a cookie on HttpClient&#39;s HttpRequestMessage](https://stackoverflow.com/questions/12373738/how-do-i-set-a-cookie-on-httpclients-httprequestmessage)
- [C# request sending cookie with request using httpclient, C# - rextester](https://rextester.com/discussion/TQRQ88190/C-request-sending-cookie-with-request-using-httpclient)
- [[HOWTO] Set Cookie Header on DefaultRequestHeaders of HttpClient](https://d-fens.ch/2016/12/27/howto-set-cookie-header-on-defaultrequestheaders-of-httpclient/)

## 常用

```c#
httpclient.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36");
httpclient.DefaultRequestHeaders.Add("Cookie", cookie);

var cookieContainer = new CookieContainer();
cookieContainer.SetCookies(new Uri(uri),cookie);


// Creating cookie collection from header text
CookieCollection.TryParse(cookieHeaderString, out myCookieCollection);
// and getting the final header which would be sent by request
String cookieHeaderString = myCookieCollection.GetCookieHeaderString();

```

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

### demo1

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

### demo2

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
