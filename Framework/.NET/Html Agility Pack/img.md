# img

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
