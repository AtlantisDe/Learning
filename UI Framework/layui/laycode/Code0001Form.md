# 表单

## 类型

```text
<input type="text" name="name" autocomplete="off" placeholder="请输入" class="layui-input layui-disabled" disabled
    readonly="true">
<input type="text" name="name" autocomplete="off" placeholder="请输入" class="layui-input">

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

## 表单其它示例

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
