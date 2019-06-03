# JS init

## 全局配置

### 弹出层全局配置

```js
var layerindexs = {
  sites_batchbuilding: 0,
  sites_config: 0
};
```

### 表格句柄配置

```js
var tableIns = {
  siteclassnames: null,
  other: null
};
```

### 临时变量配置

```js
var tmpvalues = {
  classnames: "默认站点",
  other: null
};
```

### 按钮关闭层代码

```js
<button
  class="layui-btn layui-btn-normal"
  lay-filter="Btn_Domainconfig_close"
  onclick="layer.close(layerindexs.sites_batchbuilding);"
>
  关闭
</button>
```
