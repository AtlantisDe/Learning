# Table event

```js
//监听行工具事件
layui.table.on("tool(Googlesusers)", function(obj) {
  var data = obj.data;
  // console.log(data)
  if (obj.event === "lookusers") {
    getsiteweixinusers(data.path);
  } else if (obj.event === "editusers") {
    opensiteweixinusers(obj);
  } else if (obj.event === "cdnrefresh") {
    layer.alert("无法执行改操作!", { icon: 6 });
  } else if (obj.event === "cdnwechats") {
    layer.alert("哈喽!");
  }
});

//Form按钮事件监听
layui.form.on("submit(btn_demo_1)", function(data) {
  layer.close(layer.index);
  layui.$.ajax({
    type: "POST",
    url: "/api.aspx?Action=getdemo",
    dataType: "json",
    data: "path=" + data.field.path + "&users=" + data.field.weixinusers,
    cache: false,
    async: false,
    success: function(data) {
      layer.alert(data.apimsg.message, { icon: 6 });
    }
  });

  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});

layui.form.on("submit(btn_demo_close)", function(data) {
  layer.close(layer.index);
  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});
```
