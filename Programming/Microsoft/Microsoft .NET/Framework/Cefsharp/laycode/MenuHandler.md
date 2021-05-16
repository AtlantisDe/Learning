# MenuHandler

- IContextMenuHandler
- [cefsharp/CefSharp](https://github.com/cefsharp/CefSharp/blob/master/CefSharp.WinForms.Example/Handlers/MenuHandler.cs)
- [CefSharp/CefSharp.Wpf.Example/Handlers/MenuHandler.cs](https://github.com/cefsharp/CefSharp/blob/master/CefSharp.Wpf.Example/Handlers/MenuHandler.cs)

## 1. 常用

```c#
this.BR_Baidu.ChromiumWebBrowser.MenuHandler = new MenuHandler();
this.BR_NetEase163.ChromiumWebBrowser.MenuHandler = new MenuHandler();

model.Clear();
model.AddItem((CefMenuCommand)BrowserObjectType, BrowserObjectType.ToName());

model.AddSeparator();

model.AddItem((CefMenuCommand)Google.Net.WinForms.Engine.Baidu.Models.Google.ActionType.Mail163ComLoginIndex, Google.Net.WinForms.Engine.Baidu.Models.Google.ActionType.Mail163ComLoginIndex.ToName());


private IEnumerable<Tuple<string, CefMenuCommand, bool>> GetMenuItems(IMenuModel model)
{
    for (var i = 0; i < model.Count; i++)
    {
        var header = model.GetLabelAt(i);
        var commandId = model.GetCommandIdAt(i);
        var isEnabled = model.IsEnabledAt(i);
        yield return new Tuple<string, CefMenuCommand, bool>(header, commandId, isEnabled);
    }
}


model.AddItem(CefMenuCommand.Back, "Back ");
model.AddItem(CefMenuCommand.Forward, "Forward ");

model.AddItem(CefMenuCommand.Back, "Back [后退]");
model.AddItem(CefMenuCommand.Forward, "Forward [前进]");

var menuItems = GetMenuItems(model).ToList();

for (int i = 0; i < menuItems.Count; i++)
{
    var item = menuItems[i];
    model.AddItem(item.Item2, item.Item1);
}

case CefMenuCommand.Back:
browser.GoBack();return false;

case CefMenuCommand.Forward:
browser.GoForward(); return false;


switch (commandId)
{
case CefMenuCommand.NotFound:
    break;
case CefMenuCommand.Back:
    break;
case CefMenuCommand.Forward:
    break;
case CefMenuCommand.Reload:
    break;
case CefMenuCommand.ReloadNoCache:
    break;
case CefMenuCommand.StopLoad:
    break;
case CefMenuCommand.Undo:
    break;
case CefMenuCommand.Redo:
    break;
case CefMenuCommand.Cut:
    break;
case CefMenuCommand.Copy:
    break;
case CefMenuCommand.Paste:
    break;
case CefMenuCommand.Delete:
    break;
case CefMenuCommand.SelectAll:
    break;
case CefMenuCommand.Find:
    break;
case CefMenuCommand.Print:
    break;
case CefMenuCommand.ViewSource:
    break;
case CefMenuCommand.SpellCheckSuggestion0:
    break;
case CefMenuCommand.SpellCheckSuggestion1:
    break;
case CefMenuCommand.SpellCheckSuggestion2:
    break;
case CefMenuCommand.SpellCheckSuggestion3:
    break;
case CefMenuCommand.SpellCheckSuggestion4:
    break;
case CefMenuCommand.SpellCheckLastSuggestion:
    break;
case CefMenuCommand.SpellCheckNoSuggestions:
    break;
case CefMenuCommand.AddToDictionary:
    break;
case CefMenuCommand.CustomFirst:
    break;
case CefMenuCommand.CustomLast:
    break;
case CefMenuCommand.UserFirst:
    break;
case CefMenuCommand.UserLast:
    break;
default:
    break;
}

```
