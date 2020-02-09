# Form.api

## 操作

### 0.常用

```js
// 赋值类
layui.form.val("Div_itemsdemo_form", data);

// 错误用法
layui.form.val("Div_itemsdemo_form", {
  IsCompresswebpage: "false"
});

// 正确用法
layui.form.val("Div_itemsdemo_form", {
  IsCompresswebpage: false
});

// 取值类
// 1. 推荐 本方法能保留原始对象其它未存在表单里的对象值

layuiFormdatafield2targetfiled(data.field, Items);
FunLayuiFormSetBoolValueToObjItems("Div_id_form", Items);

// 开关正式版
FunLayuiFormSetBoolValueToObjItems("Div_id_form", Items);

// 覆盖版
layuiFormdatafield2targetfiled(data.field, DemoItems);

// 2. 常用调试获取测试方法
layui.form.val("Div_itemsdemo_form");
// 3. 获取值 直接覆盖
subSiteconfig = data.field;
```

### 1. SET 赋值可实体类

```js
清空;
layui.form.val("divformname", { name: "" });
layui.form.val("divformname", { name: "" });

//时间控件必须格式化
DemoItems.expiretime = layui.util.toDateString(
  DemoItems.expiretime,
  "yyyy-MM-dd HH:mm:ss"
);
layui.form.val("Div_itemsdemo_form", data);

layui.form.val("Div_itemsdemo_form", {
  guid: DemoItems.guid,
  deviceFinger: DemoItems.deviceFinger,
  key: DemoItems.key,
  keyOwner: DemoItems.keyOwner,
  keyOwner: DemoItems.keyOwner,
  expiretime: DemoItems.expiretime,
  isenable: GetcheckboxValuetrueOrfalse_for_readUIshow(DemoItems.isenable),
  description: DemoItems.description
});
```

### 2. GET 表格数据赋值到目标实体数据封装方法

```js
layuiFormdatafield2targetfiled(data.field, DemoItems);

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

### 4. 提交事件[layui.form.on submit]

```js
layui.form.on("submit(savelinks_save)", function(data) {
  console.log(data);
  var host = GetQueryString("host");
  savelinks(host, data.field.linksbody);
  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});

layui.form.on("submit(demo_formsub)", function(data) {
  logincheck();
  layer.close(layer.index);
  layui.$.ajax({
    type: "POST",
    url: "/api?Action=savedemo",
    dataType: "json",
    data: "Name=" + data.field.Name + "&Host=" + data.field.Age,
    cache: false,
    async: false,
    success: function(data) {
      layer.alert(data.Apimsg.Message, { icon: 6 });
      worksites();
    }
  });
  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});
```

### 5. 枚举表单内开关关闭的值

```js
layui.$(".layui-form [class='layui-unselect layui-form-switch']").length;

layui.$(".layui-form [class='layui-unselect layui-form-switch']");

layui.$("#Div_id_form [class='layui-unselect layui-form-switch']");

var divArr = $("#Div_id_form [class='layui-unselect layui-form-switch']");
$.each(divArr, function(i, n) {
  console.log(divArr[i]);
});
```
