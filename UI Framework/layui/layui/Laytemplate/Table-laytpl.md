# Table-laytpl

## 自定义列模板

- [table 数据表格文档 - layui](https://www.layui.com/doc/modules/table.html#templet)

## 三种方式

## 方式一：绑定模版选择器

```js
<script type="text/html" id="titleTpl">
  <a href="/detail/{{d.id}}" class="layui-table-link">{{d.title}}</a>
</script>


```

## 方式二：函数转义

```js
table.render({
  cols: [
    [
      {
        field: "title",
        title: "文章标题",
        width: 200,
        templet: function(d) {
          return (
            "ID：" +
            d.id +
            '，标题：<span style="color: #c00;">' +
            d.title +
            "</span>"
          );
        }
      },
      { field: "id", title: "ID", width: 100 }
    ]
  ]
});
```

## 方式三：直接赋值模版字符

```js
templet: '<div><a href="/detail/{{d.id}}" class="layui-table-link">{{d.title}}</a></div>';

'<div><a href="{{d.url}}" class="layui-table-link">{{d.title}}</a></div>'

'<div><a href="{{d.url}}" title="{{d.description}}" target="_blank" class="layui-table-link">{{d.title}}</a></div>'

<a href="/detail/{{d.id}}" class="layui-table-link">{{d.title}}</a>
// 注意：这里一定要被一层 <div></div> 包裹，否则无法读取到模板

templet:
            '<div><a href="{{d.url}}" title="{{d.description}}" target="_blank" class="layui-table-link">{{d.title}}</a></div>'
```

## laytpl 中如何调用自定义函数

```js
<script>
laytpl.fn = function(){
    return  '自定义函数'
}
</script>

// 模板中调用：

{{# laytpl.fn(); }}
```

## 模板方法

### 模板方法 switch string

```js
, templet: function (d) {
var guid = d.state;
var vue = "";
switch (guid) {
    case "Unknown":
        vue = '<font color="#FF0000">未知</font>'; break;
    case "Started":
        vue = '<font color="#8000ff">已启动</font>'; break;
    case "Starting":
        vue = '<font color="#FF0000">启动中</font>'; break;
    case "Stopped":
        vue = '<font color="#FF0000">已停止</font>'; break;
    case "Stopping":
        vue = '<font color="#FF0000">停止中</font>'; break;
    case "nosite":
        vue = '<font color="#FF0000">无该站点</font>'; break;


}
return vue
}
```

### 模板方法 switch int

```js
,templet: function(d) {
  var guid = d.collected;
  var vue = "";
  switch (guid) {
    case 0:
      vue = '<font color="#FF0000">未采集</font>';
      break;
    case 1:
      vue = '<font color="#8000ff">OK</font>';
      break;
    case 2:
      vue = '<font color="#FF0000">异常抛弃</font>';
      break;
  }
  return vue;
}
```
