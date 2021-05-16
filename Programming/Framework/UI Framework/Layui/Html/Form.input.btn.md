# 文本框后面跟着按钮

- layui-input-inline
- layui-input-block
- [表单中，如何在 input 右侧紧邻位置加按钮？ - Fly 社区](https://fly.layui.com/jie/47163/)

```C#
<div class="layui-form-item">
  <label class="layui-form-label">输入框</label>
  <div class="layui-input-inline">
    <input type="text" name="input" autocomplete="off" class="layui-input" />
  </div>
  <button style="float: left;" type="button" class="layui-btn">按钮</button>
</div>
```

## Demo 样式二

```C#
<div class="layui-form-item">
  <label class="layui-form-label" style="width: 168px;">引擎</label>
  <div class="layui-input-inline">
    <input
      type="text"
      name="Engine"
      placeholder="引擎!"
      class="layui-input"
      readonly="true"
      lay-verify="required"
      autocomplete="off"
      class="layui-input"
    />
  </div>

  <button
    class="layui-btn layui-btn-normal layui-btn-sm"
    style="float: left;height: 36px;"
    onclick="Demo();"
  >
    打开
  </button>
</div>
```
