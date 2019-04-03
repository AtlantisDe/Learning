# Cefsharp

* [CEF收集](https://www.cnblogs.com/bycnboy/category/1216694.html)
* [cefCustomScheme](https://github.com/cefsharp/CefSharp/blob/master/CefSharp.Example/CefExample.cs)
* [General Usage](https://github.com/cefsharp/CefSharp/wiki/General-Usage/156732a0d567915551b9e162d93067fa23cf89e3)
* [RegisterJsObject](https://github.com/cefsharp/CefSharp/wiki/General-Usage/156732a0d567915551b9e162d93067fa23cf89e3#registerjsobject)
* [cefSharp框架中的C#方法和Web项目中的JS方法相互调用](https://blog.csdn.net/weixin_42434300/article/details/81901217)
* [[Winform]CefSharp ——js调用c#方法](https://www.cnblogs.com/wolf-sun/p/6932977.html)
* [使用CefSharp在.Net程序中嵌入Chrome浏览器（五）——Javascript交互](https://www.cnblogs.com/TianFang/p/9902795.html)
* [使用CefSharp在.Net程序中嵌入Chrome浏览器（六）——调试](https://www.cnblogs.com/TianFang/p/9906786.html)
* [cefsharp解决闪烁](https://www.cnblogs.com/tianciliangen/p/7641470.html)
* [CefSharp（chromium）javascript增加内存限制](https://cloud.tencent.com/developer/ask/208342)
* [C# 使用cefSharp访问EXE内嵌资源,禁止右键](http://www.261k.com/post/20180512081138.html)
* [C#引用CefSharp并屏蔽鼠标右键和禁止拖动放置事件](https://blog.csdn.net/u013564470/article/details/78339957)
* [CefSharp初识--把网页移到桌面](https://www.cnblogs.com/stoneniqiu/p/5089986.html)
* [cefsharp 实现 谷歌 F12 右键Focus 功能](https://bbs.csdn.net/topics/392375553)

## Cefsharp代码

```c#
main.ExecuteJavaScriptAsync(code, "about:blank", 0);
googleBrower.beijingTime(function(res) {alert(res);})
Task<CefSharp.JavascriptResponse> t;
                t = main.EvaluateScriptAsync(code);
                t.ConfigureAwait(false);

                t.Wait();
                if (t.Result.Result != null) { return t.Result.Result.ToString(); }

browser.RegisterAsyncJsObject("boundAsync", new AsyncBoundObject()); //Standard object rego
browser.RegisterAsyncJsObject("bound", new AsyncBoundObject(), BindingOptions.DefaultBinder); //Use the default binder to serialize values into complex objects
browser.RegisterAsyncJsObject("bound", new AsyncBoundObject(), new BindingOptions { CamelCaseJavascriptNames = false, Binder = new MyCustomBinder() }); //No camelcase of names and specify a default binder

```

## Cefsharp注意事项

```c#
Js注册方法名称第一个字母必须小写
```