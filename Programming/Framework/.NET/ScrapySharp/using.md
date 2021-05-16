# using

## 代码

### 代码示例一

```c#
var browser = new  ScrapySharp.Network.ScrapingBrowser();
var homePage = browser.NavigateToPage(new Uri("http://www.bing.com/"));

var homePage = browser.NavigateToPage(new Uri(url), ScrapySharp.Network.HttpVerb.Get, "", null);
```
