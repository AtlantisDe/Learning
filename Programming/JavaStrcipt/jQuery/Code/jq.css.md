# JQ CSS

- [Error Happened](http://jquery增加，移除，修改一个html标签的class类名)

```c#
一个标签可以指定多个class

1.增加一个class：

$(".default").addClass("hover_s");

2.移除一个class：

$(".default").removeClass("default ");

3.修改一个class：

3.1   可以分两步走：

// 1 先增加一个你要增加的class

$(".default").addClass("hover_s");


// 2 再删除一个你想要删除的class

$(".default").removeClass("default ");

// 或者反过来，先删除，后增加也行。

// 3.2 可以直接设置成你想要的class

$(". default ").attr("class", " hover_s fl fv lv ");

// 4.当鼠标移到，离开指定标签时修改class

// 移到时改成hover_s，离开时改成default

$(".default").hover(function () {

$(this).addClass("hover_s");

$(this).removeClass("default");

}, function () {

$(this).addClass("default");

$(this).removeClass("hover_s");

});


document.querySelector("#ServiceStatus").style.background = "#ff0000";

5.获取标签的所有class
var classname_module = $(".lv").attr("class");
```

## style 操作

### style 移除

```c#
$("#aaaa").removeAttr("style");
layui.$("#ServiceStatus").removeClass();
```

### 移除

```c#
$("#show").removeAttr("style"); //ie,ff均支持

$("#show").attr("style", ""); //firefox支持，ie不支持
```

### JQuery 如何选择带有多个 class 的元素

- [JQuery 如何选择带有多个 class 的元素 - 左正 - 博客园](https://www.cnblogs.com/soundcode/p/5042729.html)

```c#
<div class="modal fade in"></div>;

// 依次过滤

$(".modal.fade").filter("in");

// 属性选择
$("[class='modal fade in']"); //此处顺序必须一致才行

// 直接选择
$(".modal.fade.in");
```
