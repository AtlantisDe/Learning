# location

- [JavaScript Window Location](https://www.w3school.com.cn/js/js_window_location.asp)

## 1. QuickStart

```c#
window.location.href 返回当前页面的 href (URL)
window.location.hostname 返回 web 主机的域名
window.location.pathname 返回当前页面的路径或文件名
window.location.protocol 返回使用的 web 协议（http: 或 https:）

window.location.assign 加载新文档
window.location.assign("http://www.baidu.com")

window.location.href="about:blank"
window.location.href="http://www.google.com"
window.location.href="http://www.baidu.com"
window.location.reload();


//获取域名
host = window.location.host;
host2=document.domain;

// 通过js获取当前访问的根域名 简单写法 兼容性低
var domain = document.domain.substring(document.domain.indexOf('.')+1)
```

## 2. 随机跳转

```c#
// 多少毫秒后跳转
setTimeout(function () {
 window.location.href="http://www.google.com"
}, 3000);


// 整数随机数(5到15)之间
var random = Math.random() * (15 - 5) + 5;
console.log(parseInt(random));

// 整数随机数(5到15)之间
var random = parseInt(Math.random() * (15 - 5) + 5);
console.log(random);

// 随机5到15秒后随机跳转的网页
setTimeout(function () {
    window.location.href = parseInt(Math.random() * (999999 - 10000) + 10000) + ".html"
}, parseInt(Math.random() * (15 - 5) + 5) * 1000);




```
