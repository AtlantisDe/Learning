# 表单

- [表单模块文档 - layui](https://www.layui.com/doc/modules/form.html)

## 0. 常用初始

- [常见问题 - layui](https://www.layui.com/doc/base/faq.html#form)

```c#
// 当你使用表单时，layui 会对 select、checkbox、radio 等原始元素隐藏，从而进行美化修饰处理。但这需要依赖于 form 组件，所以你必须加载 form，并且执行一个实例。
layui.form.render();
```

## 0. Form.api

### 0. 常用 api

```c#
// 赋值类
layui.form.val("Div_Demo_Form", data);
// BOOL赋值 错误用法
layui.form.val("Div_Demo_Form", {IsCompresswebpage: "false",});
// BOOL赋值 正确用法
layui.form.val("Div_Demo_Form", {IsCompresswebpage: false,});

// 监听取值类
layuiFormdatafield2targetfiled(data.field, Items);
FunLayuiFormSetBoolValueToObjItems("Div_id_Form", Items);

// 直接取值类
layui.form.val("Div_Demo_Form");
var data = layui.form.val("Div_WorkMain_Form");

// Form对象
var DivForm = document.querySelector('div[lay-filter="Div_Demo_Form"]');


```

### 1. SET 赋值可实体类

```c#
layui.form.val("Div_SubSiteContents_Form", { CreateContentNums: 20, CreateKeywordContentNums: 20, CreateThreadType: 1, MaxDegreeOfParallelism: 5 });


// 清空
layui.form.val("Div_Demo_Form", { name: "" });
layui.form.val("Div_Demo_Form", { name: "" });

//时间控件必须格式化
DemoItems.expiretime = layui.util.toDateString(
  DemoItems.expiretime,
  "yyyy-MM-dd HH:mm:ss"
);
layui.form.val("Div_Demo_Form", data);

layui.form.val("Div_Demo_Form", {
  guid: DemoItems.guid,
  deviceFinger: DemoItems.deviceFinger,
  key: DemoItems.key,
  keyOwner: DemoItems.keyOwner,
  keyOwner: DemoItems.keyOwner,
  expiretime: DemoItems.expiretime,
  isenable: GetcheckboxValuetrueOrfalse_for_readUIshow(DemoItems.isenable),
  description: DemoItems.description,
});
```

### 2. Form 数据赋值到目标实体数据封装方法

```c#
// Usage
layuiFormdatafield2targetfiled(data.field, DemoItems);
FunLayuiFormSetBoolValueToObjItems("Div_WebConfig_Form",webConfig);


/**通用 Form数据赋值到目标实体数据封装方法*/
function layuiFormdatafield2targetfiled(datafield, targetfiled) {
  // 开始遍历
  for (var p in datafield) {
    // 方法
    if (typeof datafield[p] == "function") {
      // console.log(datafield[p]());
    } else {
      // p 为属性名称，datafield[p]为对应属性的值
      // props += p + "=" + datafield[p] + "\t";
      try {
        targetfiled[p] = datafield[p];
      } catch (e) {
        // console.log(e.message);
      }
    }
  }
}

/**通用 Form表单开关类型转BOOL值*/
function FunLayuiFormSetBoolValueToObjItems(layuiformId, targetfiled) {
  var DivForm = document.querySelector('div[lay-filter="' + layuiformId + '"]');
  if (DivForm) {
    var checkboxs = DivForm.querySelectorAll('input[type="checkbox"]');
    checkboxs.forEach(function (element, index) {
      try {
        targetfiled[element.name] = element.checked;
      } catch (e) {}
    });
  }
}
```

### 3. API 选择器赋值

```c#
function valFormTextWithjosn(formname, jsontexts) {
  // console.log(formname);
  // console.log(jsontexts);
  layui.form.val(formname, JSON.parse(jsontexts));
  return true;
}
```

### 4. 提交监听事件

```c#
layui.form.on("submit(BtnDemoSave)", function (data) {
  console.log(data);

  return false;
});
// return false;
//阻止表单跳转。如果需要表单跳转，去掉这段即可。
layui.form.on("submit(demo_Formsub)", function (data) {
  logincheck();
  layer.close(layer.index);
  layui.$.ajax({
    type: "POST",
    url: "/api?Action=savedemo",
    dataType: "json",
    data: "Name=" + data.field.Name + "&Host=" + data.field.Age,
    cache: false,
    async: false,
    success: function (data) {
      layer.alert(data.Apimsg.Message, { icon: 6 });
      worksites();
    },
  });
  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});
```

### 5. 枚举表单内开关关闭的值

```c#
layui.$(".layui-form [class='layui-unselect layui-form-switch']").length;

layui.$(".layui-form [class='layui-unselect layui-form-switch']");

layui.$("#Div_id_Form [class='layui-unselect layui-form-switch']");

var divArr = $("#Div_id_Form [class='layui-unselect layui-form-switch']");
$.each(divArr, function (i, n) {
  console.log(divArr[i]);
});
```

## 1. 组件类型

```c#
<input type="text" name="name" autocomplete="off" placeholder="请输入" class="layui-input layui-disabled" disabled readonly="true" />
<input type="text" name="name" autocomplete="off" placeholder="请输入" class="layui-input" />
```

### 1. layui-disabled

```c#
<input type="text" name="ip" autocomplete="off" placeholder="请输入" class="layui-input layui-disabled" disabled readonly="true"/>
```

### 2. 按钮提交没反应可能原因

```c#
// 未添加 lay-submit
```

### 3. 表单示例代码 Div_WebConfig_Form

```c#
// <div class="layui-form layui-form-pane" lay-filter="Div_WebConfig_Form">

<div class="layui-form" lay-filter="Div_WebConfig_Form">
 <textarea name="text1" required lay-verify="required" placeholder="请输入" class="layui-textarea" ></textarea>
 <button class="layui-btn" lay-submit lay-filter="zhuanhuan">转换</button>
 <textarea name="text2" required lay-verify="required" placeholder="请输入" class="layui-textarea" ></textarea>
</div>
```

### 4. 表单内按钮监听

```c#
<script>
 layui.form.on("submit('Div_demo_form')", function(data) {
 return false;
 });

 layui.form.on('submit(zhuanhuan)', function (data) {
 console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
 console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
 console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
 console.log(data.field.users)
 return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
 });
</script>
```

### 5. 富文本框(textarea)

```c#
document.querySelector("#ID").value = "111231";

<textarea  lay-verify="required"  placeholder="备注."  class="layui-textarea"  name="Demos"  style="height: 300px;"></textarea>

```

#### 1. 富文本框 常规

```c#
<textarea name="cdnurls" required lay-verify="required" placeholder="请输入一行一条URL" class="layui-textarea" style="height: 350px;"></textarea>
```

#### 2. 富文本框 示例 1

```c#
<div class="layui-form-item layui-form-text">
 <label class="layui-form-label">友情链接列表/一行一个</label>
 <div class="layui-input-block">
 <textarea name="weixinusers" placeholder="一行一个友情链接,不要有特殊符号" class="layui-textarea"></textarea>
 </div>
</div>
```

#### 富文本框 示例 2

```c#
<div class="layui-form layui-form-pane" lay-filter="Div_links_form">
 <!-- begin -->

 <div class="layui-form-item layui-form-text">
 <label class="layui-form-label">友情链接列表/一行一个</label>
 <div class="layui-input-block">
 <textarea name="links" placeholder="一行一个友情链接,不要有特殊符号" class="layui-textarea" ></textarea>
 </div>
 </div>

 <div class="layui-form-item">
 <div class="layui-btn-group">
 <button class="layui-btn" lay-submit="" lay-filter="createsite_addtodb_tasksave" > 保存 </button>
 </div>
 </div>

 <!-- end -->
</div>
```

### 6. 单选框

```c#
layui.form.val("Div_Users_Form", {Sex: "0"});

// 表单方框风格
<div class="layui-form-item" pane>
 <label class="layui-form-label">单选框</label>
 <div class="layui-input-block">
 <input type="radio" name="sex" value="男" title="男" />
 <input type="radio" name="sex" value="女" title="女" checked />
 </div>
</div>
```

### 7. 开关(checkbox)

```c#
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

```C#
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

```c#
<input type="checkbox" name="xxx" lay-skin="switch" />
<input type="checkbox" name="yyy" lay-skin="switch" lay-text="ON|OFF" checked />
<input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭" />
<input type="checkbox" name="aaa" lay-skin="switch" disabled />

// 表单方框风格
<div class="layui-form-item" pane>
 <label class="layui-form-label">开关</label>
 <div class="layui-input-block">
 <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭" />
 </div>
</div>

// 表单方框风格 自定义宽度样式
<div class="layui-form-item" style="width: 288px;" pane>
 <label class="layui-form-label" style="width: 188px;" >是否开启生成关键文章</label>
 <div class="layui-input-block" style="margin-left: 188px;">
 <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭" />
 </div>
</div>
```

```c#
if (data.field.sysData == "1") {
  data.field.sysData = "1";
} else {
  data.field.sysData = "0";
}
```

```c#
// 表单方框风格 自定义宽度样式 加默认值
<div class="layui-form-item" style="width: 288px;" pane>
 <label class="layui-form-label" style="width: 188px;">是否开启生成关键文章</label>
 <div class="layui-input-block" style="margin-left: 188px;">
 <input type="checkbox" name="isOpenCreatekeywordContent" value="true" lay-skin="switch" lay-text="开启|关闭" />
 </div>
</div>
```

```c#
// 用于判断真假类型

console.log(data.field.isOpenCreatekeywordContent);

if (data.field.isOpenCreatekeywordContent == "true") {
  data.field.isOpenCreatekeywordContent = "true";
} else {
  data.field.isOpenCreatekeywordContent = "false";
}
console.log(data.field.isOpenCreatekeywordContent);
```

```c#
// 用于再次赋值时候渲染上去的细节操作
if (json_sconf_texts.isOpenCreatekeywordContent == "false") {
 json_sconf_texts.isOpenCreatekeywordContent = null;
 }
```

#### 1. JS 版本

```c#
/**通用 Form表单开关类型转BOOL值 废弃版*/
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

#### 2. 在线调试组件

```c#
ck.checked = true;layui.form.render();

ck.checked = false;layui.form.render();
```

### 8. 按钮

```c#
<button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="BtnWebConfigSave" id="BtnWebConfigSave">保存</button>

<button class="layui-btn layui-btn-primary">原始按钮</button>
<button class="layui-btn">默认按钮</button>
<button class="layui-btn layui-btn-normal">百搭按钮</button>
<button class="layui-btn layui-btn-warm">暖色按钮</button>
<button class="layui-btn layui-btn-danger">警告按钮</button>
<button class="layui-btn layui-btn-disabled">禁用按钮</button>

<button class="layui-btn layui-btn-primary layui-btn-lg">大型按钮</button>
<button class="layui-btn layui-btn-primary">默认按钮</button>
<button class="layui-btn layui-btn-primary layui-btn-sm">小型按钮</button>
<button class="layui-btn layui-btn-primary layui-btn-xs">迷你按钮</button>

<button class="layui-btn layui-btn-lg">大型按钮</button>
<button class="layui-btn">默认按钮</button>
<button class="layui-btn layui-btn-sm">小型按钮</button>
<button class="layui-btn layui-btn-xs">迷你按钮</button>

<button class="layui-btn layui-btn-lg layui-btn-normal">大型按钮</button>
<button class="layui-btn layui-btn-normal">默认按钮</button>
<button class="layui-btn layui-btn-sm layui-btn-normal">小型按钮</button>
<button class="layui-btn layui-btn-xs layui-btn-normal">迷你按钮</button>
```

### 9. 表单初始赋值

```c#
//formTest 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
form.val("formTest", {
  username: "贤心", // "name": "value"
  sex: "女",
  auth: 3,
  "check[write]": true,
  open: false,
  desc: "我爱layui",
});

layui.form.val("formTest", {
  username: "贤心",
  sex: "女",
  auth: 3,
  "check[write]": true,
  open: false,
  desc: "我爱layui",
});

layui.form.val("formTest", { username: "贤心" });

onclick = "layui.form.val('formTest', { username: '贤心' });";
```

### 10. 组装行内表单

- [layui 下拉框操作 如果暴力不是为了杀戮-CSDN 博客](https://blog.csdn.net/qq_33382313/article/details/80759188)

```c#
/**股票分类信息数据 信息列表 全部读取 */
    function FunStockCategoryInfos() {
        layui.$.getJSON("/api/StockCategoryInfos", function (responseJSON) {
            if (responseJSON.ResultCode == 0) {
                SinaHQCategoryItems = responseJSON.Data;
                FunStockCategoryLv1nameDone();
            } else {
                FunDataRequestFailed(responseJSON.Message);
            }
        }).fail(function () {
            FunNetworkfailure();
        });
    }

    /**股票分类信息数据  下拉框渲染*/
    function FunStockCategoryLvname(data, lvname) {
        var str = ''
        for (var i = 0; i < data.length; i++) {
            str += '<option value="' + data[i].Value + '">' + data[i].Name + '</option>'
        }
        $("#" + lvname).html(str);
        //重新渲染
        layui.form.render();
    }


    /**股票分类信息数据  行情分类*/
    function FunStockCategoryLv1nameDone() {
        var array = Enumerable.from(SinaHQCategoryItems).groupBy(x => x.Lv1name).select(x => ({ Key: x.key(), Source: x.getSource() })).toArray();
        var arr = [];


        for (var i = 0; i < array.length; i++) {
            var item0 = { "Name": array[i].Key, "Value": array[i].Key };
            arr.push(item0);
            //console.log(item0);
        }
        FunStockCategoryLvname(arr, "Lv1name");
    }

    /**股票分类信息数据  分类*/
    function FunStockCategoryLv2nameDone(Lv1name) {

        var array = Enumerable.from(SinaHQCategoryItems).where("x=>x.Lv1name=='" + Lv1name + "'").groupBy(x => x.Lv2name).select(x => ({ Key: x.key(), Source: x.getSource() })).toArray();
        var arr = [];


        for (var i = 0; i < array.length; i++) {
            var item0 = { "Name": array[i].Key, "Value": array[i].Key };
            arr.push(item0);
            //console.log(item0);
        }
        FunStockCategoryLvname(arr, "Lv2name");

    }

    /**股票分类信息数据  小分类*/
    function FunStockCategoryLv3nameDone(Lv1name, Lv2name) {

        var array = Enumerable.from(SinaHQCategoryItems).where("x=>x.Lv1name=='" + Lv1name + "' && x.Lv2name=='" + Lv2name + "'").toArray();
        var arr = [];


        for (var i = 0; i < array.length; i++) {
            var item0 = { "Name": array[i].Lv3name, "Value": array[i].Node };
            arr.push(item0);
            //console.log(item0);
        }
        FunStockCategoryLvname(arr, "Lv3name");

    }



    layui.form.on('select(Lv1name)', function (data) {
        FunStockCategoryLv2nameDone(data.value);

    });

    layui.form.on('select(Lv2name)', function (data) {
        FunStockCategoryLv3nameDone(document.querySelector("#Lv1name").value, data.value);

    });



layui.form.on('select(Lv1name)', function (data) {
    var nianfen = data.value;
    alert(nianfen)
    console.log(data.elem); //得到select原始DOM对象
    console.log(data.value); //得到被选中的值
    console.log(data.othis); //得到美化后的DOM对象
});



// layui 获取下拉框选择的数据
<div class="layui-input-inline">
    <select name="p_nianfen" lay-filter="layNianfen" id="nianfen_ipt">
        <option>选择年份</option>
    </select>
</div>
<script type="text/javascript">
form.on('select(layNianfen)', function (data) {
    var nianfen = data.value;
    alert(nianfen)
    console.log(data.elem); //得到select原始DOM对象
    console.log(data.value); //得到被选中的值
    console.log(data.othis); //得到美化后的DOM对象
});

```

```c#
// class="layui-inline"：定义外层行内
// class="layui-input-inline"：定义内层行内

// 代码一
<div class="layui-form-item">
  <div class="layui-inline">
  <label class="layui-form-label">范围</label>
  <div class="layui-input-inline" style="width: 100px;">
 <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input" />
  </div>
  <div class="layui-form-mid">-</div>
  <div class="layui-input-inline" style="width: 100px;">
 <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input" />
  </div>
  </div>

  <div class="layui-inline">
  <label class="layui-form-label">密码</label>
  <div class="layui-input-inline" style="width: 100px;">
 <input type="password" name="" autocomplete="off" class="layui-input" />
  </div>
  </div>
</div>

// 代码2
<div class="layui-form-item">
  <div class="layui-inline">
  <label class="layui-form-label">密码</label>
  <div class="layui-input-inline" style="width: 100px;">
 <input type="password" name="" autocomplete="off" class="layui-input" />
  </div>
  </div>
</div>

// 代码3-开关美化
<div class="layui-form-item">
  <div class="layui-inline">
  <label class="layui-form-label">页面干扰码</label>
  <div class="layui-input-inline layui-input" style="width: 100px;">
   <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭"/>
  </div>
  </div>
</div>

// 代码4-宽度
<div class="layui-form-item">
  <div class="layui-inline">
  <label class="layui-form-label" style="width: 120px;">字符随机转码</label>
  <div class="layui-input-inline layui-input" style="width: 160px;">
 <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭" />
  </div>
  </div>
</div>
```

### 11. 复选框

```c#
// 属性title可自定义文本（温馨提示：如果只想显示复选框，可以不用设置title）
// 属性checked可设定默认选中 属性lay-skin可设置复选框的风格
// 设置value="1"可自定义值，否则选中时返回的就是默认的on

// 默认风格：
<input type="checkbox" name="" title="写作" checked />
<input type="checkbox" name="" title="发呆" />
<input type="checkbox" name="" title="禁用" disabled />

// 原始风格：
<input type="checkbox" name="" title="写作" lay-skin="primary" checked />
<input type="checkbox" name="" title="发呆" lay-skin="primary" />
<input type="checkbox" name="" title="禁用" lay-skin="primary" disabled />
```

### 12. 表单方框风格

- 内部结构都一样，值得注意的是 复选框/开关/单选框 这些组合在该风格下需要额外添加
- pane 属性（否则会看起来比较别扭）
- layui-form-pane

```c#
// 代码一
<form class="layui-form layui-form-pane" action="">
  // 内部结构都一样，值得注意的是 复选框/开关/单选框 这些组合在该风格下需要额外添加 pane属性（否则会看起来比较别扭），如：
  <div class="layui-form-item" pane>
  <label class="layui-form-label">单选框</label>
  <div class="layui-input-block">
  <input type="radio" name="sex" value="男" title="男" />
  <input type="radio" name="sex" value="女" title="女" checked />
  </div>
  </div>
</form>
```

### 13. 方框风格的表单集合

### 14. 简易完整 DEMO 代码

```c#
<div class="layui-form layui-form-pane" lay-filter="Div_ConfigurationTest_form">

 <div class="layui-form-item" pane="">
 <label class="layui-form-label" style="width: 300px;">目标帐户额(任务会在此停止)</label>
 <div class="layui-input-block" style="margin-left: 300px;">
 <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关" lay-text="开启|关闭">
 </div>
 </div>


 <div class="layui-form-item">
 <div class="layui-form-item">
 <div class="layui-inline">
 <label class="layui-form-label" style="width: 300px;">设定帐户目标额</label>
 <div class="layui-input-inline" style="width: 300px;">
 <input type="text" name="RandomTextminmax" placeholder="￥ 10000" autocomplete="off" class="layui-input" lay-verify="required|number" lay-verType="tips" lay-reqText="请输入要盈利的目标帐户余额,设定一个数字!" />
 </div>
 </div>
 </div>
 </div>

 <div class="layui-btn-group">
 <button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
 </div>

</div>
```

### 15. 全部代码

```c#
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>方框风格的表单集合</legend>
</fieldset>

<form class="layui-form layui-form-pane" action="">
  <div class="layui-form-item">
  <label class="layui-form-label">长输入框</label>
  <div class="layui-input-block">
  <input type="text" name="title" autocomplete="off" placeholder="请输入标题" class="layui-input"  />
  </div>
  </div>
  <div class="layui-form-item">
  <label class="layui-form-label">短输入框</label>
  <div class="layui-input-inline">
  <input type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input"  />
  </div>
  </div>

  <div class="layui-form-item">
  <div class="layui-inline">
  <label class="layui-form-label">日期选择</label>
  <div class="layui-input-block">
 <input type="text" name="date" id="date1" autocomplete="off" class="layui-input" />
  </div>
  </div>
  <div class="layui-inline">
  <label class="layui-form-label">行内表单</label>
  <div class="layui-input-inline">
 <input type="text" name="number" autocomplete="off" class="layui-input" />
  </div>
  </div>
  </div>
  <div class="layui-form-item">
  <label class="layui-form-label">密码</label>
  <div class="layui-input-inline">
  <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input"  />
  </div>
  <div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
  </div>

  <div class="layui-form-item">
  <div class="layui-inline">
  <label class="layui-form-label">范围</label>
  <div class="layui-input-inline" style="width: 100px;">
 <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input" />
  </div>
  <div class="layui-form-mid">-</div>
  <div class="layui-input-inline" style="width: 100px;">
 <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input" />
  </div>
  </div>
  </div>

  <div class="layui-form-item">
  <label class="layui-form-label">单行选择框</label>
  <div class="layui-input-block">
  <select name="interest" lay-filter="aihao">
 <option value=""></option>
 <option value="0">写作</option>
 <option value="1" selected="">阅读</option>
 <option value="2">游戏</option>
 <option value="3">音乐</option>
 <option value="4">旅行</option>
  </select>
  </div>
  </div>

  <div class="layui-form-item">
  <label class="layui-form-label">行内选择框</label>
  <div class="layui-input-inline">
  <select name="quiz1">
 <option value="">请选择省</option>
 <option value="浙江" selected="">浙江省</option>
 <option value="你的工号">江西省</option>
 <option value="你最喜欢的老师">福建省</option>
  </select>
  </div>
  <div class="layui-input-inline">
  <select name="quiz2">
 <option value="">请选择市</option>
 <option value="杭州">杭州</option>
 <option value="宁波" disabled="">宁波</option>
 <option value="温州">温州</option>
 <option value="温州">台州</option>
 <option value="温州">绍兴</option>
  </select>
  </div>
  <div class="layui-input-inline">
  <select name="quiz3">
 <option value="">请选择县/区</option>
 <option value="西湖区">西湖区</option>
 <option value="余杭区">余杭区</option>
 <option value="拱墅区">临安市</option>
  </select>
  </div>
  </div>
  <div class="layui-form-item" pane="">
  <label class="layui-form-label">开关-开</label>
  <div class="layui-input-block">
  <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关"  />
  </div>
  </div>
  <div class="layui-form-item" pane="">
  <label class="layui-form-label">单选框</label>
  <div class="layui-input-block">
  <input type="radio" name="sex" value="男" title="男" checked="" />
  <input type="radio" name="sex" value="女" title="女" />
  <input type="radio" name="sex" value="禁" title="禁用" disabled="" />
  </div>
  </div>
  <div class="layui-form-item layui-form-text">
  <label class="layui-form-label">文本域</label>
  <div class="layui-input-block">
  <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
  </div>
  </div>
  <div class="layui-form-item">
  <button class="layui-btn" lay-submit="" lay-filter="demo2">
  跳转式提交
  </button>
  </div>
</form>
```

### 16. 行内表单 金额范围最大值最小值演示

```c#
// 核心代码就是加了个样式层<div class="layui-input-block">
<div class="layui-input-block">
    <input type="text" name="date" id="test6" autocomplete="off" class="layui-input" lay-key="2">
</div>



<div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label" style="width: 150px;">金额范围</label>
    <div class="layui-input-inline" style="width: 150px;">
      <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input"      />
    </div>
    <div class="layui-form-mid">-</div>
    <div class="layui-input-inline" style="width: 150px;">
      <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input"      />
    </div>
    <div class="layui-form-mid layui-word-aux">金额范围最大值最小值演示</div>
  </div>
</div>
```

### 17. 短输入框 自定义宽度的示例

```c#
<!-- begin -->
<div class="layui-form-pane">
  <div class="layui-form-item" style="width: 440px;" pane>
    <label class="layui-form-label" style="width: 220px;"      >是否开启生成随机数DEMO</label    >
    <div class="layui-input-block" style="margin-left: 220px;">
      <input type="checkbox" name="isOpenCreateRandom" value="true" lay-skin="switch" lay-text="开启|关闭"      />
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 220px;" >每次生成最小最大区间值</label      >
      <div class="layui-input-inline" style="width: 220px;">
 <input type="text" name="RandomTextminmax" placeholder="标准格式如: [1,3]" autocomplete="off" class="layui-input" /
      </div>
    </div>

    <div class="layui-btn-group">
      <button
 class="layui-btn layui-btn-normal layui-btn-sm"
 onclick="layui.form.val('Div_ConfigurationTest_form', { RandomTextminmax: '[5,10]' });"      >
 常用配置参数
      </button>
    </div>
  </div>
</div>

<!-- end -->
```

### 18. 短输入框

```c#

```

### 19. 说明注释类

```c#
<div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
```

### 20. 长输入框

```c#
// 核心代码 Begin
<label class="layui-form-label" style="height: 47px !important;">
<div class="layui-btn-group" style="margin-right: 20px;margin-Left: 0px;">
// 核心代码 End


<div class="layui-form-item layui-form-text">
    <label class="layui-form-label" style="height: 47px !important;">
        <div class="layui-btn-group" style="margin-right: 20px;margin-Left: 0px;">
            <button class="layui-btn layui-btn-normal layui-btn-sm" onclick="open_API_apidatas_for_checkbox('Div_WebConfig_Form','sitenames_aledb','checkbox','Name','SiteNamesText');">
                选择 | <font color="#ffff1e">网站名称</font> | 词库引擎文件
            </button>

        </div>
        <font color="#FF0000">网站名称</font>
        -
        <font color="#0000ff">词库-配置组--(一行一个词库引擎文件,多个时候会随机进入其中一个,随机取出一个词作为网站名称)</font>
    </label>
    <div class="layui-input-block">
        <textarea lay-verify="required" placeholder="请点击按钮选择."
                  class="layui-textarea" name="SiteNamesText" disabled></textarea>
    </div>

</div>
```

### 21. 隐藏文本框 同时去掉效验

```c#
<input type="text" name="username" class="layui-input layui-hide" />
<input type="text" name="guid" class="layui-input layui-hide" />
```

### 21. js 操作 select 和 option 常见用法

- [js 操作 select 和 option 常见用法 - 爱笑的小宇宙 - 博客园](https://www.cnblogs.com/yuer20180726/p/11196488.html)
- [layui 的 form 表单中 select 选择框内容不显示](https://blog.csdn.net/CharlesMo1996/article/details/88884854)

```c#

```
