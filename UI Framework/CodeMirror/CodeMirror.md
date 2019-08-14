# CodeMirror

- [CodeMirror](https://codemirror.net/)
- [Attention Required! | Cloudflare](https://codepen.io/DerkJanS/pen/EXMwVz)
- [CodeMirror 在线代码编辑器使用以及如何取值 - 麦兜家园 - 博客园](https://www.cnblogs.com/web001/p/9370392.html)

## 用法

```html
editor.setValue('<meta name="renderer" content="webkit" />');

<!-- 设置代码框的大小 -->
editor.setSize('800px', '950px');
<!-- 获取编辑器的内容 -->
editor.getValue();
<!-- //仅仅单纯获取编辑器的文本内容，不能识别换行及一些特殊符号的转义 -->
<!-- 给编辑器赋值 -->
editor.setValue("");
```

### 引用备份

```c#

    <link rel="stylesheet" href="https://codemirror.net/doc/docs.css">
    <link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
    <link rel="stylesheet" href="https://codemirror.net/addon/hint/show-hint.css">
    <script src="https://codemirror.net/lib/codemirror.js"></script>
    <script src="https://codemirror.net/addon/hint/show-hint.js"></script>
    <script src="https://codemirror.net/addon/hint/xml-hint.js"></script>
    <script src="https://codemirror.net/addon/hint/html-hint.js"></script>
    <script src="https://codemirror.net/mode/xml/xml.js"></script>
    <script src="https://codemirror.net/mode/javascript/javascript.js"></script>
    <script src="https://codemirror.net/mode/css/css.js"></script>
    <script src="https://codemirror.net/mode/htmlmixed/htmlmixed.js"></script>

```
