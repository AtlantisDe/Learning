# PuppeteerSharp

- [PuppeteerSharp: 更友好的 Headless Chrome C# API - 张善友 - 博客园](https://www.cnblogs.com/shanyou/p/10500049.html)
- [kblok/puppeteer-sharp](https://github.com/kblok/puppeteer-sharp)
- [Namespace PuppeteerSharp](https://www.puppeteersharp.com/api/PuppeteerSharp.html)
- [Puppeteer-无头浏览器简介](https://zhuanlan.zhihu.com/p/40103840)

## 常用

- [C# 整合 Headless Chrome 的好工具 - Puppeteer Sharp-黑暗執行緒](https://blog.darkthread.net/blog/puppeteer-sharp/)

```c#
PuppeteerSharp

Puppeteer Sharp是官方Node.JS Puppeteer API的.NET 移植

由于Puppeteer-Sharp是NetStandard 2.0库，因此最低平台版本是.NET Framework 4.6.1和.NET Core 2.0
支持WebSocket库的最低Windows版本是Windows 8和Windows Server 2012，具体参见 https://docs.microsoft.com/en-us/dotnet/api/system.net.websockets?redirectedfrom=MSDN&view=netframework-4.6.1
这个项目很活跃，大家可以通过作者博客上获取更新记录 http://www.hardkoded.com/
```

### 1. 下载

#### 1. 版本:674921 COPY String

```c#
Downloaded true bool
ExecutablePath " D:\\PuppeteerSharpDemo1\\bin\\Debug\\.local-chromium\\Win64-674921\\chrome-win\\chrome.exe" string
FolderPath " D:\\PuppeteerSharpDemo1\\bin\\Debug\\.local-chromium\\Win64-674921" string
Local true bool
Platform Win64 PuppeteerSharp.Platform
Revision 674921 int
Url "https://storage.googleapis.com/chromium-browser-snapshots/Win_x64/674921/chrome-win.zip" string


```

```c#
var Down =   new PuppeteerSharp.BrowserFetcher().DownloadAsync(PuppeteerSharp.BrowserFetcher.DefaultRevision);
var Result = Down.Result;

var Down =   new PuppeteerSharp.BrowserFetcher().DownloadAsync(674921);
var Result = Down.Result;

go_chrome_win_DownloadAsync_Demo();
bool go_chrome_win_DownloadAsync_Demo()
{
    var Down = new PuppeteerSharp.BrowserFetcher().DownloadAsync(PuppeteerSharp.BrowserFetcher.DefaultRevision);
    var Result = Down.Result;

    return true;
}



go_InjectHTML_Demo();
bool go_InjectHTML_Demo()
{
    // Arrange
    var options = new PuppeteerSharp.LaunchOptions
    {
        Headless = true,
        IgnoreHTTPSErrors = true,
        Devtools = false
    };
    var browserTask = PuppeteerSharp.Puppeteer.LaunchAsync(options);
    var browser = browserTask.Result;

    Console.WriteLine(string.Format("options.Headless {0}", options.Headless));

    using (var page = browser.NewPageAsync())
    {
        var go = page.Result.GoToAsync("https://news.ifeng.com/c/7ptxejHLvb0").Result;
        //var html = page.Result.GetContentAsync().Result;
        var html = page.Result.GetContentAsync().Result;
        //var html = page.Result.MainFrame.GetContentAsync
    }

    browser.CloseAsync().Wait();
    return true;
}



```

#### 2. reuse Chrome from a custom location

```c#
// Use BrowserFetcherOptions to specify the full path for where to download Chrome.
var browserFetcherOptions = new BrowserFetcherOptions { Path = downloadPath };
var browserFetcher = new BrowserFetcher(browserFetcherOptions);
await browserFetcher.DownloadAsync(BrowserFetcher.DefaultRevision);

// Use Puppeteer.LaunchAsync() with LaunchOptions with the LaunchOptions.ExecutablePath property set to the fully qualified path to the Chrome executable.
var options = new LaunchOptions { Headless = true, ExecutablePath = executablePath };

using (var browser = await Puppeteer.LaunchAsync(options))
using (var page = await browser.NewPageAsync())
{
    // use page
}

```
