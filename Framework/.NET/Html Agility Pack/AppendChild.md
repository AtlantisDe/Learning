# AppendChild

## 代码

### 1. 向对象内添加对象

```c#
HtmlNode node = htmlDocument.DocumentNode.SelectSingleNode("//*[@id=\"DIV_1\"]");
node.AppendChild(HtmlNode.CreateNode("<p>添加后效果</p>"));

// 添加前
<div id="DIV_1"></div>

// 添加后
<div id="DIV_1"><p>添加后效果</p></div>
```
