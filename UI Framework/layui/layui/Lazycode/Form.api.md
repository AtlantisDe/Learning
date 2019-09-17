# Form.api

## 操作

### 1. SET 赋值可实体类

```js
//时间控件必须格式化
regkeyitem.expiretime = layui.util.toDateString(
  regkeyitem.expiretime,
  "yyyy-MM-dd HH:mm:ss"
);
layui.form.val("Div_regkeyitems_form", data);
layui.form.val("Div_regkeyitems_form", {
  guid: regkeyitem.guid,
  deviceFinger: regkeyitem.deviceFinger,
  key: regkeyitem.key,
  keyOwner: regkeyitem.keyOwner,
  keyOwner: regkeyitem.keyOwner,
  expiretime: regkeyitem.expiretime,
  isenable: GetcheckboxValuetrueOrfalse_for_readUIshow(regkeyitem.isenable),
  description: regkeyitem.description
});
```

### 2. GET 表格数据赋值到目标实体数据封装方法

```js
layuiFormdatafield2targetfiled(data.field, regkeyitem);

function layuiFormdatafield2targetfiled(datafield, targetfiled) {
  // 开始遍历
  for (var p in datafield) {
    // 方法
    if (typeof datafield[p] == "function") {
      console.log(datafield[p]());
    } else {
      // p 为属性名称，datafield[p]为对应属性的值
      // props += p + "=" + datafield[p] + "\t";
      try {
        targetfiled[p] = datafield[p];
      } catch (e) {
        console.log(e.message);
      }
    }
  }
}
```
