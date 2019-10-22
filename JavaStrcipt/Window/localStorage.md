# localStorage

- [Window localStorage 属性 | 菜鸟教程](http://www.runoob.com/jsref/prop-win-localstorage.html)
- [js 怎么判断一个页面是从哪个页面进来的？](https://zhidao.baidu.com/question/1611179437128512067.html)

## 使用

```c#
// 定义和使用
// localStorage 和 sessionStorage 属性允许在浏览器中存储 key/value 对的数据。
// localStorage 用于长久保存整个网站的数据，保存的数据没有过期时间，直到手动去删除。
// localStorage 属性是只读的。
// 提示: 如果你只想将数据保存在当前会话中，可以使用 sessionStorage 属性， 改数据对象临时保存同一窗口(或标签页)的数据，在关闭窗口或标签页之后将会删除这些数据。


// 存储
localStorage.setItem("lastname", "Smith");
// 检索
document.getElementById("result").innerHTML = localStorage.getItem("lastname");

// 语法
window.localStorage

// 保存数据语法：

localStorage.setItem("key", "value");
// 读取数据语法：

var lastname = localStorage.getItem("key");
// 删除数据语法：

localStorage.removeItem("key");

```
