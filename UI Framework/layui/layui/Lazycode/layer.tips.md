# layer.tips

- [layer tip 功能，如何让 tip 不消失，通过手动点击才消失 - Fly 社区](https://fly.layui.com/jie/4572/)

## 常用代码

```js
layer.tips("Demo", "div[lay-id='Demoid']", {
  tips: [0, "#3595CC"],
  area: ["350px", "43px"],
  time: 3000
});

layer.tips("默认就是向右的", obj, {
  tips: [0, "#3595CC"],
  time: 0
});

var msg = "已选中查看:" + tmpvalues.siteconfigclassname;
layer.tips(msg, obj, { time: 0 });
```
