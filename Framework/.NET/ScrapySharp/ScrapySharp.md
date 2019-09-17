# ScrapySharp

- 这个只是一个简单的示例，实际上 ScrapingBrowser 的功能还是非常全面的，常见的功能如：Charset 探测，AutoRedirect、Cache、 Proxy、Cookie、UserAgent、表单提交等都支持得非常好，用它来获取网页比 HttClient 要方便很多。

- [ScrapySharp 3.0.0](https://www.nuget.org/packages/ScrapySharp)
- [Scrapy 入门教程 &mdash; Scrapy 0.24.6 文档](https://scrapy-chs.readthedocs.io/zh_CN/0.24/intro/tutorial.html)
- [使用 ScrapySharp 快速从网页中采集数据 - 天方 - 博客园](https://www.cnblogs.com/TianFang/p/4804289.html)

## Official

- 主页
- [Html Agility pack | Html Agility Pack](https://html-agility-pack.net/)
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

### 示例代码 1

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

### 示例代码 2

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

var articleItem = new Module.DemoTest.Collection.Main.Entity.Article.articleItem();

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

## 其它常用示例

### 移除元素

- [remove html node from htmldocument :HTMLAgilityPack](https://stackoverflow.com/questions/12106280/remove-html-node-from-htmldocument-htmlagilitypack)

```C#
var emptyElements = doc.DocumentNode
    .Descendants("a")
    .Where(x => x.Attributes["src"] == null || x.Attributes["src"].Value == String.Empty)
    .ToList();

emptyElements.ForEach(node => {
    if (node != null){ node.Remove();}
});

```

- 错误移除方法

```c#
foreach (var item in lis)
{
item.Remove();
}
```

- 正确移除方法

```c#
foreach (var item in lis)
{
item.Remove();
}
```

### 使用 classname 选择一个元素

- [C# html agility pack get elements by class name](https://html-agility-pack.net/knowledge-base/36711680/csharp-html-agility-pack-get-elements-by-class-name)

```c#
resultContent.DocumentNode.SelectNodes("//div[contains(@class, 'hello')]"))
```

### 通过标签选取元素

- [GetElementsByTagName in Htmlagilitypack](https://stackoverflow.com/questions/10260255/getelementsbytagname-in-htmlagilitypack)

```C#
var inputs = doc.DocumentNode.Descendants("input")
.Where(n => n.Attributes["name"]!=null && n.Attributes["name"].Value == "sometext")
.ToArray();
```

### 删除元素

```C#
 //delete
var f_center = doc.DocumentNode.SelectSingleNode("//p[contains(@class, 'f_center')]");
var at_item = doc.DocumentNode.SelectSingleNode("//div[contains(@class, 'at_item right_ad_item')]");
var epsourcecDGray = doc.DocumentNode.SelectSingleNode("//div[contains(@class, 'ep-source cDGray')]");

//var img = doc.DocumentNode.SelectSingleNode("//div[contains(@class, 'ep-source cDGray')]");

var imgthumbnails = doc.DocumentNode.Descendants("img")
        .Where(n => n.Attributes["src"] != null && n.Attributes["src"].Value.Contains("thumbnail=550x0"))
        .ToArray();

if (imgthumbnails.Count() > 0) { imgthumbnails[0].Remove(); }


if (f_center != null) { f_center.Remove(); }
if (at_item != null) { at_item.Remove(); }
if (epsourcecDGray != null) { epsourcecDGray.Remove(); }
```

### 添加一个元素 Append Child

-[Append Child | Html Agility Pack](https://html-agility-pack.net/append-child)

```C#
 //delete
var htmlDoc = new HtmlDocument();
htmlDoc.LoadHtml(html);

var htmlBody = htmlDoc.DocumentNode.SelectSingleNode("//body");

HtmlNode h2Node = HtmlNode.CreateNode("<h2> This is h2 heading</h2>");

htmlBody.AppendChild(h2Node);
```
