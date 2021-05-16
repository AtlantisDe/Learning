# await

- [await operator - C# reference](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/await)
- 尽量用 await 不要用 task.wait()

```c#
//  再来看一下 await 关键字。await 必须用来修饰 Task 或 Task<TResult>，而且只能出现在已经用 async 关键字修饰的异步方法中。
async void go_demo()
{
    await Task<bool>.Run(() =>
        {
        });
}
```

## async/await 实际应用

```c#
static void Main(string[] args)
{
    Console.WriteLine("开始获取博客园首页字符数量");
    Task<int> task1 = CountCharsAsync("http://www.cnblogs.com");
    Console.WriteLine("开始获取百度首页字符数量");
    Task<int> task2 = CountCharsAsync("http://www.baidu.com");

    Console.WriteLine("Main方法中做其他事情");

    Console.WriteLine("博客园:" + task1.Result);
    Console.WriteLine("百度:" + task2.Result);
}

static async Task<int> CountCharsAsync(string url)
{
    WebClient wc = new WebClient();
    string result = await wc.DownloadStringTaskAsync(new Uri(url));
    return result.Length;
}
```
