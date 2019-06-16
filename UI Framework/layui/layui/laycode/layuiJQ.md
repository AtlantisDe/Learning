# layuiJQ

## 常用操作

### 选择器

#### collapse

```js
layui.$("div[lay-filter=collapse_siteconfig] .layui-colla-item").length;

layui.$("div[lay-filter=collapse_siteconfig] .layui-colla-item")[0];
```

#### 按钮禁止 激活 基础代码

- [jquery 禁用、启用 button 以及 button 的样式操作 - 你好，我们在哪里见过啊！ - CSDN 博客](https://blog.csdn.net/qq_38455201/article/details/80591530)

```js
layui
  .$(
    layui.$(
      "div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=sites_batchdeploygo]"
    )[0]
  )
  .addClass("layui-btn-disabled");
```

```js
layui
  .$(
    layui.$(
      "div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=sites_batchdeploygo]"
    )[0]
  )
  .removeClass("layui-btn-disabled");
```

#### 按钮禁止 激活 简洁代码

- btn_for_siteconfig_save(true);
- btn_for_siteconfig_save(false);

```js
function btn_for_siteconfig_save(isactive) {
  var btn = layui.$(
    "div[lay-filter=Div_siteconfig_form] button[lay-filter=siteconfig_save]"
  )[0];
  if (isactive == true) {
    layui.$(btn).removeClass("layui-btn-disabled");
    layui.$(btn).removeAttr("disabled");
  } else {
    layui.$(btn).addClass("layui-btn-disabled");
    layui.$(btn).attr("disabled", "disabled");
  }

  return true;
}
```

#### 按钮禁止 激活 封装代码

```js
function btn_for_divform(divform, button, isactive) {
  var btn = layui.$(
    "div[lay-filter=" + divform + "] button[lay-filter=" + button + "]"
  )[0];
  if (isactive == true) {
    layui.$(btn).removeClass("layui-btn-disabled");
    layui.$(btn).removeAttr("disabled");
  } else {
    layui.$(btn).addClass("layui-btn-disabled");
    layui.$(btn).attr("disabled", "disabled");
  }

  return true;
}
```
