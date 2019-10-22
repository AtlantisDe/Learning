# onclick

- [JS 事件添加 onclick 写法注意。 - enmeen - 博客园](https://www.cnblogs.com/enmeen/p/5185588.html)

## JS 事件添加 onclick 写法注意

```js
// 自定义函数添加onclick事件写法注意。

错误写法：element.onclick = addclass(className);

正确写法：element.onclick = function(){ addclass(className); }

document.querySelector("#api_btn_action").onclick=function(){ alert('Hello'); }
```