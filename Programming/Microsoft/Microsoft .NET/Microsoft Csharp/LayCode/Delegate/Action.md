# Action

```c#
Action<T> Delegate
```

## 常用

```c#
MemoryCacheTimer(this string key, int seconds, Action action){action();}

key.MemoryCacheTimer(3, delegate{ });

var rst = key.MemoryCacheTimer(3, delegate { Console.WriteLine(DateTime.Now.Format1()); });




client.MessageReceived.Subscribe(msg =>
{
    Console.WriteLine($"Message received: {msg}");
});

```
