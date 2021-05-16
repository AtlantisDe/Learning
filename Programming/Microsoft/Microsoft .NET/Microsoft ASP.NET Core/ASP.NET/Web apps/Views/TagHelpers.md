# TagHelpers

- [Tag Helpers in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/tag-helpers/intro?view=aspnetcore-5.0)
- [Tag Helpers 介绍 - HackerVirus - 博客园](https://www.cnblogs.com/Leo_wl/p/5891950.html)

## 常用

### 1. Partial Tag Helper in ASP.NET Core

- [dotnet/AspNetCore.Docs](https://github.com/dotnet/AspNetCore.Docs/blob/master/aspnetcore/mvc/views/tag-helpers/built-in/partial-tag-helper.md)
- [Partial Tag Helper in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/tag-helpers/built-in/partial-tag-helper?view=aspnetcore-5.0)

```c#
 @await Html.PartialAsync("~/Views/Home/_menuList.cshtml", item.Children)
```
