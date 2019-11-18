# Html.Raw

- [asp.net mvc 中用 ViewData 或 ViewBag 传递数据字符防止转义 - liangyely 的博客 - CSDN 博客](https://blog.csdn.net/liangyely/article/details/82958332)

## 常用

### 1. asp.net mvc 中用 ViewData 或 ViewBag 传递数据字符防止转义

```c#
// 后台代码：

ViewBag.error = @"<h6 style=""color: red"">错误</h6>";
// 前台：
@{
ViewBag.Title = "DEMO";
ViewBag.Eml = "@";
}

@Html.Raw(ViewBag.error)
@Html.Raw('@')
@Html.Raw(ViewBag.Eml)

// 错误用法读取模板文件导致程序卡
@Html.Raw("Demo/table.cshtml")
```

### 2. 获取视图层 View 与前端模板传值

```c#
public ActionResult SelectsiteconfigItem()
{
    ViewBag.main = System.IO.File.ReadAllText(System.AppDomain.CurrentDomain.BaseDirectory + @"/Views/Console/Demo/table.cshtml", System.Text.Encoding.UTF8);

    return View();

}

@Html.Raw(ViewBag.main)
```
