# scroll

- [JS 控制滚动条的位置 - jery.M - 博客园](https://www.cnblogs.com/jeryM/p/7776569.html)
- [js-获取滚动条位置 - 团团 n - 博客园](https://www.cnblogs.com/ban-s/p/js-scroll-coordinate.html)
- [js实现滚动条自动滚动（scrollTop） - 栈木地 - CSDN博客](https://blog.csdn.net/amdd9582/article/details/87738821)

## 代码

### JS 控制滚动条的位置

```c#
window.scrollTo(x, y);
// 竖向滚动条置顶
window.scrollTo(0, 0);
// 竖向滚动条置底
window.scrollTo(0, document.body.scrollHeight);
```

### js 获取滚动条的高度

```c#
function getScrollTop() {
  var scroll_top = 0;
  if (document.documentElement && document.documentElement.scrollTop) {
    scroll_top = document.documentElement.scrollTop;
  } else if (document.body) {
    scroll_top = document.body.scrollTop;
  }
  return scroll_top;
}
```

### js-获取滚动条位置

```c#
function ScollPostion() {
  var t, l, w, h;
  if (document.documentElement && document.documentElement.scrollTop) {
    t = document.documentElement.scrollTop;
    l = document.documentElement.scrollLeft;
    w = document.documentElement.scrollWidth;
    h = document.documentElement.scrollHeight;
  } else if (document.body) {
    t = document.body.scrollTop;
    l = document.body.scrollLeft;
    w = document.body.scrollWidth;
    h = document.body.scrollHeight;
  }
  return {
    top: t,
    left: l,
    width: w,
    height: h
  };
}
```
