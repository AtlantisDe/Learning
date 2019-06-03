# C# Task

## Task 异步获取返回值如 String 类型例子

```c#
Task<string> ReadAsStringAsync()

var contxt = rst.Content;
var aaa = contxt.ReadAsStringAsync();
var ccc = aaa.Result;
```

## 可等待 超时

```c#
using (var client = new Websocket.Client.WebsocketClient(url))
{
    client.ReconnectTimeoutMs = (int)TimeSpan.FromSeconds(30).TotalMilliseconds;
    var c = client.Start();
    c.Wait(5000);
    Task.Run(() => client.Send("{ message }"));
}
```
