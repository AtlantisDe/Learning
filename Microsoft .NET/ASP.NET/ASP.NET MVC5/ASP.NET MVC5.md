# ASP.NET MVC5

- View 可被多个控制器重用，但前提你需要把这些文件放在 Shared 文件夹中
- [Asp.net mvc View 视图 - 米奇老鼠 - CSDN 博客](https://blog.csdn.net/jasonhds/article/details/51133931?utm_source=app)
- [1、ASP.NET Core2.0 之 Model、View、Controller - qq_28315089 的博客 - CSDN 博客](https://blog.csdn.net/qq_28315089/article/details/80868624?utm_source=app)

## 代码

### Controller 传向 View

```c#
// 像前面给View中传递一个对象的方式就是Model对象传值，对应的视图也是强类型视图，一个视图只能有一个强类型。
// ViewBag、ViewData和TempData
// 区别：本质是没有什么区别，都可以实现传值。ViewBag只是ViewData的封装版，他们之间是可以相互转换的，比如：ViewBag.Title，在页面中取值的时候可以用ViewData["Title"],同理，用ViewData["temp"]可以再用ViewBag.temp进行取值。这几种方式都比较适合传递少量的值，如果就一个两个之间，可以用上面的方式进行传递，如果值比较多的情况下还是推荐使用Model的方式进行传递值。
ViewBag.Biaoti = "用户列表";
ViewData["usertype"] = "管理员用户";
TempData["temp"] = Newtonsoft.Json.JsonConvert.SerializeObject(vs);
@ViewBag.temp
```

### 母版页

- [无废话 MVC 入门教程四[视图中的 Layout 使用] - 李林峰的园子 - 博客园](https://www.cnblogs.com/iamlilinfeng/archive/2013/02/28/2934397.html)
- [MVC4 利用 Layout 的几种方法的 Demo - 钢 ge 的博客 - CSDN 博客](https://blog.csdn.net/ganggelove/article/details/52876118)

```c#
// 1.母板页_Layout.cshtml

// 2.用户自定义控件

// 3.默认Layout引用的使用(_ViewStart.cshtml)


//第一个页面
@{
    Layout = "~/Views/Shared/_Layout.cshtml";
}
这里是layoutg一的内容


//第二个页面
@{
    Layout = "~/Views/Shared/_Layout.cshtml";
}
这里是layout二的内容
```

### Layout null

```html
@{ Layout = null; }

<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
  </head>
  <body>
    <div></div>
  </body>
</html>
```

### 视图

- 视图页引用分部视图（WebForm 叫做用户控件）
- [视图页引用分部视图（WebForm 叫做用户控件）](https://blog.csdn.net/weixin_30487317/article/details/95274169)
- [MVC 视图之间调用方法总结 - 燚夜 - 博客园](https://www.cnblogs.com/yi-ye/p/5670257.html)

```c#
// 调用视图方式有两种：
@Html.Partial("/Views/Console/corestateitems/corestateitems.cshtml");

// 一：直接调用（不通过controller）

<body>
　　@Html.Partial("../Shared/Error");
</body>

//  二：通过controller调用

<body>
 　　@Html.Action("Dismode","Shared")
</body>

//  注：
// 　　Action、RenderAction加载方法的视图，执行Controller→ Model → View的順序，然後把产生的页面带回到原来的View中再回传。
// 　　Partial、RenderPartial直接加载视图文件内容
```

### 路由

- [asp.net mvc 多级目录结构 - hank's blog - ITeye 博客](https://hankblog.iteye.com/blog/2160164)

### 路由 MVC 页面重定向'页面跳转

- [MVC页面重定向'页面跳转 - linshichen的专栏 - CSDN博客](https://blog.csdn.net/linshichen/article/details/51333041)
