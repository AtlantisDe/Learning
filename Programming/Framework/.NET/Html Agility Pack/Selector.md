# Selector

## 1. QuickStart

```c#

```

### 0. Attribute selectors

```c#
#id //*[@id="id"]
input[type="submit"] //input[@type="submit"]
.class //*[@class="class"]

```

### 1. Selector

```c#
// 注意标签名称区分到小写
// 枚举对象 SelectNodes 一定要判断 null 否则推荐 Descendants 方法
var divItems = doc.DocumentNode.SelectNodes(".//div");
var pItems = doc.DocumentNode.SelectNodes(".//p");
var liItems = doc.DocumentNode.SelectNodes(".//li");

var pItems0 = doc.DocumentNode.Descendants("p").ToList();
/*div 标签*/
if (divItems != null)
{

}

"//span[@class='" + ClassToGet + "']"
"//div[@class='demo']"
"//div[contains(@class, 'bd')]"
"(//font[@class='test'])[2]"
"//p[@class='otitle']"


//div[@class='demo']
//div[contains(@class, 'bd')]
// 注意这边获取的Index值默认是从第1个开始,不是第0个开始

var linkCanonical = doc.DocumentNode.Element("html")?.Element("head")?.SelectSingleNode(".//link[@rel='canonical']");
var metaOgImage = doc.DocumentNode.Element("html")?.Element("head")?.SelectSingleNode(".//meta[@property='og:image']");

var uri = new Uri(linkCanonical.GetAttributeValue("href", ""));
var uriAbsolutePath = uri.AbsolutePath;

var article = doc.DocumentNode?.SelectSingleNode("//article[1]");

var meta = doc.DocumentNode.SelectNodes("/html/head/meta[8]");
var imgItems = doc.DocumentNode.SelectNodes(".//mip-img");
var title = doc.DocumentNode.Element("html")?.Element("head")?.Element("title");
var metas = doc.DocumentNode.Element("html")?.Element("head")?.SelectNodes("meta");
var meta = doc.DocumentNode.Element("html")?.Element("head")?.SelectSingleNode(".//meta[@property='og:image']");
var meta = doc.DocumentNode.Element("html")?.Element("head")?.SelectSingleNode(".//meta[@name='keywords']");


var article = doc.DocumentNode?.SelectSingleNode(".//article[1]");
var remensky = doc.DocumentNode?.SelectSingleNode(".//div[@class='baidu google'][1]");
var tuijiansky = doc.DocumentNode?.SelectSingleNode(".//div[@class='baidu google'][2]");

var headLinks = doc.DocumentNode.Element("html")?.Element("head")?.SelectNodes("link");


var remensky = doc.DocumentNode?.SelectSingleNode(".//div[@class='baidu google']");

var pageinfo = doc.DocumentNode?.SelectSingleNode(".//span[@class='pageinfo']")

var head = htmlDocument.DocumentNode.SelectNodes("/html/head");
HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode("//*[@id=\"DIV_1\"]");


var head = htmlDocument.DocumentNode.SelectNodes("/html/head");
HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode("/html/head");
node.AppendChild(HtmlNode.CreateNode(string.Format("<script src=\"{0}\"></script>", js_src)));


var bodys = htmlDocument.DocumentNode.SelectNodes("/html/body");
var body = docTmp.DocumentNode.SelectSingleNode("/html/body").OuterHtml;


doc.LoadHtml(Contents);
var metas = doc.DocumentNode.Element("html")?.Element("head")?.SelectNodes("meta");
var meta = doc.DocumentNode.Element("html")?.Element("head")?.SelectSingleNode(".//meta[@property='og:image']");

var article = doc.DocumentNode?.SelectSingleNode(".//article[1]");
var articleImgItems = article.SelectNodes(".//mip-img");

var apple = doc.DocumentNode?.SelectSingleNode(".//div[@class='baidu baidu'][1]");
var appleItems = apple.SelectNodes(".//div[@class='baidu newlist']");

var remensky = doc.DocumentNode?.SelectSingleNode(".//div[@class='baidu google'][1]");
var remenskyItems = remensky.SelectNodes(".//li");

var tuijiansky = doc.DocumentNode?.SelectSingleNode(".//div[@class='baidu google'][2]");
var tuijianskyItems = tuijiansky.SelectNodes(".//li");

// 全部文档节点
var nodes = htmlNode.SelectNodes("//a[@href]");
// 当前节点
var nodes = htmlNode.SelectNodes(".//a[@href]");

var h1 = doc.DocumentNode?.SelectSingleNode(".//h1[1]");
if (h1 != null) { item.Title = h1.InnerText; }

var description = doc.DocumentNode.Element("html")?.Element("head")?.SelectSingleNode(".//meta[@name='description']");
if (description != null) { item.Description = description.GetAttributeValue("content", ""); }

var video1 = doc.GetElementbyId("video");
if (video1 != null) { item.VideoUrl = video1.GetAttributeValue("src", ""); item.VideoPoster = video1.GetAttributeValue("poster", ""); }

var show_cnt = doc.DocumentNode?.SelectSingleNode(".//div[@class='show_cnt']");
if (show_cnt != null) { item.Contents = show_cnt.InnerHtml; }


 /*div 标签*/
var divItems = doc.DocumentNode.SelectNodes(".//div");
var xpathItems = new List<string>();

for (int i = 0; i < divItems.Count; i++)
{
    var item = divItems[i];
    xpathItems.Add(item.XPath);
}

var xpathItemsText = xpathItems.ToStringWithNewline();

/*p 标签*/
var pItems = doc.DocumentNode.SelectNodes(".//p");
var xpathPItems = new List<string>();

for (int i = 0; i < pItems.Count; i++)
{
    var item = pItems[i];
    xpathPItems.Add(item.XPath);
}

var xpathPItemsText = xpathPItems.ToStringWithNewline();



var clasName = item.GetAttributeValue("class","");


var cNodes = item.Descendants("#text");


var innerTextItems1  = doc.DocumentNode.SelectNodes("//*[text()[contains(., '[当前文章正文]')]]");

```

## 2. AppendChild

- [XmlNode.PrependChild 方法 - herizai - 博客园](https://www.cnblogs.com/herizai/p/6970778.html)

### 1. 向对象内添加对象

- [jquery 追加元素的几种方法（append()、prepend()、after()、before()、insertAfter()、insertBefore()）](https://www.cnblogs.com/jpfss/p/9109273.html)

```c#
HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode("//*[@id=\"DIV_1\"]");
node.AppendChild(HtmlNode.CreateNode("<p>添加后效果</p>"));

// 添加前
<div id="DIV_1"></div>

// 添加后
<div id="DIV_1"><p>添加后效果</p></div>



Prepend Child
Prepend Children

HasChildNodes // 是否有子节点
item.HasChildNodes;

// Descendants 迭代
// PrependChild 前置子

// 判断是否有子节点
//var hashNode = item.HasChildNodes;

var htmlNode0 = HtmlAgilityPack.HtmlNode.CreateNode("<p>添加后效果</p>");



innerTextItem.PrependChild(htmlNode0);
// 添加前
<div id="DIV_1"><p>这里一个对象</p></div>

// 添加后
<div id="DIV_1"><p>添加后效果</p><p>这里一个对象</p></div>
```

```c#
<script>
    $(function(){
        //append(),在父级最后追加一个子元素
        $(".append").click(function(){
            $("#wrap").append("<p class='three'>我是子元素append</p>");
        });

        //appendTo(),将子元素追加到父级的最后
        $(".appendTo").click(function(){
            $("<p class='three'>我是子元素appendTo</p>").appendTo($("#wrap"));
        });

        //prepend(),在父级最前面追加一个子元素
        $(".prepend").click(function(){
            $("#wrap").prepend("<p class='three'>我是子元素prepend</p>");
        });

        //prependTo(),将子元素追加到父级的最前面
        $(".prependTo").click(function(){
            $("<p class='three'>我是子元素prependTo</p>").prependTo($("#wrap"));
        });

        //after(),在当前元素之后追加（是同级关系）
        $(".after").click(function(){
            $("#wrap").after("<p class='siblings'>我是同级元素after</p>");
        });

        //before(),在当前元素之前追加（是同级关系）
        $(".before").click(function(){
            $("#wrap").before("<p class='siblings'>我是同级元素before</p>");
        });

        //insertAfter(),将元素追加到指定对象的后面（是同级关系）
        $(".insertAfter").click(function(){
            $("<p class='three'>我是同级元素insertAfter</p>").insertAfter($("#wrap"));
        });
        //insertBefore(),将元素追加到指定对象的前面（是同级关系）
        $(".insertBefore").click(function(){
            $("<p class='three'>我是同级元素insertBefore</p>").insertBefore($("#wrap"));
        });
    });

    //appendChild(),在节点的最后追加子元素
    function appChild(){
            // 创建p节点
            var para=document.createElement("p");
            // 创建文本节点
            var node=document.createTextNode("我是子集appendChild新段落。");
            // 把文本节点添加到p节点里
            para.appendChild(node);

            // 查找div1
            var element=document.getElementById("wrap");
            // 把p节点添加到div1里
            element.appendChild(para);
    }
</script>
```

### 2. InsertAfter

- [insert-after | Html Agility Pack](https://html-agility-pack.net/insert-after)

```c#
var htmlDoc = new HtmlDocument();
htmlDoc.LoadHtml(html);

var htmlBody = htmlDoc.DocumentNode.SelectSingleNode("//body");

HtmlNode refChild = htmlBody.ChildNodes[1];

HtmlNode newChild = HtmlNode.CreateNode("<p> This is inserted after node paragraph</p>");

htmlBody.InsertAfter(newChild, refChild);

// 添加同级代码
if (html.Contains("[当前文章正文]") == true)
{
    var innerTextItems = doc.DocumentNode.SelectNodes("//*[text()[contains(., '[当前文章正文]')]]").ToList();
    if (innerTextItems.Count > 0)
    {
        var innerTextItem = innerTextItems[0];
        var htmlNode0 = HtmlAgilityPack.HtmlNode.CreateNode("<div class=\"tag-words-info\">添加同级代码</div>");
        innerTextItem.ParentNode.InsertAfter(htmlNode0, innerTextItem);
    }
}
```
