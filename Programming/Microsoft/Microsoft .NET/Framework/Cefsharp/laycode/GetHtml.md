# bodyhtml

## 用法

### HTML 取源码

```c#
private void ChromiumWebBrowser_FrameLoadEnd(object sender, CefSharp.FrameLoadEndEventArgs e)
        {
            var br = (CefSharp.WinForms.ChromiumWebBrowser)sender;
            if (e.Frame.IsMain)
            {
                try
                {
                    var html = "";
                    br.GetBrowser().MainFrame.GetSourceAsync().ContinueWith(taskHtml =>
                    {
                        html = taskHtml.Result;
                        System.IO.File.WriteAllText(string.Format(demostr, DateTime.Now.ToString("yyyy-MM-dd HH-mm-ss")), html, Encoding.UTF8);
                    });


                }
                catch (Exception Ex)
                {
                    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));
                }
            }
        }
```
