# JS

## bind

### 代码一

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

### 代码二

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
