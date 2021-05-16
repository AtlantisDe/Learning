# Html Agility Pack

- HAP
- [Online Example | Html Agility Pack](https://html-agility-pack.net/online-examples)
- [Html Agility pack | Html Agility Pack](https://html-agility-pack.net/)
- [zzzprojects/html-agility-pack](https://github.com/zzzprojects/html-agility-pack)
- [get text of all &lt;p&gt; in div htmlagilitypack](https://html-agility-pack.net/knowledge-base/11045186/get-text-of-all--p--in-div-htmlagilitypack)
- [HtmlAgilityPack 总结（一） - 城市里的最后一个农民 - CSDN 博客](https://blog.csdn.net/hongsejiaozhu/article/details/43274615)
- [【已解决】C#用 HtmlAgilityPack 执行 Html 解析时，发现 InnerText 中包含 javascript，要去除 Javascript](https://www.crifan.com/csharp_htmlagilitypack_html_parse_innertext_remove_javascript/)

## 0. Install

- [HtmlAgilityPack 1.11.24](https://www.nuget.org/packages/HtmlAgilityPack/)

```c#
HtmlAgilityPack
Install-Package HtmlAgilityPack -Version 1.11.24
```

## 0. Search

- [knowledge Base | Html Agility Pack](https://html-agility-pack.net/knowledge-base)

## 1. The same

- [C# HTML 解析器](http://www.360doc.com/content/16/0614/11/1355383_567644808.shtml)

## 2. HTML Parser

### Load and parse HTML

- [Parser | Html Agility Pack](https://html-agility-pack.net/parser)
- From File
- From String
- From Web
- From Browser

- [From Browser | Html Agility Pack](https://html-agility-pack.net/from-browser)

```c#
// From File
var doc = new HtmlAgilityPack.HtmlDocument();
doc.Load(filePath);

// From String
var doc = new HtmlAgilityPack.HtmlDocument();
doc.LoadHtml(html);

var doc = new HtmlAgilityPack.HtmlDocument();
doc.LoadHtml(html);

// From Web
var url = "http://html-agility-pack.net/";
var web = new HtmlWeb();
var doc = web.Load(url);


var webClient = new System.Net.WebClient();
byte[] data = webClient.DownloadData(urlToCrawl);
string download = Encoding.ASCII.GetString(data);

var html = doc.DocumentNode.OuterHtml;

if (html.IsNullOrEmpty() == false)
{

}

var html0 = doc.DocumentNode.OuterHtml;

//: Select from the document root
.//: Select from the current node
```

## 3. 常用

### 1. 链接

```c#
var linkTags = doc.DocumentNode.Descendants("link");
var linkedPages = doc.DocumentNode.Descendants("a")
                                    .Select(a => a.GetAttributeValue("href", null))
                                    .Where(u => !String.IsNullOrEmpty(u));

```

### 2. Head

```c#
// 实测区分大小写
var titleElement0 = doc.DocumentNode.Element("html")?.Element("HEAD")?.Element("TITLE");

var titleElement1 = doc.DocumentNode.Element("html").Element("head").Element("title");
var titleElement2 = doc.DocumentNode.SelectSingleNode("//head/title");
var titleElement3 = doc.DocumentNode.SelectSingleNode("//HEAD/TITLE");
var titleElement4 = doc.DocumentNode.SelectSingleNode("//HEAD/title");
var titleElement5 = doc.DocumentNode.SelectSingleNode("//head/TiTLE");
var titleElement0 = doc.DocumentNode.Element("html").Element("HEAD").Element("TITLE");
```

### 2. meta

```c#

// 实测区分大小写
var list = doc.DocumentNode.SelectNodes("//META");


HtmlAgilityPack.HtmlNode title;
HtmlAgilityPack.HtmlNode keywords;

title = doc.DocumentNode.SelectNodes("//meta[@name='title']")

var list = doc.DocumentNode.SelectNodes("//meta");
foreach (var node in list)
{
    string content = node.GetAttributeValue("content", "");
}


string name = node.GetAttributeValue("naMe", "");
if (name.IsNullOrEmpty() == false)
{
    if (name.ToLower()== "keywords".ToLower())
    {
        node.SetAttributeValue("content", "123456");
    }
}



var list = doc.DocumentNode.SelectNodes("//meta");
HtmlAgilityPack.HtmlNode title = null;
HtmlAgilityPack.HtmlNode keywords = null;
foreach (var node in list)
{
    string name = node.GetAttributeValue("naMe", "");
    if (name.IsNullOrEmpty() == false)
    {
        name = name.ToLower();

        switch (name)
        {
            case "keywords": keywords = node; break;
            case "title": title = node; break;
        }
    }
}
```

## 4. HtmlNode

- [Using htmlagility pack to replace src values](https://stackoverflow.com/questions/11402949/using-htmlagility-pack-to-replace-src-values)

```c#
HtmlAgilityPack.HtmlNode

var linkTags = doc.DocumentNode.Descendants("link");
var images = doc.DocumentNode.Descendants("img").ToList();

// Descendants 迭代
// PrependChild 前置子

// SelectNodes 匹配不到返回的应该是Null
var imgItems = head.SelectNodes("//img");
if (imgItems.IsNullOrEmpty() == false)
{
    foreach (var item in imgItems)
    {
        item.Remove();
    }
}


When you have already selected a node, you must use head.SelectNodes(".//img"); (see the added "."), to tell the new search should start from the current node.
To make it clear, when a node is already selected:

//: Select from the document root
.//: Select from the current node

```

### 1. retrieve all the images

```c#
HtmlAgilityPack.HtmlNode htmlNode;

HTMLAgilityPack.HTMLNode.GetAttributeValue("href", "")
```

### 2. set-attribute-value 替换一个值

- [set-attribute-value | Html Agility Pack](https://html-agility-pack.net/set-attribute-value)
- [Z.Example.SetAttributeValue | C# Online Compiler | .NET Fiddle](https://dotnetfiddle.net/WwLgeW)

```c#
var htmlDoc = new HtmlDocument();
htmlDoc.Load(@"E:\Libs\HtmlAgilityPack.1.4.0\htmldoc.html");

foreach(HtmlNode node in htmlDoc.DocumentNode.SelectNodes("//img[@src and (@width or @height)]"))
{
    var src = node.Attributes["src"].Value.Split('?');

    var width = node.Attributes["width"].Value.Replace("px", "");

    var height = node.Attributes["height"].Value.Replace("px", "");

    node.SetAttributeValue("src",
                            src[0] +
                            string.Format("?width={0}&height{1}", width, height));
}
```

### 3. replace node

- [[SOLVED] - HtmlAgilityPack replace node](https://html-agility-pack.net/knowledge-base/6782500/htmlagilitypack-replace-node)
- [HtmlAgilityPack to replacechild ,why it does not work?](https://html-agility-pack.net/knowledge-base/21013576/htmlagilitypack-to-replacechild--why-it-does-not-work-)

```c#
foreach (var item in images)
{
    var newNodesStr = TagEngineMipToMipImg(item, true);
    var newHtmlNode = HtmlAgilityPack.HtmlNode.CreateNode(newNodesStr);
    item.ParentNode.ReplaceChild(newHtmlNode, item);
}
```

### 4. string to node

```c#
var newHtmlNode = HtmlAgilityPack.HtmlNode.CreateNode(newNodesStr);
item.ParentNode.ReplaceChild(newHtmlNode, item);

```

### 5. delete Continuous picture

```c#

var imgItems = doc.DocumentNode.SelectNodes("//img");
var imgItesDel = new List<HtmlAgilityPack.HtmlNode>();
if (imgItems.IsNullOrEmpty() == false)
{
    for (int i = 0; i < imgItems.Count; i++)
    {
        if (i == 0) { continue; }
        var img = imgItems[i];
        if ((i + 1) <= imgItems.Count - 1)
        {
            var jiangeText = ""; HtmlAgilityPack.HtmlNode img1 = img;

            while (img1 != imgItems[i + 1])
            {
                var next = img1.NextSibling;
                if (next.IsNullOrEmpty()) { break; }
                jiangeText += next.InnerText;
                img1 = img1.NextSibling;
                if (jiangeText.Length < 50)
                {
                    if (img1 == imgItems[i + 1]) { imgItesDel.Add(img1); }
                }
            }
        }
    }
}
foreach (var item in imgItesDel) { item.Remove(); }
var html0 = doc.DocumentNode.OuterHtml;

```
