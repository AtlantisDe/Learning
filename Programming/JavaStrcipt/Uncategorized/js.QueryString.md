# js-QueryString

- [用 JS 获取地址栏参数的方法（超级简单） - WebEnh - 博客园](https://www.cnblogs.com/webenh/p/6431700.html)

## 代码

```c#
function GetQueryString(name) {
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
  var r = window.location.search.substr(1).match(reg);
  if (r != null) return unescape(r[2]);
  return null;
}

// 调用方法
alert(GetQueryString("参数名1"));
alert(GetQueryString("参数名2"));
alert(GetQueryString("参数名3"));
```
