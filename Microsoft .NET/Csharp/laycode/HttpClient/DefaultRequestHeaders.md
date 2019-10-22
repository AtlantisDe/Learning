# DefaultRequestHeaders

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
