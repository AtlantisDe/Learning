# HttpClient.StreamContent

- [C# HttpClient StreamContent 用法*C#*淮阴侯的博客-CSDN 博客](https://blog.csdn.net/u013710468/article/details/103787409)
- [如何使用 HttpContent? - 问答 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/ask/96160)

## 常用

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
