# CefCommandLineArgs

- [cefsharp/CefSharp](https://github.com/cefsharp/CefSharp/wiki/General-Usage#cefsettings-and-browsersettings)
- [List of Chromium Command Line Switches &laquo; Peter Beverloo](https://peter.sh/experiments/chromium-command-line-switches/)
- [CEF 之 CefSettings 设置日志等级 - 车臣 - 博客园](https://www.cnblogs.com/chechen/p/6825478.html)

## 常用

### 1. 设置日志等级

```c#
// 可以设置CefSettings的log_severity的日志等级，可以设置的值为“verbose”，“info”，“warning”，“error”，“error-report”，“disable”，如果不想在桌面出现，直接设置为disable
// 代码如下

settings.LogSeverity = LogSeverity.Disable;

```
