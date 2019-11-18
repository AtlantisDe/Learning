# msg

## 常用

### 1. 弹出信息框完成后执行其它动作

```js
if (data.code == 200) {
        layer.msg(data.message, function() {
          fun_hereNewFunction();
        });
```

### 2.确认信息框再谈信息框演示

```js

    layer.confirm("真的删除吗?", function(index) {
      layer.alert(
        "请使用批量删除功能",
        { skin: "layui-layer-molv", closeBtn: 0, title: "操作提示" },
        function() {
          layer.close(layer.index);
        }
      );

```
