# C# Task

## Task 异步获取返回值如 String 类型例子

```c#
Task<string> ReadAsStringAsync()

var contxt = rst.Content;
var aaa = contxt.ReadAsStringAsync();
var ccc = aaa.Result;


var Down = new BrowserFetcher().DownloadAsync(BrowserFetcher.DefaultRevision);
var Result = Down.Result;

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

## Task For 并发

```c#
for (int i = 0; i < list.Count; i++)
{

    Task<bool>.Run(() =>
    {
        go_exe_WaitForExit();
        return true;
    });

}
```
