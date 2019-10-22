# Form.api

## 操作

### 0.常用

```js
// 赋值类
layui.form.val("Div_regkeyitems_form", data);
// 取值类
layuiFormdatafield2targetfiled(data.field, regkeyitem);
layui.form.val("Div_regkeyitems_form");
```

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

### 3. API 选择器赋值

```js
function valFormTextWithjosn(formname, jsontexts) {
  // console.log(formname);
  // console.log(jsontexts);
  layui.form.val(formname, JSON.parse(jsontexts));
  return true;
}
```

### 4. 提交事件

```js
layui.form.on("submit(savelinks_save)", function(data) {
  console.log(data);
  var host = GetQueryString("host");
  savelinks(host, data.field.linksbody);
  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});
```
