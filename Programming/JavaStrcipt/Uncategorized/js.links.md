# js links

## 常用

### 1. 获取所有链接

```c#
Array.from(document.querySelectorAll("a")).map((a) => a.href);

var array = [];
var links = document.getElementsByTagName("a");
for (var i = 0; i < links.length; i++) {
  array.push(links[i].href);
}

var links = document.querySelector("#b_results").getElementsByTagName("a");
var array = [];
for (var i = 0; i < links.length; i++) {
  array.push(links[i].href);
}

array.forEach(function (element, index) {
  console.log(element);
  console.log(index);
});
```
