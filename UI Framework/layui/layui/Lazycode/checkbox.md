# checkbox

## 开关

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

```js
if (data.field.sysData == "1") {
  data.field.sysData = "1";
} else {
  data.field.sysData = "0";
}
```
