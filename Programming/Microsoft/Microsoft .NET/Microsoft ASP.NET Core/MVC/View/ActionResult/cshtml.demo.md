# demo

```c#
@{Layout = null;}
@{
    ViewBag.Html = ViewBag.Html.ToString().Replace("</body>", "<div class=\"elapsedTime\">耗时:" + ViewBag.elapsedTime + "</div></body>");
}
@Html.Raw(ViewBag.Html)
```
