# jQuery

## jQuery 选择器

- [jQuery 选择器 | 菜鸟教程](https://www.runoob.com/jquery/jquery-ref-selectors.html)

### JQ 查找子元素下的指定元素

- [JQ 查找子元素下的指定元素 - qupeng666 的博客 - CSDN 博客](https://blog.csdn.net/qupeng666/article/details/77366421)
- [jquery 得到指定 div 下面的指定 div -CSDN 论坛](https://bbs.csdn.net/topics/390934455)

```js
$("#test")
  .find('div[id^="div2"]')
  .find('p[id^="p2"]')
  .css("color", "red");
```

```js
// 用$(:selector).length就能知道指定选择器是否有符合的元素存在
// 选择器随便写啦
$("#div0>#div1").length;
$("#div0").find("#div1").length;
$("#div0 #div1").length;
```

### jquery 给 p 标签赋值

```js
$("#bq").html("内容")；
layui.$('#realtimelogCount').html("内容")
```

### Jquery 设置字体颜色

```js
<p class="pmc">Hello</p>;
$(".pmc").css("color", "red");
```
