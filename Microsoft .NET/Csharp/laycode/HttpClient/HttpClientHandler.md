# HttpClientHandler

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

## 知识点

### 0. 常用

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
