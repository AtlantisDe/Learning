# ResourceHandler

- [CefSharp custom SchemeHandler](https://stackoverflow.com/questions/35965912/cefsharp-custom-schemehandler)

## 常用代码

### 1. 代码

```c#
public class CefSharpSchemeHandlerFactory : ISchemeHandlerFactory
{
    public const string SchemeName = "custom";

    public IResourceHandler Create(IBrowser browser, IFrame frame, string schemeName, IRequest request)
    {
        return ResourceHandler.FromString("123456",".html");

    }
}

settings.RegisterScheme(new CefCustomScheme
{
    SchemeName = CefSharpSchemeHandlerFactory.SchemeName,
    SchemeHandlerFactory = new CefSharpSchemeHandlerFactory()
});
var url = "custom://g.com/hello.html";
var url = "custom://g.com/main.js";

var uri = new Uri(request.Url);
var fileName = uri.AbsolutePath;

if (fileName.Contains(".js"))
{
    return ResourceHandler.FromString("fun",".js");
}
if (fileName.Contains(".html"))
{
    return ResourceHandler.FromString("html");
}
return ResourceHandler.FromString(" ",".html");


```

### 2. 代码

```c#
using System;
using System.IO;
using CefSharp;

namespace MyProject.CustomProtocol
{
    public class CustomProtocolSchemeHandler : ResourceHandler
    {
        // Specifies where you bundled app resides.
        // Basically path to your index.html
        private string frontendFolderPath;

        public CustomProtocolSchemeHandler()
        {
            frontendFolderPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "./bundle/");
        }

        // Process request and craft response.
        public override bool ProcessRequestAsync(IRequest request, ICallback callback)
        {
            var uri = new Uri(request.Url);
            var fileName = uri.AbsolutePath;

            var requestedFilePath = frontendFolderPath + fileName;

            if (File.Exists(requestedFilePath))
            {
                byte[] bytes = File.ReadAllBytes(requestedFilePath);
                Stream = new MemoryStream(bytes);

                var fileExtension = Path.GetExtension(fileName);
                MimeType = GetMimeType(fileExtension);

                callback.Continue();
                return true;
            }

            callback.Dispose();
            return false;
        }
    }

    public class CustomProtocolSchemeHandlerFactory : ISchemeHandlerFactory
    {
        public const string SchemeName = "customFileProtocol";

        public IResourceHandler Create(IBrowser browser, IFrame frame, string schemeName, IRequest request)
        {
            return new CustomProtocolSchemeHandler();
        }
    }
}



// And then register it before calling Cef.Initialize:

var settings = new CefSettings
{
  BrowserSubprocessPath = GetCefExecutablePath()
};

settings.RegisterScheme(new CefCustomScheme
{
  SchemeName = CustomProtocolSchemeHandlerFactory.SchemeName,
  SchemeHandlerFactory = new CustomProtocolSchemeHandlerFactory()
});
```
