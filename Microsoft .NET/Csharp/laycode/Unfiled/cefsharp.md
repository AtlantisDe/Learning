# C# Cefsharp 相关

## Cefsharp 代码

```c#
    public class SpxChromiumBrowser : ChromiumWebBrowser
    {
        public SpxChromiumBrowser()
            : base(null)
        {
        }
        public SpxChromiumBrowser(string url) : base(url)
        {
        }
        //实现接口方法,鼠标放上去自动实现接口写法
        public class CefLifeSpanHandler : CefSharp.ILifeSpanHandler
        {
        }

    }
```

## 继承/接口实现使用快捷思路

```c#
// 说明:第1步:继承对象要继承的属性对象 查看其类型 第2步:写继承类,实现接口即可

//
// 摘要:
//     Implement CefSharp.IContextMenuHandler and assign to handle events related to
//     the browser context menu
[Browsable(false)]
[DefaultValue(null)]
[EditorBrowsable(EditorBrowsableState.Never)]
public IContextMenuHandler MenuHandler { get; set; }

```

## 重写

```C#
    public class Spx {

        public class spxMenuHandler : IContextMenuHandler
        {
            public void OnBeforeContextMenu(IWebBrowser chromiumWebBrowser, IBrowser browser, IFrame frame, IContextMenuParams parameters, IMenuModel model)
            {
                model.Clear();
            }

            public bool OnContextMenuCommand(IWebBrowser chromiumWebBrowser, IBrowser browser, IFrame frame, IContextMenuParams parameters, CefMenuCommand commandId, CefEventFlags eventFlags)
            {
                return false;
            }

            public void OnContextMenuDismissed(IWebBrowser chromiumWebBrowser, IBrowser browser, IFrame frame)
            {
            }

            public bool RunContextMenu(IWebBrowser chromiumWebBrowser, IBrowser browser, IFrame frame, IContextMenuParams parameters, IMenuModel model, IRunContextMenuCallback callback)
            {
                return false;
            }
        }
        public class DragHandler : IDragHandler
        {
            public bool OnDragEnter(IWebBrowser browserControl, IBrowser browser, IDragData dragData, DragOperationsMask mask)
            {
                return true;
            }
            public void OnDraggableRegionsChanged(IWebBrowser browserControl, IBrowser browser, IList<DraggableRegion> regions)
            {
            }
        }
    }

```

## 源码

```C#
   private static void Br_FrameLoadEnd(object sender, FrameLoadEndEventArgs e)
            {
                var br = (CefSharp.WinForms.ChromiumWebBrowser)sender;
                string htmlstr = string.Empty;
                br.GetSourceAsync().ContinueWith(taskHtml =>
                {
                    htmlstr = taskHtml.Result;
                });
            }
```
