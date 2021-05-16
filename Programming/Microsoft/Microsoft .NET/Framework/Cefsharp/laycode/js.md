# JS

## 0. 操作

```c#

chromiumWebBrowser.GetBrowser().MainFrame.ExecuteJavaScriptAsync($"alert(\"123\")");

// 框架盲写表
var Ids = chromiumWebBrowser.GetBrowser().GetFrameIdentifiers();
for (int i = 0; i < Ids.Count; i++)
{
    chromiumWebBrowser.GetBrowser().GetFrame(Ids[i]).ExecuteJavaScriptAsync($"document.querySelectorAll('input[name=\"email\"]')[0].value=\"{UcZzAnd163WorkConsole.BaseInfoItem.NetEase163User}\";document.querySelectorAll('input[name=\"password\"]')[0].value=\"{UcZzAnd163WorkConsole.BaseInfoItem.NetEase163Pass}\";");
}



try
{
    browser.GetBrowser().MainFrame.ExecuteJavaScriptAsync(code, "about:blank", 0);
}
catch (Exception){ }finally{}

try
{
    browser.GetBrowser().MainFrame.ExecuteJavaScriptAsync(code, "about:blank", 0);
}
catch (Exception)
{
    LogsExtenions.ExLog(System.Reflection.MethodBase.GetCurrentMethod().ReflectedType.FullName, ex.Message);
}
finally{}
```

## 1. bind

### 1. 代码一

```c#
try
{
    googleBrower = new GoogleBrower();
    chromiumWebBrowser.RegisterAsyncJsObject("googleBrower", googleBrower, CefSharp.BindingOptions.DefaultBinder);
}
catch (Exception ex)
{
    MessageBox.Show(ex.Message, System.Reflection.MethodBase.GetCurrentMethod().Name, MessageBoxButtons.OK, MessageBoxIcon.Information);

}
```

### 2. 代码二

```c#
try
{
    googleBrower = new GoogleBrower();
    chromiumWebBrowser.JavascriptObjectRepository.Register("googleBrower", googleBrower, true, CefSharp.BindingOptions.DefaultBinder);
}
catch (Exception ex)
{
    MessageBox.Show(ex.Message, System.Reflection.MethodBase.GetCurrentMethod().Name, MessageBoxButtons.OK, MessageBoxIcon.Information);

}
```
