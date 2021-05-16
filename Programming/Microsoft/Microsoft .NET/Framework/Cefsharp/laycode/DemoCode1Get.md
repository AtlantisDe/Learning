# DemoCode

## code

```C#
       void scancode()
        {
            Thread t = new Thread(delegate ()
            {
                var count = 0; var yesclick = false; var getOK = false;var src = "";
                while (true)
                {
                    Module.Laycode.sys.Delay(1000);
                    if (Spx.FrameLoadEnd.yesfn(br) && yesclick == false)
                    {
                        br.GetMainFrame().ExecuteJavaScriptAsync("$('#demoid').click();"); yesclick = true;
                    }
                    if (yesclick)
                    {
                        br.GetMainFrame().EvaluateScriptAsync("(function() { return $($($('#demoimg')[0]).children(\"img\")[0]).attr(\"src\");})();").ContinueWith(x =>
                        {
                            var img = x.Result;
                            if (img.Success && img.Result != null)
                            {
                                src = (int)img.Result; getOK = true;
                            }
                        });
                    }
                    if (getOK)
                    {
                        MessageBox.Show(src);
                    }
                    count++; if (count > 5 || getOK) { break; }
                }
            });
            t.IsBackground = true;
            t.Start();
        }
```

## Get Rst Code

```c#
br.GetBrowser().MainFrame.EvaluateScriptAsync("(function(){var d=document.querySelector(\"#b_results\");if(d==null){return null}var e=[];var b=d.getElementsByTagName(\"a\");for(var c=0;c<b.length;c++){var a=b[c].href;if(a.indexOf(\"bing.com\")>0){continue}if(a.length<6){continue}if(a.indexOf(\"fwlink/\")>0){continue}e.push(a)}return e})();").ContinueWith(x =>
{
    var Links = x.Result;
    if (Links.Success && Links.Result == null)
    {
    }
    if (Links.Success && Links.Result != null)
    {
        var Items = Links.Result;
    }
});
```
