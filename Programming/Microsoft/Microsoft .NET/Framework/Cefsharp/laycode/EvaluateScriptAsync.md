# EvaluateScriptAsync

```C#
EvaluateScriptAsync(string script, TimeSpan? timeout) method.
Demo.GetMainFrame().ExecuteJavaScriptAsync("$('#demoid').click();");
```

```C#
// Get Document Height
var task = frame.EvaluateScriptAsync("(function() { var body = document.body, html = document.documentElement; return  Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight ); })();", null);

task.ContinueWith(t =>
{
    if (!t.IsFaulted)
    {
        var response = t.Result;
        EvaluateJavaScriptResult = response.Success ? (response.Result ?? "null") : response.Message;
    }
}, TaskScheduler.FromCurrentSynchronizationContext());
```

```C#
browser.LoadingStateChanged += OnLoadingStateChanged;

//A very basic example
private void OnLoadingStateChanged(object sender, LoadingStateChangedEventArgs args)
{
//Wait for the Page to finish loading
if (args.IsLoading == false)
{
    //Reccomended to use an anon closure
    const string script = @"(function()
                    {
                        return 1 + 1;
                    })();";

    browser.EvaluateScriptAsync(script).ContinueWith(x =>
    {
        var response = x.Result;

        if (response.Success && response.Result != null)
        {
            var onePlusOne = (int)response.Result;
            //Do something here (To interact with the UI you must call BeginInvoke)
        }
    });
}
}
```

```C#
 public static bool demowait(ChromiumWebBrowser br)
        {
            try
            {
                Demo.GetMainFrame().EvaluateScriptAsync("code").ContinueWith(x =>
                {
                    var response = x.Result;
                    if (response.Success && response.Result != null)
                    {
                        var wait = (bool)response.Result;
                    }
                }).Wait();
                return wait;
            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message));
            }
            return false;
        }
```

```c#
(function() {
  var body = document.body,
    html = document.documentElement;
  return Math.max(
    body.scrollHeight,
    body.offsetHeight,
    html.clientHeight,
    html.scrollHeight,
    html.offsetHeight
  );
})();
```

```c#
(function() {
  return $($($("#demoID")[0]).children("img")[0]).attr("src");
})();
```

```c#
function ftmp() {
  return "demo";
}
ftmp();
```

```c#
(function() {
  return 1 + 1;
})();
```

````c#
(function() {
//  return cod ...
})();

```c#
var x = "";
try {
  var x = 1 + 1;
} catch (e) {
  x = "0";
}
return x;
````

```c#
(function() {
  var x = "";
  try {
    var x = 1 + 1;
  } catch (e) {
    x = "0";
  }
  return x;
})();
```

```c#
(function() {
  var x = "no";
  try {
    var x = $.fn.jquery;
  } catch (e) {
    x = "no";
  }
  return x;
})();
```
