# Tab

- [element 模块元素操作文档 - Layui](https://www.layui.com/doc/modules/element.html)
- layui.element.init();

## 1. Api

### 1. 切换选项卡

- [Tab 选项卡 - 页面元素 - Layui](https://www.layui.com/doc/element/tab.html)

```c#
// 用于外部切换到指定的Tab项上，参数同上，如：
element.tabChange(filter, layid);
element.tabChange('demo', 'layid'); //切换到 lay-id="yyy" 的这一项

layui.element.tabChange("TabNameDemos", "TabIdUsers");
// onclick
layui.element.tabChange('TabNameDemos', 'TabIdUsers');
layui.element.tabChange('TabNameDemos', 'TabIdUsers');

<div class="layui-tab layui-tab-card" lay-filter="TabNameDemos">
<li lay-id="TabIdUsers">

<button class="layui-btn layui-btn-normal" lay-submit="" onclick="layui.element.tabChange('webcrawlerconfigs_work', 'Sandbox');">  一键转到沙箱环境调试 </button>
```

```c#


parent.layer.close(parent.layer.getFrameIndex(window.name));

function goto_taskqueues() {
  parent.layui.element.tabChange("Tab_DEMO", "Demo_look");
  parent.taskqueues_reload();

  parent.layer.close(parent.layer.getFrameIndex(window.name));
}
```

## 2. Demo 代码

### 1. 代码 0 id

```C#
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

### 2. 代码 1 固定样式

```C#
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

### 3. 代码 2

```C#
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
