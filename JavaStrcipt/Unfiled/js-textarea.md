# textarea

- [javascript - 插入文本到 textarea 后，自动显示插入的最后一行 - SegmentFault 思否](https://segmentfault.com/q/1010000000123026)
- [Jquery添加元素（append，prepend，after，before四种方法区别对比） - 梁先森的博客 - CSDN博客](https://blog.csdn.net/lzx159951/article/details/79097253)

## 常用示例

### 插入一行 并最后显示

```html
<h2>SAMPLE</h2>
<a href="###" id="add">add content</a>
<br /><br />

<textarea id="text">
Goodbye
</textarea>
```

```js
$("#add").click(function() {
  $("#text").append("the text to append \n");
});
// 就是在标签开始的地方插入内容。
$("p").prepend("<b>world</b>")//插入语句
```
