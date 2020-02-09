# User-Agent

- [How do I set a default User Agent on an HttpClient?](https://stackoverflow.com/questions/44076962/how-do-i-set-a-default-user-agent-on-an-httpclient)
- [国内主流搜索引擎 UA 和对应的蜘蛛 IP 段 - 放放 SEO 博客](http://www.link356.com/seoshoucang/282.html)

## 常用

### 0. List of User Agents

- [Browse our database of 23,404,126 User Agents](https://developers.whatismybrowser.com/useragents/explore/)
- [UserAgentString.com - API](http://www.useragentstring.com/pages/api.php)
- [What is Baiduspider?](https://chineseseoshifu.com/blog/what-is-baiduspider.html)
- [tamimibrahim17/List-of-user-agents](https://github.com/tamimibrahim17/List-of-user-agents)
- [List of User-Agents (Spiders, Robots, Browser)](http://www.user-agents.org/)

### 1. C#重使用 UA

```c#
HttpClient _client = new HttpClient();
_client.DefaultRequestHeaders.Add("User-Agent", "C# App");
 httpclient.DefaultRequestHeaders.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36");


Baiduspider2.0 MIP
Mozilla/5.0+(compatible;+Baiduspider/2.0;++http://www.baidu.com/search/spider.html)

Google
Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)

360搜索
Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0);

// 重点：百度内容抓取蜘蛛UA：

百度PC蜘蛛UA：
Mozilla/5.0(compatible;Baiduspider/2.0;+http://www.baidu.com/search/spider.html）

百度移动蜘蛛UA：
Mozilla/5.0(Linux;u;Android 4.2.2;zh-cn;)AppleWebKit/534.46(KHTML,likeGecko)Version/5.1 Mobile Safari/10600.6.3(compatible;Baiduspider/2.0;+http://www.baidu.com/search/spider.html)

// 次重点：百度能执行JS、CSS高级爬虫UA

百度PC渲染抓取UA
Mozilla/5.0(compatible;Baiduspider-render/2.0;+http://www.baidu.com/search/spider.html)

百度移动渲染蜘蛛UA：
Mozilla/5.0(iPhone;CPU iPhone OS 9_1 likeMac OS X)AppleWebKit/601.1.46(KHTML,like Gecko)Version/9.0 Mobile/13B143Safari/601.1(compatible;Baiduspider-render/2.0;+http://www.baidu.com/search/spider.html)

百度图片蜘蛛：
Baiduspider-image+(+http://www.baidu.com/search/spider.htm)



百度常用的IP段
站内收录正常最常见的百度蜘蛛IP段：220.181.108.*

代表百度蜘蛛IP来访准备抓取你东西
220.181.7.*
123.125.66.*

抓取内页收录的，权重较低，爬过此段的内页文章暂时被收录但不放出来，因不是原创或采集文章：123.125.71.*

其他认证百度蜘蛛（有待更多数据分析）
159.226.50.*
180.76.5.*
180.76.5.87
220.181.158.107

巡逻蜘蛛：210.72.225.*

百度高级爬虫UA匹配的IP段：111.206.221.*（疑似专门执行JS里链接爬虫）

这个ip段出现在新站及站点有不正常现象后。
183.91.40.144
203.208.60.*
```
