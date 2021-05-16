# IDialogHandler

- [IDialogHandler.OnFileDialog Method](http://cefsharp.github.io/api/71.0.0/html/M_CefSharp_IDialogHandler_OnFileDialog.htm)
- [cefsharp/CefSharp](https://github.com/cefsharp/CefSharp/blob/master/CefSharp/Handler/IDialogHandler.cs)
- [cefsharp/CefSharp](https://github.com/cefsharp/CefSharp/blob/52ec00c4860e0d71786ee041f03542808cdac6e1/CefSharp.Example/Handlers/TempFileDialogHandler.cs)

## Cefsharp 代码

```c#
public class TempFileDialogHandler : IDialogHandler
{
    public bool OnFileDialog(IWebBrowser chromiumWebBrowser, IBrowser browser, CefFileDialogMode mode, CefFileDialogFlags flags, string title, string defaultFilePath, List<string> acceptFilters, int selectedAcceptFilter, IFileDialogCallback callback)
    {
        callback.Continue(selectedAcceptFilter, new List<string> { Path.GetRandomFileName() });

        return true;
    }
}


chromiumWebBrowser.DialogHandler = new TempFileDialogHandler();

```
