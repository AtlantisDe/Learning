# ILifeSpanHandler

## 常用代码

```c#
public class AILifeSpanHandler : CefSharp.ILifeSpanHandler
{
    public bool DoClose(IWebBrowser chromiumWebBrowser, IBrowser browser)
    {
        //throw new NotImplementedException();
        return false;
    }

    public void OnAfterCreated(IWebBrowser chromiumWebBrowser, IBrowser browser)
    {
        //throw new NotImplementedException();

    }

    public void OnBeforeClose(IWebBrowser chromiumWebBrowser, IBrowser browser)
    {
        //throw new NotImplementedException();
    }

    public bool OnBeforePopup(IWebBrowser chromiumWebBrowser, IBrowser browser, IFrame frame, string targetUrl, string targetFrameName, WindowOpenDisposition targetDisposition, bool userGesture, IPopupFeatures popupFeatures, IWindowInfo windowInfo, IBrowserSettings browserSettings, ref bool noJavascriptAccess, out IWebBrowser newBrowser)
    {
        //throw new NotImplementedException();

        chromiumWebBrowser.Load(targetUrl);
        newBrowser = null;
        return true;
    }
}
```
