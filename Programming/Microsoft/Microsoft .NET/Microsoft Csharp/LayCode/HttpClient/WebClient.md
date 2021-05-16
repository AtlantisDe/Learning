# WebClient

- [WebClient Class (System.Net)](https://docs.microsoft.com/zh-cn/dotnet/api/system.net.webclient?view=netcore-3.1)
- [C#多线程环境下调用 HttpWebRequest 并发连接限制 - Anthony.Zhao - 博客园](https://www.cnblogs.com/thaughtZhao/p/5524272.html)

## 常用

```c#
// 很多文章说用异步方式访问 HttpWebRequest 可以提高并发性能，但我测试下来，如果不修改这个默认并发连接数，同步或异步方式访问性能都很不好。
// 调整这个默认并发连接限制的方法很简单
// 只要在程序中设置：

System.Net.ServicePointManager.DefaultConnectionLimit = 512;

// 这个值最好不要超过1024。

var webClient = new System.Net.WebClient();
byte[] data = webClient.DownloadData(urlToCrawl);
string download = Encoding.ASCII.GetString(data);


```
