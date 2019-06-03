# 表单

- [表单模块文档 - layui](https://www.layui.com/doc/modules/form.html)

## 组件类型

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

### layui-disabled

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

### 按钮提交没反应可能原因

```text
1.未添加 lay-submit
```

### 表单示例代码 1

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

### 表单内按钮监听

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

### 富文本框

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

### 单选框

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

### 开关

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

### 按钮

```html
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

### 表单初始赋值

```js
//formTest 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
form.val("formTest", {
  username: "贤心", // "name": "value"
  sex: "女",
  auth: 3,
  "check[write]": true,
  open: false,
  desc: "我爱layui"
});

layui.form.val("formTest", {
  username: "贤心",
  sex: "女",
  auth: 3,
  "check[write]": true,
  open: false,
  desc: "我爱layui"
});

layui.form.val("formTest", { username: "贤心" });

onclick = "layui.form.val('formTest', { username: '贤心' });";
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

## 方框风格的表单集合

### 全部代码

```html
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>方框风格的表单集合</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">长输入框</label>
    <div class="layui-input-block">
      <input
        type="text"
        name="title"
        autocomplete="off"
        placeholder="请输入标题"
        class="layui-input"
      />
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">短输入框</label>
    <div class="layui-input-inline">
      <input
        type="text"
        name="username"
        lay-verify="required"
        placeholder="请输入"
        autocomplete="off"
        class="layui-input"
      />
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">日期选择</label>
      <div class="layui-input-block">
        <input
          type="text"
          name="date"
          id="date1"
          autocomplete="off"
          class="layui-input"
        />
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">行内表单</label>
      <div class="layui-input-inline">
        <input
          type="text"
          name="number"
          autocomplete="off"
          class="layui-input"
        />
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input
        type="password"
        name="password"
        placeholder="请输入密码"
        autocomplete="off"
        class="layui-input"
      />
    </div>
    <div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
  </div>

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
      <input
        type="checkbox"
        checked=""
        name="open"
        lay-skin="switch"
        lay-filter="switchTest"
        title="开关"
      />
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

### 网站目录数与每一个目录层级数配置选项

```html
<div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label" style="width: 150px;">目录总数量</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input
        type="text"
        name="onefolder_min"
        placeholder="随机最小值"
        autocomplete="off"
        class="layui-input"
      />
    </div>
    <div class="layui-form-mid">-</div>
    <div class="layui-input-inline" style="width: 100px;">
      <input
        type="text"
        name="onefolder_max"
        placeholder="随机最大值"
        autocomplete="off"
        class="layui-input"
      />
    </div>
    <div class="layui-form-mid layui-word-aux">
      随机栏目:如果想固定数量,直接填最小最大值一致即可.反之随机取其中间值!
    </div>
  </div>
</div>
```

### 说明用法 搜索 [请务必填写用户名] 查看示例

```html
<div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
```

### 长输入框

```html

```

### 短输入框

```html

```
