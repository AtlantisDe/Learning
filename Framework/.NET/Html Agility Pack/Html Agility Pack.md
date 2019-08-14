# Html Agility Pack

- HAP
- [Online Example | Html Agility Pack](https://html-agility-pack.net/online-examples)
- [Html Agility pack | Html Agility Pack](https://html-agility-pack.net/)
- [zzzprojects/html-agility-pack](https://github.com/zzzprojects/html-agility-pack)
- [get text of all &lt;p&gt; in div htmlagilitypack](https://html-agility-pack.net/knowledge-base/11045186/get-text-of-all--p--in-div-htmlagilitypack)
- [HtmlAgilityPack 总结（一） - 城市里的最后一个农民 - CSDN 博客](https://blog.csdn.net/hongsejiaozhu/article/details/43274615)
- [【已解决】C#用 HtmlAgilityPack 执行 Html 解析时，发现 InnerText 中包含 javascript，要去除 Javascript](https://www.crifan.com/csharp_htmlagilitypack_html_parse_innertext_remove_javascript/)

## The same

- [C# HTML 解析器](http://www.360doc.com/content/16/0614/11/1355383_567644808.shtml)

## HTML Parser

### Load and parse HTML

- [Parser | Html Agility Pack](https://html-agility-pack.net/parser)
- From File
- From String
- From Web
- From Browser

- [From Browser | Html Agility Pack](https://html-agility-pack.net/from-browser)

```c#
// From File
var doc = new HtmlDocument();
doc.Load(filePath);

// From String
var doc = new HtmlDocument();
doc.LoadHtml(html);

// From Web
var url = "http://html-agility-pack.net/";
var web = new HtmlWeb();
var doc = web.Load(url);
```
