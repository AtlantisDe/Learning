# LinkFinder

- [https://www.dotnetperls.com/scraping-html](https://www.dotnetperls.com/scraping-html)

## 1. 使用

```c#
foreach (LinkItem i in LinkFinder.Find(s))
{
    Debug.WriteLine(i);
}
```

## 2. program that scrapes with Regex

```c#

```

## 3. Other

```c#
 //var items = LinkFinder.FindAbsoluteUrl(html);

var html = GoogleEmpire.Net.Collection.Engine.Http.ResHtml(new Uri($"https://cn.bing.com/search?q={aa}"));

var items = HtmlAgilityPackCommon.Helper.ParseIsAbsoluteUriLinks(html);

```
