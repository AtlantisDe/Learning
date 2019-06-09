# layer.open.code

## 常规代码示例

```js
function opensiteweixinusers(obj) {
  var data = obj.data;
  var divid = "#Div" + "_" + "Google";
  if (layui.$(divid).length == 0) {
    layer.msg("标识不存在");
    return;
  }
  var $ = layui.$;
  layer.open({
    type: 1,
    title: false, //不显示标题栏
    closeBtn: false,
    area: "400px",
    // area: ['400px', '388px'],
    shade: 0.1,
    id: "open" + "Div" + "_" + "Google", //设定一个id，防止重复弹出
    // btn: ["保存", "取消"],
    btnAlign: "c",
    yes: function(index, layero) {
      switch ("#Div" + "_" + "Google") {
        case "#Div" + "_" + "Google":
          break;
      }
      // obj.data = data;
      // layer.close(index);
    },
    moveType: 0, //拖拽模式，0或者1
    content: $(divid),
    success: function(layero) {
      switch ("#Div" + "_" + "Google") {
        case "#Div" + "_" + "Google":
          //dosomething
          break;
        default:
          layer.msg("标识不存在");
          return;
      }
    }
  });
}
```

### 配置弹出宽高参数

```js
type: 1,
title: "新建预设配置项", //不显示标题栏
closeBtn: 1,
// area: "1200px",
area: ["1200px", "80%"],
shadeClose: true,
maxmin: true,
shade: 0.3,
```