# checkbox

## 开关

```js
// 错误用法
layui.form.val("Div_itemsdemo_form", {
  IsCompresswebpage: "false"
});

// 正确用法
layui.form.val("Div_itemsdemo_form", {
  IsCompresswebpage: false
});

if (data.field.sysData == "1") {
  data.field.sysData = "1";
} else {
  data.field.sysData = "0";
}


// 常用
layuiFormdatafield2targetfiled(data.field, Items);
FunLayuiFormSetBoolValueToObjItems("Div_id_form",Items);

```

```html
<input type="checkbox" name="xxx" lay-skin="switch" />
<input type="checkbox" name="yyy" lay-skin="switch" lay-text="ON|OFF" checked />
<input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭" />
<input type="checkbox" name="aaa" lay-skin="switch" disabled />

<!-- 表单方框风格 -->
<div class="layui-form-item" pane>
  <label class="layui-form-label">开关</label>
  <div class="layui-input-block">
    <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭" />
  </div>
</div>

<!-- 表单方框风格 自定义宽度样式-->
<div class="layui-form-item" style="width: 288px;" pane>
  <label class="layui-form-label" style="width: 188px;"
    >是否开启生成关键文章</label
  >
  <div class="layui-input-block" style="margin-left: 188px;">
    <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭" />
  </div>
</div>
```

## 开关处理

### 1. JS 版本

```js
function FunLayuiFormSetBoolValueToObjItems(layuiformId, targetfiled) {
  var divArr = layui.$(
    "#" + layuiformId + " [class='layui-unselect layui-form-switch']"
  );

  // console.log(divArr);
  layui.$.each(divArr, function(i, n) {
    var input = $(divArr[i]).prev();
    var name = layui.$(input).attr("name");
    // console.log(name);

    try {
      targetfiled[name] = false;
    } catch (e) {
      console.log(e.message);
    }
  });

  divArr = layui.$(
    "#" +
      layuiformId +
      " [class='layui-unselect layui-form-switch layui-form-onswitch']"
  );

  layui.$.each(divArr, function(i, n) {
    var input = $(divArr[i]).prev();
    var name = layui.$(input).attr("name");
    // console.log(name);

    try {
      targetfiled[name] = true;
    } catch (e) {
      console.log(e.message);
    }
  });
}

function GetcheckboxValuetrueOrfalse_for_save(tagguid) {
  // console.log(tagguid);
  var val = "false";
  if (tagguid == "true" || tagguid == 1) {
    val = "true";
  }
  // console.log(val);
  return val;
}

function GetcheckboxValuetrueOrfalse_for_readUIshow(tagguid) {
  // console.log(tagguid);
  var val = "";
  if (tagguid == "true" || tagguid == 1) {
    val = "true";
  }
  // console.log(val);
  return val;
}
```

### 2. 在线调试组件

```c#
ck.checked = true;layui.form.render();

ck.checked = false;layui.form.render();
```
