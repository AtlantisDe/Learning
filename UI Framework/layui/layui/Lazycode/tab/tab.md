# Tab

- layui.element.init();

## 代码 0 id

```html
<div class="layui-tab layui-tab-card" lay-filter="Tab_SEO">
  <ul class="layui-tab-title">
    <li class="layui-this">网站设置</li>
    <li lay-id="">用户管理</li>
    <li>权限分配</li>
    <li>商品管理</li>
    <li>订单管理</li>
  </ul>
  <div class="layui-tab-content" style="height: 100px;">
    <div class="layui-tab-item layui-show">1</div>
    <div class="layui-tab-item">2</div>
    <div class="layui-tab-item">3</div>
    <div class="layui-tab-item">4</div>
    <div class="layui-tab-item">5</div>
    <div class="layui-tab-item">6</div>
  </div>
</div>
```

## 代码 1 固定样式

```html
<div class="layui-tab layui-tab-card">
  <ul class="layui-tab-title">
    <li class="layui-this">网站设置</li>
    <li>用户管理</li>
    <li>权限分配</li>
    <li>商品管理</li>
    <li>订单管理</li>
  </ul>
  <div class="layui-tab-content" style="height: 100px;">
    <div class="layui-tab-item layui-show">1</div>
    <div class="layui-tab-item">2</div>
    <div class="layui-tab-item">3</div>
    <div class="layui-tab-item">4</div>
    <div class="layui-tab-item">5</div>
    <div class="layui-tab-item">6</div>
  </div>
</div>
```

## 代码 2

```html
<div class="layui-tab layui-tab-card">
  <ul class="layui-tab-title">
    <li class="layui-this">网站设置</li>
    <li>用户管理</li>
    <li>权限分配</li>
    <li>商品管理</li>
    <li>订单管理</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">1</div>
    <div class="layui-tab-item">2</div>
    <div class="layui-tab-item">3</div>
    <div class="layui-tab-item">4</div>
    <div class="layui-tab-item">5</div>
    <div class="layui-tab-item">6</div>
  </div>
</div>
```

## Js Api

### 切换选项卡

```php
<button class="layui-btn layui-btn-normal" lay-submit="" onclick="layui.element.tabChange('webcrawlerconfigs_work', 'Sandbox');">  一键转到沙箱环境调试 </button>
```

```js

layui.element.tabChange("Tab_DEMO", "Demo_look");

parent.layer.close(parent.layer.getFrameIndex(window.name));

function goto_taskqueues() {
  parent.layui.element.tabChange("Tab_DEMO", "Demo_look");
  parent.taskqueues_reload();

  parent.layer.close(parent.layer.getFrameIndex(window.name));
}
```
