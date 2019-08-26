# layer

- [layer 弹层组件开发文档 - layui](https://www.layui.com/doc/modules/layer.html)
- [layer 官方演示与讲解（jQuery 弹出层插件）](http://layer.layui.com/)

## 常用信息框

### 1. 信息框 弹出关闭

```js
layer.alert(data.message, { icon: 6 });
layer.alert(data.apimsg.message, { icon: 6 });
layer.msg(data.apimsg.message);
layer.close(layer.index);
layer.close(1);
layer.close(index);
layer.closeAll();
layer.closeAll("loading");
layer.load();
logincheck();
```

### 2. 信息框

```js
//信息框-例1

layer.alert("见到你真的很高兴", { icon: 6 });
layer.alert("请先勾选要删除的站点!", { icon: 6, title: "操作提示" });

layer.alert(
  "清空模板引擎数据,重建模板库索引,新增模板或者改动后,这里来刷新一下!",
  { skin: "layui-layer-molv", closeBtn: 0, title: "操作提示" },
  function() {
    layer.close(layer.index);
  }
);

//信息框-例2

layer.msg("你确定你很帅么？", {
  time: 0, //不自动关闭
  btn: ["必须啊", "丑到爆"],
  yes: function(index) {
    layer.close(index);
    layer.msg("雅蠛蝶 O.o", {
      icon: 6,
      btn: ["嗷", "嗷", "嗷"]
    });
  }
});
//信息框-例3

layer.msg("这是最常用的吧");
//信息框-例4

layer.msg("不开心。。", { icon: 5 });
//信息框-例5

layer.msg("玩命卖萌中", function() {
  //关闭后的操作
});
```

### 3. 确认取消信息框

```js
// 绿色图标
layer.confirm("真的删除预设配置吗?", { icon: 6, title: "操作提示" }, function(
  index
) {
  siteconfigdelete(obj);
  layer.close(index);
});

layer.msg("你确定删除？", {
  time: 0, //不自动关闭
  btn: ["确定", "取消"],
  icon: 6,
  title: "确认提交",
  yes: function(index) {
    layer.close(index);
    // 这里Go DO
  }
});

// 无图标
layer.confirm("真的删除预设配置吗?", function(index) {
  siteconfigdelete(obj);
});
```

### 加载层信息框操作层

```js
layer.load();
layer.closeAll("loading");
if (data.code == 200) {
  layer.msg(data.message, function() {});
} else {
  layer.alert(data.message, { icon: 6 });
}
```

### 墨绿深蓝风

```js
//墨绿深蓝风
layer.alert(
  "墨绿风格，点击确认看深蓝",
  {
    skin: "layui-layer-molv", //样式类名
    closeBtn: 0
  },
  function() {
    layer.alert("偶吧深蓝style", {
      skin: "layui-layer-lan",
      closeBtn: 0,
      anim: 4 //动画类型
    });
  }
);
```

### 墨绿风格

```js
//墨绿深蓝风
layer.alert(
  "墨绿风格，点击确认看深蓝",
  {
    skin: "layui-layer-molv", //样式类名
    closeBtn: 0
  },
  function() {}
);
```

```shell
# layer提供了5种层类型。
# 可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）。
# 若你采用layer.open({type: 1})方式调用，则type为必填项（信息框除外）
```

### 墨绿风格常用

```js
function wsclose() {
  ws.close();
  layer.alert(
    "已执行断开服务器通讯!",
    {
      skin: "layui-layer-molv", //样式类名
      closeBtn: 0,
      title: "Socket"
    },
    function(index) {
      // console.log(index);
      layer.close(index);
    }
  );
}
```

## area - 宽高

```shell
area: "500px",
area: ['500px', '300px'],
```

## prompt 输入层

### prompt 常用代码

```js
// 如果是页面层
layer.open({
  type: 1,
  content: "传入任意的文本或html" //这里content是一个普通的String
});
layer.open({
  type: 1,
  content: $("#id") //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
});
//Ajax获取
$.post("url", {}, function(str) {
  layer.open({
    type: 1,
    content: str //注意，如果str是object，那么需要字符拼接。
  });
});
```

```js
//prompt层新定制的成员如下
{
  formType: 1, //输入框类型，支持0（文本）默认1（密码）2（多行文本）
  value: '', //初始时的值，默认空字符
  maxlength: 140, //可输入文本的最大长度，默认500
}


layer.prompt({ title: '输入任何口令，并确认', formType: 1 }, function (pass, index) {
    layer.close(index);
    layer.prompt({ title: '随便写点啥，并确认', formType: 2 }, function (text, index) {
        layer.close(index);
        layer.msg('演示完毕！您的口令：' + pass + '<br>您最后写下了：' + text);
    });
});
```

### prompt 常用

- [layer.prompt 添加多个输入框](https://www.jianshu.com/p/65fea33e6750)
- [layer.prompt 怎么设置为禁用 - Fly 社区](https://fly.layui.com/jie/33944/)
- [layer 自定义 prompt 弹出框内容只读,并选中](https://www.jianshu.com/p/9273e192ba44)

```js
// 有关闭bug
layer.prompt(
  {
    formType: 2,
    id: "remarksPrompt",
    value: "www.google.com",
    title: "请复制链接",
    success: function(layero, index) {
      $("#remarksPrompt textarea").attr("readOnly", "readOnly");
      $("#remarksPrompt textarea").select();
    },
    btn: ["取消"]
  },
  function(value, index, elem) {
    layer.close(index);
  }
);
```

```js
//正式版代码
// begin
layerindexs.prompt_demo = layer.prompt(
  {
    formType: 2,
    value: hosts,
    maxlength: 10000,
    id: "promptId" + "demo",
    title: "请确认即将被删除的数据",
    area: ["188px", "299px"],
    btn: ["确认", "取消"],
    closeBtn: 1,
    // , '取消'
    offset: "auto",
    // area: ['300px', '350px']
    success: function(layero, index) {
      layui
        .$("#" + "promptId" + "batchdelete" + " textarea")
        .attr("readOnly", "readOnly");
    },
    btn2: function(index, layero) {
      // layer.msg("取消");
      layer.close(index);
      return false;
    },
    cancel: function(index) {
      //右上角关闭回调
      // layer.msg("右上角关闭回调");
      layer.close(index);
      return false;
    }
  },
  function(value, index, elem) {
    //确认按钮事件
    layer.close(index);
  }
);
// end
```
