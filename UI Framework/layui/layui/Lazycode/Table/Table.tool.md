# Table.toolbar

- 单元格行工具条

```js
layui.table.on("tool(Demoitems)", function(obj) {
  // var data = obj.data;
  console.log(obj);
  if (obj.event === "111") {
  } else if (obj.event === "demoitem_delete") {
    layer.confirm("真的要删除吗?", function(index) {
      layer.close(index);
      fun_demoitem_delete(name, obj.data.Guid);
    });
  } else if (obj.event === "000") {
  }
});
```
