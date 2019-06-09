# HtmlDocument

- [HtmlAgilityPack: Get whole HTML document as string](https://stackoverflow.com/questions/5183385/htmlagilitypack-get-whole-html-document-as-string)

```c#
HtmlDocument doc = new HtmlDocument();
// call one of the doc.LoadXXX() functions
Console.WriteLine(doc.DocumentNode.OuterHtml);
```

```c#
string result = string.Empty;

WebRequest req = WebRequest.Create(Url);
WebResponse res= wrq.GetResponse();
StreamReader reader = new StreamReader(res.GetResponseStream());
result = reader.ReadToEnd();
reader.Close();
res.Close();
```
