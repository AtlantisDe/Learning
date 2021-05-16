# HtmlDocument

- [HtmlDocument Class (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.htmldocument?view=netframework-4.8)
- [String to HtmlDocument](https://stackoverflow.com/questions/4935446/string-to-htmldocument/33443244)

## 引用

- Microsoft.mshtml
- C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\PublicAssemblies\Microsoft.mshtml.dll

### 代码 1

```c#
var doc = new mshtml.HTMLDocument();
var doc2 = (mshtml.IHTMLDocument2)doc;
doc2.write(Demo.Module.Collection.ReptileEngine.Scrapy.pstyle(itxt));
var codehtml = doc.documentElement.outerHTML;
```

### 代码 2

```c#
public System.Windows.Forms.HtmlDocument GetHtmlDocument(string html)
{
    WebBrowser browser = new WebBrowser();
    browser.ScriptErrorsSuppressed = true;
    browser.DocumentText = html;
    browser.Document.OpenNew(true);
    browser.Document.Write(html);
    browser.Refresh();
    return browser.Document;
}
```

### 代码 3

```c#
var doc = new mshtml.HTMLDocument();
var doc2 = (mshtml.IHTMLDocument2)doc;
doc2.write(newhtmlcode);
var codehtml = doc.documentElement.outerHTML;
var codeText = doc.documentElement.innerText;

var docTmp = new HtmlAgilityPack.HtmlDocument();
docTmp.LoadHtml(codehtml);
var body = docTmp.DocumentNode.SelectSingleNode("/html/body").InnerHtml;

```
