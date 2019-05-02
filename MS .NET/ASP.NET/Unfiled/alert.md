# alert

- [ASP.NET 中弹出消息框的几种常见方法 - feiquan - 博客园](https://www.cnblogs.com/feiquan/p/8030391.html)

```C#
Response.Write("<script>alert('弹出的消息')</script>");
this.Page.RegisterStartupScript(" " , "<script>alert(' 弹出的消息 '); </script> ");
Response.Write(" <script>function window.onload() {alert( ' 弹出的消息' ); } </script> ");
```
