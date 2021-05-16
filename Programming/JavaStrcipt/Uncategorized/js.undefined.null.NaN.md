# JS 中判断一个对象是否为 null、undefined、0、NaN

- [JS 中判断一个对象是否为 null、undefined、0、NaN_JavaScript_qq_36742720](https://blog.csdn.net/qq_36742720/article/details/88568546)

## 常用代码

```c#
// 判断undefined、null与NaN:
// 必须先这声明对象
var tmp = null;
if (!tmp) {
  alert("null or undefined or NaN");
  alert("该对象为空");
}

// 常用
if (aa) {
  console.log("对象不为空,执行");
}
```
