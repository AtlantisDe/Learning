# querySelector

## 1. Wiki

- [Document.querySelector()](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)
- [HTML DOM querySelector() 方法 | 菜鸟教程](https://www.runoob.com/jsref/met-document-queryselector.html)
- [HTML5 中类 jQuery 选择器 querySelector 的使用 - 刘哇勇 - 博客园](https://www.cnblogs.com/Wayou/p/html5_web_api_queryselector.html)

## 2. 代码

### 根据 ID 取文本框内值

```c#
document.querySelector("#extensionnamesText").value;
```

### 获取文档中 id="demo" 的元素

```c#
document.querySelector("#demo");
```

### 获取文档中第一个 p 元素

```c#
document.querySelector("p");
```

### 获取文档中 class="example" 的第一个元素

```c#
document.querySelector("p.example");
document.querySelector("li.semi-dropdown-item").click();
```

### document.querySelector 以及 document.querySelectorAll

```c#
element = document.querySelector("selectors");
elementList = document.querySelectorAll("selectors");
```

### querySelector 常用

```c#
document.querySelector("a[target]");
var test = document.querySelectorAll(
  'input[value][type="checkbox"]:not([value=""])'
);
var test = document.querySelectorAll('li[attrs="demo"]');
var test = document.querySelector('li[attrs="demo"]');
var DivForm = document.querySelector('div[lay-filter="Div_Demo_Form"]');
DivForm.querySelectorAll('input[type="checkbox"]');
document.querySelector(".treasure_box");
var test = document.querySelectorAll('input[name="username"]');
document.querySelectorAll('input[name="username"]')[0].value="aaa";
document.querySelectorAll('input[name="email"]')[0].value="aaa";

document.querySelectorAll('.name.domain-name').forEach(function (element, index) {
  console.log(element.innerText); 
});


```

### 添加移除 style 和 class

- [使用 querySelector 添加移除 style 和 class](https://www.jianshu.com/p/431f72866c77)

```c#
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

```c#
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

```c#
document.querySelector("body");
```

### 移除某 ID 对象下子元素

```c#
document.querySelector("#id").innerHTML = "888";
```

### 元素显示修改

```c#
document.querySelector("#tpls_count").innerText = "999";
```

### 网页框架操作

- [如何通过 js 获取 iframe 框架中的内容 - 史洲宇 - 博客园](https://www.cnblogs.com/shizhouyu/p/3957532.html)

```c#
// IE下：格式：
window.frames["iframe的name值"].document.getElementById("iframe中控件的ID").click();  
// 实例：
window.frames["ifm"].document.getElementById("btnOk").click(); 
// 都支持的方法：格式：
document.getElementById("iframe的ID值").contentWindow.document.getElementsByName('radios');//IE firefox支持
```
