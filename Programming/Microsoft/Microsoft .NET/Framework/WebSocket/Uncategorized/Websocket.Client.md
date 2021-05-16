# Websocket.Client

- [Websocket.Client 4.3.21](https://www.nuget.org/packages/Websocket.Client)
- [Getting Title at 15:06](https://github.com/Marfusios/websocket-client)

```c#

```

## 0. Installation

```c#
Install-Package Websocket.Client -Version 4.3.21
```

## 1. Usage

```c#
// 匿名方法
client.ReconnectionHappened.Subscribe(info =>
{
    Console.WriteLine(info.Type);
});

// 常用DEMO
var exitEvent = new System.Threading.ManualResetEvent(false);
using (var client = new Websocket.Client.WebsocketClient(new Uri("ws://xxx")))
{
    client.ReconnectTimeout = TimeSpan.FromSeconds(30);
    client.ReconnectionHappened.Subscribe(info =>
        Console.WriteLine(info.Type)
        );

    client.MessageReceived.Subscribe(msg =>
        Console.WriteLine($"Message received: {msg}")
    );
    client.Start();

    Task.Run(() => client.Send("touch?TransKey={\"callback\":\"BackNewConnect\"}&Entry=|touch"));
    Task.Run(() => client.Send(""));


    exitEvent.WaitOne();
}

// 官方Demo
var exitEvent = new ManualResetEvent(false);
var url = new Uri("wss://xxx");

using (var client = new WebsocketClient(url))
{
    client.ReconnectTimeout = TimeSpan.FromSeconds(30);
    client.ReconnectionHappened.Subscribe(info =>
        Log.Information($"Reconnection happened, type: {info.Type}"));

    client.MessageReceived.Subscribe(msg => Log.Information($"Message received: {msg}"));
    client.Start();

    Task.Run(() => client.Send("{ message }"));

    exitEvent.WaitOne();
}
```
