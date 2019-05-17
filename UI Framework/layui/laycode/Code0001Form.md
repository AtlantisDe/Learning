# 表单

## 类型

```html
<input
  type="text"
  name="name"
  autocomplete="off"
  placeholder="请输入"
  class="layui-input layui-disabled"
  disabled
  readonly="true"
/>
<input
  type="text"
  name="name"
  autocomplete="off"
  placeholder="请输入"
  class="layui-input"
/>
```

## layui-disabled

```html
<input
  type="text"
  name="ip"
  autocomplete="off"
  placeholder="请输入"
  class="layui-input layui-disabled"
  disabled
  readonly="true"
/>
```

## 按钮提交没反应可能原因

```text
1.未添加 lay-submit
```

## 表单示例代码 1

```html
<div class="layui-form" lay-filter="formTest">
  <textarea
    name="text1"
    required
    lay-verify="required"
    placeholder="请输入"
    class="layui-textarea"
  ></textarea>
  <button class="layui-btn" lay-submit lay-filter="zhuanhuan">转换</button>
  <textarea
    name="text2"
    required
    lay-verify="required"
    placeholder="请输入"
    class="layui-textarea"
  ></textarea>
</div>
```

## 表单内按钮监听

```js
<script>
    layui.form.on('submit(zhuanhuan)', function (data) {
        console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
        console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
        console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
        console.log(data.field.users)
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });
</script>
```

## 文本框

```html
<textarea
  name="cdnurls"
  required
  lay-verify="required"
  placeholder="请输入一行一条URL"
  class="layui-textarea"
  style="height: 350px;"
></textarea>
```

## 单选框

```html
<!-- 表单方框风格 -->
<div class="layui-form-item" pane>
  <label class="layui-form-label">单选框</label>
  <div class="layui-input-block">
    <input type="radio" name="sex" value="男" title="男" />
    <input type="radio" name="sex" value="女" title="女" checked />
  </div>
</div>
```

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
```

## 组装行内表单

```html
<!--
class="layui-inline"：定义外层行内
class="layui-input-inline"：定义内层行内
-->
<!-- 代码一 -->
<div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label">范围</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input
        type="text"
        name="price_min"
        placeholder="￥"
        autocomplete="off"
        class="layui-input"
      />
    </div>
    <div class="layui-form-mid">-</div>
    <div class="layui-input-inline" style="width: 100px;">
      <input
        type="text"
        name="price_max"
        placeholder="￥"
        autocomplete="off"
        class="layui-input"
      />
    </div>
  </div>

  <div class="layui-inline">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="password" name="" autocomplete="off" class="layui-input" />
    </div>
  </div>
</div>
<!-- 代码2 -->
<div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="password" name="" autocomplete="off" class="layui-input" />
    </div>
  </div>
</div>
<!-- 代码3-开关美化 -->
<div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label">页面干扰码</label>
    <div class="layui-input-inline layui-input" style="width: 100px;">
      <input
        type="checkbox"
        name="zzz"
        lay-skin="switch"
        lay-text="开启|关闭"
      />
    </div>
  </div>
</div>
<!-- 代码4-宽度 -->
<div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label" style="width: 120px;">字符随机转码</label>
    <div class="layui-input-inline layui-input" style="width: 160px;">
      <input
        type="checkbox"
        name="zzz"
        lay-skin="switch"
        lay-text="开启|关闭"
      />
    </div>
  </div>
</div>
```

## 复选框

```html
<!-- 属性title可自定义文本（温馨提示：如果只想显示复选框，可以不用设置title）
属性checked可设定默认选中 属性lay-skin可设置复选框的风格
设置value="1"可自定义值，否则选中时返回的就是默认的on -->

<!-- 默认风格： -->
<input type="checkbox" name="" title="写作" checked />
<input type="checkbox" name="" title="发呆" />
<input type="checkbox" name="" title="禁用" disabled />

<!-- 原始风格： -->
<input type="checkbox" name="" title="写作" lay-skin="primary" checked />
<input type="checkbox" name="" title="发呆" lay-skin="primary" />
<input type="checkbox" name="" title="禁用" lay-skin="primary" disabled />
```

## 表单方框风格

- 内部结构都一样，值得注意的是 复选框/开关/单选框 这些组合在该风格下需要额外添加
- pane 属性（否则会看起来比较别扭）

```html
<!-- 代码一 -->
<form class="layui-form layui-form-pane" action="">
  <!-- 内部结构都一样，值得注意的是 复选框/开关/单选框 这些组合在该风格下需要额外添加
  pane属性（否则会看起来比较别扭），如： -->
  <div class="layui-form-item" pane>
    <label class="layui-form-label">单选框</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男" />
      <input type="radio" name="sex" value="女" title="女" checked />
    </div>
  </div>
</form>
<!-- 代码2 -->
```
