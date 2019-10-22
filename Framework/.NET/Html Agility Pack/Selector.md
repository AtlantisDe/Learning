# Selector

## get

### by class

```c#
"//span[@class='" + ClassToGet + "']"
"//div[@class='demo']"
"//div[contains(@class, 'bd')]"
"(//font[@class='test'])[2]"
"//p[@class='otitle']"



//div[@class='demo']
//div[contains(@class, 'bd')]

var head = htmlDocument.DocumentNode.SelectNodes("/html/head");
HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode("//*[@id=\"DIV_1\"]");


var head = htmlDocument.DocumentNode.SelectNodes("/html/head");
HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode("/html/head");
node.AppendChild(HtmlNode.CreateNode(string.Format("<script src=\"{0}\"></script>", js_src)));


var bodys = htmlDocument.DocumentNode.SelectNodes("/html/body");
var body = docTmp.DocumentNode.SelectSingleNode("/html/body").OuterHtml;
```
