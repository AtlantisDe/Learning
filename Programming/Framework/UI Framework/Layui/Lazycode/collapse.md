# layui-collapse

## 代码集合

```C#
<div class="layui-collapse" lay-filter="test">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">
      <font color="red">域名配置</font>
    </h2>
    <div class="layui-colla-content">
      <table class="layui-hide" id="domains" lay-filter="domains"></table>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">通用属性</h2>
    <div class="layui-colla-content">
      <p>通用属性</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">其它</h2>
    <div class="layui-colla-content">
      <p>99999</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">备注</h2>
    <div class="layui-colla-content">
      <p>....</p>
    </div>
  </div>
</div>
```

## JS 操作方法

- [用 js 控制 layui 的折叠面板状态，控制某一折叠面板的打开和关闭 - Fly 社区](https://fly.layui.com/jie/34284/)

### 基础方法

- [element模块元素操作文档 - layui](https://www.layui.com/doc/modules/element.html#base)

### 监听操作

```c#
element.on("tab(filter)", function(data) {
  console.log(this); //当前Tab标题所在的原始DOM元素
  console.log(data.index); //得到当前Tab的所在下标
  console.log(data.elem); //得到当前的Tab大容器
});
```

### 全部折叠

```c#
```

### 全部展开

```c#
element.on("tab(filter)", function(data) {
  console.log(this); //当前Tab标题所在的原始DOM元素
  console.log(data.index); //得到当前Tab的所在下标
  console.log(data.elem); //得到当前的Tab大容器
});
```
