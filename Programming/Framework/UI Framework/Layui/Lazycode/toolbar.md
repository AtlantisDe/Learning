# 头工具栏事件

-[layui table模块，开启头部工具栏 - 在线演示](https://www.layui.com/demo/table/toolbar.html)

## 基本用法

```c#
layui.use("table", function() {
  var table = layui.table;

  table.on("toolbar(table_IPS)", function(obj) {
    switch (obj.event) {
      case "ipsadd":
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
        break;
      case "getCheckLength":
        var data = checkStatus.data;
        layer.msg("选中了：" + data.length + " 个");
        break;
      case "isAll":
        layer.msg(checkStatus.isAll ? "全选" : "未全选");
        break;
    }
  });
});
```