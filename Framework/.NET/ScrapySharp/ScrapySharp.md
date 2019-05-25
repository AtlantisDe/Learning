# ScrapySharp

- [ScrapySharp 3.0.0](https://www.nuget.org/packages/ScrapySharp)

## Official

- [rflechner / ScrapySharp / wiki / Home &mdash; Bitbucket](https://bitbucket.org/rflechner/scrapysharp/wiki/Home)
- [rflechner/ScrapySharp](https://github.com/rflechner/ScrapySharp)

## 安装方式一

```C#
Install-Package ScrapySharp -Version 3.0.0
```

## 使用文章

- [使用 ScrapySharp 快速从网页中采集数据 - 天方 - 博客园](https://www.cnblogs.com/TianFang/p/4804289.html)
- [HtmlAgilityPack 获取 Title 和 meta](https://html-agility-pack.net/zh-CN/knowledge-base/17606247/)
- [HtmlAgilityPack obtain Title and meta](https://stackoverflow.com/questions/17606247/htmlagilitypack-obtain-title-and-meta)

## 使用示例

```C#
// Html下载
var browser = new ScrapingBrowser();
var html = browser.DownloadString(new Uri("http://www.cnblogs.com/"));

// 解析的代码如下

var doc = new HtmlDocument();
doc.LoadHtml(html);

var docNode = doc.DocumentNode;

var nodes = docNode.CssSelect(".titlelnk");
foreach (var htmlNode in nodes)
{
    Console.WriteLine(htmlNode.InnerText);
}

// 其中关键代码只有docNode.CssSelect(".titlelnk")一句，非常简洁。另外，由于CSS方式比较灵活，如下方式也能获取到标题

    var nodes = docNode.CssSelect(".post_item_body > h3");
    var nodes = docNode.CssSelect("div#post_list").CssSelectAncestors("h3");

// 最后，列举一下常用的CSS查询，以方便后续的使用：

    html.CssSelect("div"); //all div elements
    html.CssSelect("div.content"); //all div elements with css class 'content'
    html.CssSelect("div.widget.monthlist"); //all div elements with the both css class
    html.CssSelect("#postPaging"); //all HTML elements with the id postPaging
    html.CssSelect("div#postPaging.testClass");     // all HTML elements with the id postPaging and css class testClass
    html.CssSelect("div.content > p.para");     //p elements who are direct children of div elements with css class 'content'
    html.CssSelect("input[type = text].login");     // textbox with css class login

var titleElement =
htmlDoc.DocumentNode
.Element("html")
.Element("head")
.Element("title");
if (titleElement != null)
{
    string title = titleElement.InnerText;
    Console.WriteLine("Titre: {0}", title);
}
else
{
    Console.WriteLine("no Title");
}

// 代码
//now json
var doc = new HtmlAgilityPack.HtmlDocument();
doc.LoadHtml(retString);

var articleItem = new Module.Aleseo.Collection.Main.Entity.Article.articleItem();

var title = doc.DocumentNode.Element("html").Element("head").Element("title");
var description = doc.DocumentNode.SelectSingleNode("//meta[@name='description']");
var keywords = doc.DocumentNode.SelectSingleNode("//meta[@name='keywords']");
var author = doc.DocumentNode.SelectSingleNode("//meta[@name='author']");
var content = doc.DocumentNode.SelectSingleNode("//*[@id='endText']");

if (title != null) { articleItem.title = title.Attributes["content"].Value; }
if (description != null) { articleItem.description = description.Attributes["content"].Value; }
if (keywords != null) { articleItem.keywords = keywords.Attributes["content"].Value; }
if (author != null) { articleItem.author = author.Attributes["content"].Value; }
if (content != null) { articleItem.content = author.InnerHtml; }


System.IO.File.WriteAllText(ccc, "", Encoding.UTF8);

```