# Html.Raw

- [asp.net mvc 中用 ViewData 或 ViewBag 传递数据字符防止转义 - liangyely 的博客 - CSDN 博客](https://blog.csdn.net/liangyely/article/details/82958332)

## 常用

### 1. asp.net mvc 中用 ViewData 或 ViewBag 传递数据字符防止转义

```c#
// 后台代码：

ViewBag.error = @"<h6 style=""color: red"">错误</h6>";
// 前台：

@Html.Raw(ViewBag.error)
```
