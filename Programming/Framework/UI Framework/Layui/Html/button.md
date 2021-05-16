# Button

```C#
<button onclick="copyText()">Copy Text</button>


// 原始 class="layui-btn layui-btn-primary"
// 默认 class="layui-btn"
// 百搭 class="layui-btn layui-btn-normal"
// 暖色 class="layui-btn layui-btn-warm"
// 警告 class="layui-btn layui-btn-danger"
// 禁用 class="layui-btn layui-btn-disabled"
```

## 代码

```C#
<div class="layui-btn-group">
  <button class="layui-btn" lay-submit lay-filter="zhuanhuan">转换</button>
  <button class="layui-btn" lay-submit lay-filter="zhuanhuan">清空</button>
  <button class="layui-btn" lay-submit lay-filter="zhuanhuan">转换</button>
  <button
    class="layui-btn layui-btn-normal"
    onclick="layui.form.val('Div_sitesbatchbuilding_form', { hosts: '' });"
  >
    ☆ 清空
  </button>
</div>
```
