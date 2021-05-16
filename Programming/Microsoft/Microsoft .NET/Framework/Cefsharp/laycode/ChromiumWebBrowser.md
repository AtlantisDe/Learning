# ChromiumWebBrowser

## 常用代码

### 代码 1

```c#
var ccweb = new CefSharp.WinForms.ChromiumWebBrowser("about:blank");
```

### 继承代码

- [CefSharp中ChromiumWebBrowser打开新页面处理（_blank） - 哈利路亚的收藏夹 - CSDN博客](https://blog.csdn.net/lanwilliam/article/details/79640954)

```c#

    public class ExtChromiumBrowser : ChromiumWebBrowser
    {
        public ExtChromiumBrowser()
            : base(null)
        {
            this.LifeSpanHandler = new CefLifeSpanHandler();
            //this.DownloadHandler = new DownloadHandler(this);
        }

        public ExtChromiumBrowser(string url) : base(url)
        {
            this.LifeSpanHandler = new CefLifeSpanHandler();
        }

        public event EventHandler<NewWindowEventArgs> StartNewWindow;

        public void OnNewWindow(NewWindowEventArgs e)
        {
            if (StartNewWindow != null)
            {
                StartNewWindow(this, e);
            }
        }

    }
```
