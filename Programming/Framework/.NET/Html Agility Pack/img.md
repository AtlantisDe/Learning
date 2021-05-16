# img

- [[SOLVED] - How can I use HTML Agility Pack to retrieve all the images from a website?](https://html-agility-pack.net/knowledge-base/2113924/how-can-i-use-html-agility-pack-to-retrieve-all-the-images-from-a-website-)

```c#
var imgitem = new imgItem();

imgitem.url = getelementvalue(img, "src");
imgitem.alt = getelementvalue(img, "alt");
if (imgitem.url.IsNullOrEmpty() == false) { imgItems.Add(imgitem); }


public static string getelementvalue(HtmlNode htmlNode, string key)
{
    var val = "";
    if (htmlNode != null)
    {
        var htmlAttributes = htmlNode.Attributes[key];
        if (htmlAttributes != null) { return htmlAttributes.Value; }
    }
    return val;
}
```

## 常用

### 1. retrieve all the images

- [[SOLVED] - How can I use HTML Agility Pack to retrieve all the images from a website?](https://html-agility-pack.net/knowledge-base/2113924/how-can-i-use-html-agility-pack-to-retrieve-all-the-images-from-a-website-)

```c#

var images = doc.DocumentNode.Descendants("img").ToList();
var img = images[0];
var src = img.GetAttributeValue("src", null);
var alt = img.GetAttributeValue("alt", null);
var xpath = img.XPath;

/*效果等效*/
img.SetAttributeValue("src", "http://www.google.com/1.gif");

/*效果等效*/
doc.DocumentNode.SelectSingleNode(xpath).SetAttributeValue("src", "http://www.google.com/1.gif");

/*修改后*/

var html0 = doc.DocumentNode.OuterHtml;



var document = new HtmlWeb().Load(url);
var urls = document.DocumentNode.Descendants("img")
.Select(e => e.GetAttributeValue("src", null))
.Where(s => !String.IsNullOrEmpty(s));
```
