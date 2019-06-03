# img

## wiki

- [How can I use HTML Agility Pack to retrieve all the images from a website?](https://stackoverflow.com/questions/2113924/how-can-i-use-html-agility-pack-to-retrieve-all-the-images-from-a-website)

## 常用代码

### 代码 1

```C#
var document = new HtmlWeb().Load(url);
var urls = document.DocumentNode.Descendants("img")
                                .Select(e => e.GetAttributeValue("src", null))
                                .Where(s => !String.IsNullOrEmpty(s));
```

### 代码 2

```c#
//begin
var docimg = new HtmlAgilityPack.HtmlDocument();
docimg.LoadHtml(articleItem.content);

var imgs = docimg.DocumentNode.Descendants("img")
                .Select(e => e.GetAttributeValue("src", null))
                .Where(s => !String.IsNullOrEmpty(s));

if (imgs.Count() > 0)
{

}
//end
```
