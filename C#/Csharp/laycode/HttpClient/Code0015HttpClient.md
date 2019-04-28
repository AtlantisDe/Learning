# C# HttpClient

- [HttpClient Class (System.Net.Http)](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient?view=netframework-4.7.2)
- [C#中 HttpClient 使用注意：预热与长连接](https://www.cnblogs.com/dudu/p/csharp-httpclient-attention.html)
- [C# System.Net.Http.HttpClient 使用说明](https://www.cnblogs.com/lh173110/p/7799698.html)
- [C#使用 HttpClient 进行 GET&POST](https://blog.csdn.net/wangyi1e/article/details/29204987?utm_source=blogxgwz3)
- [C# 中使用 System.Net.Http.HttpClient 模拟登录博客园 (GET/POST)](https://www.cnblogs.com/amosli/p/3918538.html)
- [C# 解决“请求被中止: 未能创建 SSL/TLS 安全通道”的问题](https://www.cnblogs.com/xuliangxing/p/8384821.html)
- [C# HttpClient 高并发时怎么解决 TCP 连接数过多](https://q.cnblogs.com/q/90727)

## 请求被中止: 未能创建 SSL/TLS 安全通道

```c#
System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12; //加上这一句
```

## GET Demo

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
                urlitem.StatusCode = rst.StatusCode;
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

## GET Demo1

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

## POST Demo1

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

## Demo ReadAsStringAsync

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
