# ISchemeHandlerFactory

- [cefsharp/CefSharp](https://github.com/cefsharp/CefSharp/blob/cefsharp/47/CefSharp.Example/CefSharpSchemeHandlerFactory.cs#L17)
- [CefSharp custom SchemeHandler](https://stackoverflow.com/questions/35965912/cefsharp-custom-schemehandler)

## 常用代码

```c#
public class CefSharpSchemeHandlerFactory : ISchemeHandlerFactory
{
    public const string SchemeName = "custom";
    public const string SchemeNameTest = "test";

    public IResourceHandler Create(IBrowser browser, IFrame frame, string schemeName, IRequest request)
    {
        if (schemeName == SchemeName && request.Url.EndsWith("CefSharp.Core.xml", System.StringComparison.OrdinalIgnoreCase))
        {
            //Display the debug.log file in the browser
            return ResourceHandler.FromFileName("CefSharp.Core.xml", ".xml");
        }
        return new CefSharpSchemeHandler();
    }
}
```
