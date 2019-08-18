# tab

- [Tab 选项卡 - 页面元素 - layui](https://www.layui.com/doc/element/tab.html)
- [Tab 选项卡 - 在线演示 - layui](https://www.layui.com/demo/tab.html)

## 基础方法

- [element 模块元素操作文档 - layui](https://www.layui.com/doc/modules/element.html#base)
- layui.element.init();

## 切换选项卡

```js
element.tabChange("demo", "layid");
layui.element.tabChange("demo", "layid");
layui.element.tabChange("CDNWORK", "cdnlog");
```

### HTML 代码

```html
<div class="layui-tab layui-tab-card" lay-filter="CDNWORK">
  <ul class="layui-tab-title">
    <li class="layui-this">工作中心</li>
    <li lay-id="demo">刷新</li>
    <li lay-id="demo2">日志</li>
    <li>使用说明</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
      <table class="layui-hide" id="demotable1" lay-filter="demotable1"></table>
      <table class="layui-hide" id="demotable2" lay-filter="demotable2"></table>
    </div>
    <div class="layui-tab-item">
      <div class="layui-form" lay-filter="form_demo">
        <textarea
          name="listsurl"
          required
          lay-verify="required"
          placeholder="请输入一行一条URL"
          class="layui-textarea"
          style="height: 350px;"
        ></textarea>

        <br />

        <button
          class="layui-btn"
          lay-submit
          lay-filter="savetest"
          id="savetest"
        >
          提交
        </button>
      </div>
    </div>
    <div class="layui-tab-item">
      <table class="layui-hide" id="logdemo" lay-filter="logdemo"></table>
    </div>
    <div class="layui-tab-item">
      1.请编辑好,保存 2.刷新日志
    </div>
  </div>
</div>
```

### 选项卡样式集

```html
<div class="layui-tab-item layui-colla-content"></div>
<div class="layui-tab-item layui-show"></div>
```
