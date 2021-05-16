# document.ready 和 onload

- [JS 页面加载触发事件 document.ready 和 window.onload 的区别](https://www.cnblogs.com/feiyuhuo/p/5097385.html)
- [JavaScript js 文档加载事件，以及 jquery 加载事件](https://blog.csdn.net/xldmx/article/details/83513038)

## 原生 JS 实现 document.ready 以及和 window.onload 的先后顺序

- [原生 JS 实现 document.ready 以及和 window.onload 的先后顺序](https://baijiahao.baidu.com/s?id=1613225567743061589&wfr=spider&for=pc)

```c#
// 执行这段代码之后，你会看到浏览器里面会先弹出ready,在弹出onload。
```

## document.ready 和 onload 的区别——JavaScript 文档加载完成事件

```shell

# 页面加载完成有两种事件：
# 一是 ready，表示文档结构已经加载完成（不包含图片等非文字媒体文件）；
# 二是 onload，指示页面包含图片等文件在内的所有元素都加载完成。

window.ready = function() {
//do something
};

```

## Dom Ready

### 使用 jq 时一般都是这么开始写脚本的

```c#
$(function() {
  // do something
});
```

```c#
$(function() {
  $("a").click(function() {
    alert("Hello world!");
  });
});
// 这个例子就是给所有的a标签绑定了一个click事件。即当所有链接被鼠标单击的时候，都执行 alert("Hello World!");
// 也就是说页面加载时绑定，真正该触发时触发。
// 其实这个就是jq ready()的简写，它等价于：
$(document).ready(function() {
  //do something
});
//或者下面这个方法，jQuer的默认参数是：“document”；
$().ready(function() {
  //do something
});
```

## Dom Load

```c#
window.onload = function() {
  //do something
};
//或者经常用到的图片
document.getElementById("imgID").onload = function() {
  //do something
};
```

```c#
<script type="text/javascript">
(function() {
alert("DOM还没加载哦!");
})(jQuery)
</script>
```

## JavaScript js 文档加载事件，以及 jquery 加载事件

```c#
<script>
//js文档加载完成的事件
/*
* 会被后面的window.onload覆盖，该处不会在页面上弹出 111
*/
window.onload = function(){
alert("window.onload 111");
}

window.onload = function(){
alert("window.onload 222");
}

/*文档加载完成的事件*/
/*
* jquery的文档加载事件全部会执行，不存在后面覆盖前面
*/
jQuery(document).ready(function(){
alert("jQuery(document).ready(function()");
});

/*
jQuery  简写成 $
*/
$(document).ready(function(){
alert("$(document).ready(function()");
});

/*
最简单的写法
*/
$(function(){
  alert("$(function(){");
});

</script>
```

## 代码示例 1

```c#
<script>
        window.onload = function () {
            var obj = document.getElementById("divid");
            obj.style.width = document.body.offsetWidth;
            obj.style.height = document.body.offsetHeight;

            helloworld();
        };
    </script>
```
