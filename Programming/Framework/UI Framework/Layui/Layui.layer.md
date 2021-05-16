# layer

- [layer 弹层组件开发文档 - layui](https://www.layui.com/doc/modules/layer.html)
- [layer 官方演示与讲解（jQuery 弹出层插件）](http://layer.layui.com/)

## 1. 常用信息框

### 1. 信息框 弹出自动关闭

```c#
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

//eg1
layer.msg('只想弱弱提示');
//eg2
layer.msg('有表情地提示', {icon: 6});
//eg3
layer.msg('关闭后想做些什么', function(){
  //do something
});
//eg
layer.msg('同上', {
  icon: 1,
  time: 2000 //2秒关闭（如果不配置，默认是3秒）
}, function(){
  //do something
});

```

### 2. 信息框

```c#
// 常用弹出信息框点击按钮关闭类型
layer.alert(  '弹出信息框',  { skin: 'layui-layer-molv', closeBtn: 0, title: '操作提示' },  function() {    layer.close(layer.index);  });

layer.alert(  '弹出信息框',  { skin: 'layui-layer-molv', closeBtn: 0, title: '操作提示' , area: ["1200px", "80%"]},  function() {    layer.close(layer.index);  });


layer.alert(  '弹出信息框',  { skin: 'layui-layer-molv', closeBtn: 0, title: '操作提示' , area: ["90%", "80%"]},  function() {    layer.close(layer.index);  });

// 用法 容易把整个视图区域挤满
layer.alert(  '弹出信息框',  { skin: 'layui-layer-molv', closeBtn: 0, title: '操作提示' , area: ["auto", "auto"]},  function() {    layer.close(layer.index);  });


```

```c#
//信息框-例1

layer.alert("见到你真的很高兴", { icon: 6 });
layer.alert("请先勾选要删除的站点!", { icon: 6, title: "操作提示" });
layer.alert(  "弹出信息框", { skin: "layui-layer-molv", closeBtn: 0, title: "操作提示" },
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

```c#
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

### 4. 加载层信息框操作层

```c#
layer.load();
layer.closeAll("loading");
if (data.code == 200) {
  layer.msg(data.message, function() {});
} else {
  layer.alert(data.message, { icon: 6 });
}
```

### 5. 墨绿深蓝风

```c#
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

### 6. 绿风格

```c#
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

### 7. 墨绿风格常用

```c#
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

### 8. 宽高

- [layer.msg 自定义设置宽度，高度默认](https://blog.csdn.net/qq_30123829/article/details/81563126)

```shell
area: "500px",
area: ['500px', '300px'],
area: ["1200px", "80%"],
```

### 0. 其它常用

```c#
<button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="" onclick="FunDataRequestSuccessfully('功能稍后上!');">修改管理密码</button>

```

### 1. 弹出信息框完成后执行其它动作

```c#
if (data.code == 200) {
        layer.msg(data.message, function() {
          fun_hereNewFunction();
        });
```

### 2.确认信息框再谈信息框演示

```c#

layer.confirm('is not?', {icon: 3, title:'提示'}, function(index){
  //do something

  layer.close(index);
});

//eg1
layer.confirm('is not?', {icon: 3, title:'提示'}, function(index){
  //do something

  layer.close(index);
});
//eg2
layer.confirm('is not?', function(index){
  //do something

  layer.close(index);
});


layer.confirm("真的删除吗?", function(index) {
  layer.alert(
    "请使用批量删除功能",
    { skin: "layui-layer-molv", closeBtn: 0, title: "操作提示" },
    function() {
      layer.close(layer.index);
    }
  );}

```

## 1. layer.open

-[layer 弹层组件开发文档](https://www.layui.com/doc/modules/layer.html)

### 0. 基础参数

```c#


layer.open({
      type: 2,
      title: '很多时候，我们想最大化看，比如像这个页面。',
      closeBtn: 1,//0 不显示关闭按钮 1 显示关闭按钮
      shadeClose: true,
      shade: false,
      maxmin: true, //开启最大化最小化按钮
      area: ['893px', '600px'],
      content: '//fly.layui.com/'
    });
  }

  layer.open({
  type: 1,
  title: "LayUI",
  shadeClose: true,
  shade: 0.8,
  id: "OpenGuidDemo",
  area: ["90%", "80%"],
  maxmin: true,
  content:
    '<div class="layui-tab layui-tab-card"><ul class="layui-tab-title"><li class="layui-this">Home</li><li>Debug</li><li>Logs</li><li>Helo</li></ul><div class="layui-tab-content"style="height: 100%;"><div class="layui-tab-item layui-show"><div class="layui-form layui-form-pane"lay-filter="WorkControl"><div class="layui-form-item"><div class="layui-inline"><label class="layui-form-label"style="width: 188px;">User Name</label><div class="layui-input-inline"style="width: 200px;"><input type="text"name="lotteryName"placeholder="admin"autocomplete="off"class="layui-input"/></div></div></div></div><button type="button"class="layui-btn layui-btn-normal">开始</button><button type="button"class="layui-btn layui-btn-danger">停止</button></div><div class="layui-tab-item">Test</div><div class="layui-tab-item"><textarea lay-verify="required"placeholder="OK"class="layui-textarea"name="WorkLogs"style="height: 300px;"></textarea></div><div class="layui-tab-item">Hello World!</div></div></div>',
  success: function (layero) {
    console.log("OK");
  },
});

```

### 1. 常规代码示例

```c#
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
    yes: function (index, layero) {
      switch ("#Div" + "_" + "Google") {
        case "#Div" + "_" + "Google":
          break;
      }
      // obj.data = data;
      // layer.close(index);
    },
    moveType: 0, //拖拽模式，0或者1
    content: $(divid),
    success: function (layero) {
      switch ("#Div" + "_" + "Google") {
        case "#Div" + "_" + "Google":
          //dosomething
          break;
        default:
          layer.msg("标识不存在");
          return;
      }
    },
  });
}
```

### 1. 配置弹出宽高参数

```c#
type: 1,
title: "新建预设配置项", //不显示标题栏
closeBtn: 1,
// area: "1200px",
area: ["1200px", "80%"],
//  area: ["90%", "80%"],
shadeClose: true,
maxmin: true,
shade: 0.3,
```

### 2. 配置弹出宽高参数 同时包含最大化最小化窗口属性 代码一

```c#
function open_demo(host) {
  layer.open({
    type: 2,
    title: "部署日志",
    shadeClose: true,
    shade: 0.8,
    area: ["1200px", "80%"],
    maxmin: true,
    content: "/demo.aspx?host=" + host,
  });
}

layer.open({
  type: 2,
  title: "在线工具V1.0",
  shadeClose: true,
  shade: 0.8,
  area: ["90%", "80%"],
  maxmin: true,
  content: "/App/Console/BaiduUrlsPush",
});
```

### 3. 本窗口关闭,父窗口执行

```c#
parent.layer.close(parent.layer.getFrameIndex(window.name));

// 本窗口
layer.close(LayerIndexs.NewWebsites);
```

### 4. 窗口 无滚动条 (设计时候把 HTML 代码长宽定好打开的时候也规定好长高即可)

```c#
LayerIndexs.NewWebsites = layer.open({
  type: 2,
  title: "批量新建网站",
  closeBtn: 1, //0 不显示关闭按钮 1 显示关闭按钮
  shadeClose: true,
  shade: false,
  scrollbar: false,
  maxmin: true, //开启最大化最小化按钮
  area: ["1008px", "460px"],
  content: "/App/Console/NewWebsites",
});
```

### 4. 本窗口关闭,父窗口数据互通 注意只能传文本值不能传对象!记得用 JSON 序化

```c#
/**批量部署网站数据*/
function FunSiteDeploymentData() {
    var Items = layui.table.checkStatus("Sites").data;
    return JSON.stringify(Items);
}


/**即将部署网站 */
var Items = JSON.parse(parent.FunSiteDeploymentData());
```

## 2. layer.tips

- [layer tip 功能，如何让 tip 不消失，通过手动点击才消失 - Fly 社区](https://fly.layui.com/jie/4572/)

### 1. 常用代码

```c#
// tips层-下
layer.tips('哈喽', '#aa', {  tips: [3, '#78BA32']});

layer.tips("Demo", "div[lay-id='Demoid']", {
  tips: [0, "#3595CC"],
  area: ["350px", "43px"],
  time: 3000
});

layer.tips("默认就是向右的", obj, {
  tips: [0, "#3595CC"],
  time: 0
});

var msg = "已选中查看:" + tmpvalues.siteconfigclassname;
layer.tips(msg, obj, { time: 0 });
```

### 2. layui 鼠标移上去的 hover 效果 tips

- [layui 鼠标移上去的 hover 效果 tips 杨葱儿-CSDN 博客](https://blog.csdn.net/weixin_44285250/article/details/86222792)

```c#
<a href="javascript:;" data-d="{{d.descript}}" onmouseover="show_shopm(this)">{{d.name}}</a>


/**显示描述小tips*/
function FunShowSmallTips(t) {
    var row = layui.$(t).attr('data-d'); //获取显示内容
    layer.tips(row, t, {
        tips: [1, '#3595CC'],
        time: 4000
    })
}
```

## 3. prompt 输入层

- [layer 弹层组件开发文档 - Layui](https://www.layui.com/doc/modules/layer.html#layer.prompt)

### 1. prompt 常用代码

```c#
layer.prompt({ formType: 2, value: responseJSON.Data, title: "全部栏目", area: ["200px", "500px"] }, function (e, a, l) { layer.close(a) });


layer.prompt({formType:2,value:"初始值",title:"请输入值",area:["800px","350px"]},function(e,a,l){alert(e),layer.close(a)});
layer.prompt({formType:2,value:"初始值",title:"请输入值",area:["200px","500px"]},function(e,a,l){alert(e),layer.close(a)});
layer.prompt({formType:2,value:"初始值",title:"请输入值",area:["200px","500px"]},function(e,a,l){layer.close(a)});



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

```c#
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

### 2. prompt 常用

- [layer.prompt 添加多个输入框](https://www.jianshu.com/p/65fea33e6750)
- [layer.prompt 怎么设置为禁用 - Fly 社区](https://fly.layui.com/jie/33944/)
- [layer 自定义 prompt 弹出框内容只读,并选中](https://www.jianshu.com/p/9273e192ba44)

```c#
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

```c#
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

## 4. 页面层

```c#
//页面层
// layui-layer-rim 加上边框
layer.open({type:1,skin:"layui-layer-rim",area:["420px","240px"],content:"html内容"});
```
