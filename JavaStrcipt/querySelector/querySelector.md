# querySelector

## Wiki

- [Document.querySelector()](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)
- [HTML DOM querySelector() 方法 | 菜鸟教程](https://www.runoob.com/jsref/met-document-queryselector.html)

## 代码

### 根据 ID 取文本框内值

```js
document.querySelector("#extensionnamesText").value;
```

### 获取文档中 id="demo" 的元素

```js
document.querySelector("#demo");
```

### 获取文档中第一个 p 元素

```js
document.querySelector("p");
```

### 获取文档中 class="example" 的第一个元素

```js
document.querySelector("p.example");
```

### 获取文档中有 "target" 属性的第一个 a 元素

```js
document.querySelector("a[target]");
```

### 添加移除 style 和 class

- [使用 querySelector 添加移除 style 和 class](https://www.jianshu.com/p/431f72866c77)

```js
document.querySelector(".treasure_box").style.display = "block";
document.querySelector(selector).classList.add(className);
document.querySelector("html").classList.add("noscroll");
document.querySelector(selector).classList.remove(className);
document.querySelector("html").classList.remove("noscroll");

document.querySelector("#severstates").classList.add("s_backg_color_yes");
document.querySelector("#severstates").classList.remove("s_backg_color_yes");
document.querySelector("#severstates").style.background = "#fff";
document.querySelector("#severstates").style.background = "#00ff00";
```

### 添加 HTML 元素

```js
function createElementFromHTML(htmlString) {
  var div = document.createElement("div");
  div.innerHTML = htmlString.trim();

  // Change this to div.childNodes to support multiple top-level nodes
  return div.firstChild;
}

document
  .querySelector("#id_selectedsiteconfigitemClassname")
  .appendChild(
    createElementFromHTML(
      '<a class="layui-btn layui-btn-xs" id="id_selectedsiteconfigitemClassname">已选中</a>'
    )
  );
```

### 文档 body 对象

```js
document.querySelector("body");
```

### 移除某 ID 对象下子元素

```js
document.querySelector("#id").innerHTML = "888";
```

### 元素显示修改

```js
document.querySelector("#tpls_count").innerText = "999";
```
