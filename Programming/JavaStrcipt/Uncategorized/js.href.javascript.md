# js.href.javascript

- [&lt;a&gt;标签中的 href=&quot;javascript:;&quot;是什么意思？ - 程序-猿猿 - 博客园](https://www.cnblogs.com/zyyweb/p/9637367.html)

## 常用

```c#
// 例子：<a href="javascript:;">我的大学</a>

javascript: 是一个伪协议
javascript:是表示在触发<a>默认动作时，执行一段JavaScript代码，而 javascript:; 表示什么都不执行，这样点击<a>时就没有任何反应。
href="javascript:;"就是去掉a标签的默认行为，跟href="javascript:void(0)"是一样的？是一样的。void 是JavaScript 的一个运算符，void(0)就是什么都不做的意思。

var html = '<div><a href="javascript:void(0)" title="' + d.Beizhu + '" class="layui-table-link">' + d.Beizhu + "</a></div>";

```

## demo

```c#

```
