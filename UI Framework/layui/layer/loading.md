# loading

## 代码

```js
//加载层-默认风格

layer.load();
//此处演示关闭
setTimeout(function() {
  layer.closeAll("loading");
}, 2000);
//加载层-风格2

layer.load(1);
//此处演示关闭
setTimeout(function() {
  layer.closeAll("loading");
}, 2000);
//加载层-风格3

layer.load(2);
//此处演示关闭
setTimeout(function() {
  layer.closeAll("loading");
}, 2000);
//加载层-风格4

layer.msg("加载中", {
  icon: 16,
  shade: 0.01
});
//打酱油

layer.msg("尼玛，打个酱油", { icon: 4 });
//tips层-上

layer.tips("上", "#id或者.class", {
  tips: [1, "#0FA6D8"] //还可配置颜色
});
//tips层-右

layer.tips("默认就是向右的", "#id或者.class");
//tips层-下

layer.tips("下", "#id或者.class", {
  tips: 3
});
//tips层-左

layer.tips("左边么么哒", "#id或者.class", {
  tips: [4, "#78BA32"]
});
//tips层-不销毁之前的

layer.tips("不销毁之前的", "#id或者.class", {
  tipsMore: true
});
//默认prompt

layer.prompt(function(val, index) {
  layer.msg("得到了" + val);
  layer.close(index);
});
//屏蔽浏览器滚动条

layer.open({
  content: "浏览器滚动条已锁",
  scrollbar: false
});
//弹出即全屏

var index = layer.open({
  type: 2,
  content: "http://layim.layui.com",
  area: ["320px", "195px"],
  maxmin: true
});
layer.full(index);
//正上方

layer.msg("灵活运用offset", {
  offset: "t",
  anim: 6
});
//更多例子
layer.msg("Hi");
```
