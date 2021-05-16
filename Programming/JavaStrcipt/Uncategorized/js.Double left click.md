# js.Double left click

- [dblclick](https://developer.mozilla.org/zh-CN/docs/Web/API/Element/dblclick_event)
- [jquery 双击 input 框更改值 - justincai - 博客园](https://www.cnblogs.com/justincai/archive/2004/01/13/2552754.html)
- [Select and copy text to clipboard on double click jQuery](https://stackoverflow.com/questions/34158974/select-and-copy-text-to-clipboard-on-double-click-jquery)
- [How do I copy to the clipboard in JavaScript?](https://stackoverflow.com/questions/400212/how-do-i-copy-to-the-clipboard-in-javascript) -[js 判断鼠标单击或者双击事件\_shenmill 的博客-CSDN 博客\_js 判断鼠标单击或者双击事件](https://blog.csdn.net/shenmill/article/details/56565086)
- [js 监控页面所有的 onclick 方法](https://blog.csdn.net/rj0511/article/details/84002528)

```c#

```

## 0. 判断鼠标单击或者双击事件

```c#
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
</head>
<body>
    <input type="button" onclick="test1()" ondblclick="test2()" value="点击">
    <script type="text/javascript">
       function test1 () {
        console.log('单击');
       }
       function test2 () {
        console.log('双击');
       }
    </script>
</body>
</html>
```

## 1. Code

```c#
<script type="text/javascript">

$(document).ready(function(){

var div = $('.change');
div.addClass('modify');
var a = document.createElement('a');
$(a).dblclick(function(){
    var text = $(this).text();
    var width = $(this).parent().width();
    $(this).html("<input type='text'   value="+text+">");
    $("a > input").focus().blur(function(){
            $(a).text($(this).val());
            self.data[ri]['name'] = $(this).val();         //更改数组中的值
        })
});
$(a).text(d);
$(div).append(a);

});

<html >
    <body>
         <div class="change"></div>
   </body>
</html >
```
