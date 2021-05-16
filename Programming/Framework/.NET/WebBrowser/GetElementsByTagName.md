# GetElementsByTagName

- [HtmlDocument.GetElementsByTagName(String) Method (System.Windows.Forms)](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.htmldocument.getelementsbytagname?view=netframework-4.8)

## 代码

```c#
private void DisplayMetaDescription()
{
    if (webBrowser1.Document != null)
    {
        HtmlElementCollection elems = webBrowser1.Document.GetElementsByTagName("META");
        foreach (HtmlElement elem in elems)
        {
            String nameStr = elem.GetAttribute("name");
            if (nameStr != null && nameStr.Length != 0)
            {
                String contentStr = elem.GetAttribute("content");
                MessageBox.Show("Document: " + webBrowser1.Url.ToString() + "\nDescription: " + contentStr);
            }
        }
    }
}
```
