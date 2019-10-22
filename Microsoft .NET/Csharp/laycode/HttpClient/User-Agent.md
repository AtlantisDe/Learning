# User-Agent

- [How do I set a default User Agent on an HttpClient?](https://stackoverflow.com/questions/44076962/how-do-i-set-a-default-user-agent-on-an-httpclient)

```c#
HttpClient _client = new HttpClient();
_client.DefaultRequestHeaders.Add("User-Agent", "C# App");
 httpclient.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36");
```
