# CookieManager

- [AsyncExtensions](https://github.com/cefsharp/CefSharp/blob/798b2bb62e4c2f446acf294c3d66910197fa61e4/CefSharp/AsyncExtensions.cs)
- [CefSharp how to clear current webpage like real browser does when closing the tab](https://stackoverflow.com/questions/60707749/cefsharp-how-to-clear-current-webpage-like-real-browser-does-when-closing-the-ta)
- [使用 CEfSharp 之旅（5）CEFSharp 隔离 Cookie*C#*年少时](https://blog.csdn.net/u010919083/article/details/78366906)
- [CEF3: Introduce BrowsingInstance and SiteInstance concepts · Issue #1044 · roadlabs/chromiumembedded](https://github.com/roadlabs/chromiumembedded/issues/1044)
- [CefSharp 使用教程三(Cookie 处理)*C#*剑挥清风指明月·笔走狂澜舞镹天-CSDN 博客](https://blog.csdn.net/u010085423/article/details/72765852)
- [how to make ChromiumWebBrowser have standalone cookies](https://github.com/cefsharp/CefSharp/issues/1836)
- [CefSharp.ChromiumWebBrowser 浏览器的一些功能使用 - mingjian_zhang - 博客园](https://www.cnblogs.com/zhangmingjian/p/12993822.html)

## 常用

```c#
// Persist Session Cookies 持续会话Cookie
// Persist User Preferences 坚持用户首选项

// 当前程序运行根目录
CachePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "CefSharp\\Cache_" + md5),
CachePath = Path.Combine(Path.GetTempPath(), @"CefSharp\Cache_" + md5),


// 要点:访问Cookie自己构造接收Cookie对象,也可以委托实现

Cef.GetGlobalCookieManager().DeleteCookiesAsync(string.Empty, string.Empty);

/// <summary>访问Cookie</summary>
public class CookieVisitor : CefSharp.ICookieVisitor
{
    public void Dispose()
    {

    }

    public bool Visit(Cookie cookie, int count, int total, ref bool deleteCookie)
    {
        Console.WriteLine($"{cookie.Domain}---{cookie.Name}---{cookie.Value}");
        return true;
    }
}

var visitor = new CookieVisitor();

Cef.GetGlobalCookieManager().VisitAllCookies(visitor);


public class CookieVisitorDel : CefSharp.ICookieVisitor
{
    public void Dispose()
    {

    }

    public bool Visit(Cookie cookie, int count, int total, ref bool deleteCookie)
    {
        deleteCookie = true;
        Console.WriteLine($"{cookie.Domain}---{cookie.Name}---{cookie.Value}");

        return true;
    }
}

CookieVisitorDel visitorDel = new CookieVisitorDel();
Cef.GetGlobalCookieManager().VisitAllCookies(visitorDel);

/// <summary>隔离</summary>
public static RequestContextSettings FunRequestContextSettings()
{
    var requestContextSettings = new RequestContextSettings();
    requestContextSettings.PersistSessionCookies = true;
    requestContextSettings.PersistUserPreferences = true;
    return requestContextSettings;
}


/// <summary>隔离</summary>
public static RequestContextSettings FunRequestContextSettings()
{
    var requestContextSettings = new RequestContextSettings();
    requestContextSettings.PersistSessionCookies = false;
    requestContextSettings.PersistUserPreferences = false;
    return requestContextSettings;
}

browser.RequestContext = new RequestContext(new RequestContextSettings { CachePath = "cache1" });

chromiumWebBrowser.RequestContext = new RequestContext(FunRequestContextSettings());


/// <summary>创建浏览器类型 枚举类型</summary>
public enum CreateBRType
{
    /// <summary>普通</summary>
    General = 0,

    /// <summary>独立隔离Cookie</summary>
    StandaloneCookie = 1,

    /// <summary>未知</summary>
    Unknown = 404
}


switch (GetCreateBRType)
{
    default:
    case CreateBRType.General:
        ChromiumWebBrowser = new CefSharp.WinForms.ChromiumWebBrowser(LoadUrl) { Dock = DockStyle.Fill };


        break;
    case CreateBRType.StandaloneCookie:
        ChromiumWebBrowser = new CefSharp.WinForms.ChromiumWebBrowser(LoadUrl, new RequestContext(FunRequestContextSettingsV2(Md5)));
        break;
}

var setting = new RequestContextSettings()
        {
            CachePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "CefSharp\\Cache_" + md5),
            PersistSessionCookies = true,
            PersistUserPreferences = true
        };
        var context = new RequestContext(setting);
        var cookieManager = context.GetCookieManager(null);
        //这样设置的cookie不是全局的，只有当前browser才能访问
        cookieManager.SetCookie("domain", new Cookie
        {
            Name = "cookiename",
            Value = "cookievalue",
            Path = "/"
        });
        var browser = new CefSharp.WinForms.ChromiumWebBrowser("url", context);




var chromiumWebBrowser = (IWebBrowser)sender;
if (BR_NetEase163_First)
{
    BR_NetEase163_First = false;
    var url2 = "https://www.163.com/";
    if (this.BaseInfoItem.NetEase163Cookies.IsNullOrEmpty() == false && this.BaseInfoItem.NetEase163Cookies.Count > 0)
    {
        var mc = chromiumWebBrowser.RequestContext.GetCookieManager(null);
        foreach (var item in this.BaseInfoItem.NetEase163Cookies)
        {
            item.Expires = DateTime.MaxValue;
            var rst = mc.SetCookie(url2, item);
        }
        chromiumWebBrowser.Reload();
    }
}

// 设置cookie
var cookieManager = chromiumWebBrowser.GetCookieManager();
var cookieManager = CefSharp.Cef.GetGlobalCookieManager();
var rst = cookieManager.SetCookie("https://demo.baidu.com/", new Cookie() { Domain = "demo.baidu.com", Name = "sessionid", Value = "cd1aaf09a51eec7da370fa941599beb6", Expires = DateTime.MinValue });

```
