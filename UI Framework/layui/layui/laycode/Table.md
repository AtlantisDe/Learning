# 表格

## 基础参数

```js
// 头工具栏事件 或者 监听行工具事件 参数[均是表格 lay-filter]
,page: true
page: true,
,toolbar: '#toolbarDemo'
toolbar: '#toolbarDemo',
, data: demodata
, page: true
, response: {
    statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
}
, parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
    return {
        "code": 200, //解析接口状态
        "msg": "ok", //解析提示文本
        "count": 10, //解析数据长度
        "data": res.datas //解析数据列表
    };
}
, data: res.demodata
```

## 刷新

```js
$(".layui-laypage-btn")[0].click();
layui.$(".layui-laypage-btn")[0].click();
// 方式一
layui.$("div[lay-id=sites] .layui-laypage-btn")[0].click();
// 方式二
tableIns.sites.reload({
  url:
    "/Module/Consol/api.aspx?Action=getworksites" +
    "&classname=" +
    tmpvalues.classname,
  page: {
    curr: 1
  }
});
```

### JQ 操作代码

```js
layui.$("div[lay-id=LAY-table-206]");
layui.$("div[lay-id=sties]");
// demo
$("div[lay-id=sties]")
  .find('div[id^="div2"]')
  .find('p[id^="p2"]')
  .css("color", "red");

layui
  .$("div[lay-id=sties]")
  .find('.layui-laypage-btn"]')[0]
  .click();
// 正确语法
layui.$("div[lay-id=sites] .layui-laypage-btn").length;

layui.$("div[lay-id=sites] .layui-laypage-btn")[0];

layui.$("div[lay-id=sites]").length;

layui.$("div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=Btn_Domainconfig_close]")[0];
layui.$(layui.$("div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=Btn_Domainconfig_close]")[0]).addClass("layui-btn-disabled");
layui.$(layui.$("div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=Btn_Domainconfig_close]")[0]).removeClass("layui-btn-disabled");

```

## 常用初始代码

### 请求 URL 分页默认数据格式

```js
layui.use("table", function() {
  var table = layui.table;

  table.render({
    elem: "#test",
    url: "/demo/table/user/",
    cols: [
      [
        { field: "id", width: 80, title: "ID", sort: true },
        { field: "username", width: 80, title: "用户名" },
        { field: "sex", width: 80, title: "性别", sort: true },
        { field: "city", width: 80, title: "城市" },
        { field: "sign", title: "签名", minWidth: 150 },
        { field: "experience", width: 80, title: "积分", sort: true },
        { field: "score", width: 80, title: "评分", sort: true },
        { field: "classify", width: 80, title: "职业" },
        { field: "wealth", width: 135, title: "财富", sort: true }
      ]
    ],
    page: true
  });
});
```

### 表格 cols

```js
table.render({
  cols: [
    [
      //标题栏
      { field: "username", title: "联系人", width: 80, rowspan: 2 }, //rowspan即纵向跨越的单元格数
      { field: "amount", title: "金额", width: 80, rowspan: 2 },
      { align: "center", title: "地址", colspan: 3 } //colspan即横跨的单元格数，这种情况下不用设置field和width
    ],
    [
      { field: "province", title: "省", width: 80 },
      { field: "city", title: "市", width: 120 },
      { field: "county", title: "详细", width: 300 }
    ]
  ]
});
```

### 常用解析任意数据表格

```js
<script>
layui.use('table', function(){
  var table = layui.table;

  table.render({
    elem: '#test'
    ,url:'/test/table/demo3.json'
    ,toolbar: true
    ,title: '用户数据表'
    ,totalRow: true
    ,cols: [[
      {field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true, totalRowText: '合计行'}
      ,{field:'username', title:'用户名', width:120, edit: 'text'}
      ,{field:'email', title:'邮箱', width:150, edit: 'text'}
      ,{field:'experience', title:'积分', width:80, sort: true, totalRow: true}
      ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
      ,{field:'logins', title:'登入次数', width:100, sort: true, totalRow: true}
      ,{field:'sign', title:'签名'}
      ,{field:'city', title:'城市', width:100}
      ,{field:'ip', title:'IP', width:120}
      ,{field:'joinTime', title:'加入时间', width:120}
    ]]
    ,page: true
    ,response: {
      statusCode: 200 //重新规定成功的状态码为 200，table 组件默认为 0
    }
    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
      return {
        "code": res.status, //解析接口状态
        "msg": res.message, //解析提示文本
        "count": res.total, //解析数据长度
        "data": res.rows.item //解析数据列表
      };
    }
  });
});
</script>

```

### 常用解析 少量静态动态数据

```js
<script>
function sitesbatchdeployForselect() {
  if (tmpvalues.issitesbatchdeployForselectinit == true) {
    tableIns.sitesbatchdeployForselect.re[Getting Title at 57:58](http://window.open(articleItem.url, '_blank');)load({});
    return;
  }

  tableIns.sitesbatchdeployForselect = layui.table.render({
    elem: "#sitesbatchdeployForselect",
    title: "批量部署网站",
    totalRow: false,
    cols: [
      [
        {
          field: "id",
          width: 66,
          title: "编号",
          sort: false,
          templet: function(d) {
            return d.LAY_TABLE_INDEX + 1;
          }
        },
        { field: "host", title: "网站", width: 200 },
        { field: "beizhu", title: "备注", width: 100 }
      ]
    ],
    page: true,
    data: tmpvalues.sitesbatchdeployForselect
  });
}
</script>

```

## barDemo 行工具按钮

```js
<script type="text/html" id="bar_Demo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">
    编辑
  </a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
    删除
  </a>
</script>
```

## 表格常用细节事项

### 头工具栏事件toolbar 或者 监听行工具事件tool 参数[均是表格 lay-filter]

```html
<table class="layui-hide" id="test" lay-filter="test"></table>
```

```js
//头工具栏事件
layui.table.on("toolbar(test)", function(obj) {
  var checkStatus = table.checkStatus(obj.config.id);
  switch (obj.event) {
    case "getCheckData":
      var data = checkStatus.data;
      layer.alert(JSON.stringify(data));
      break;
    case "getCheckLength":
      var data = checkStatus.data;
      layer.msg("选中了：" + data.length + " 个");
      break;
    case "isAll":
      layer.msg(checkStatus.isAll ? "全选" : "未全选");
      break;
  }
});

//监听行工具事件
layui.table.on("tool(test)", function(obj) {
  var data = obj.data;
  //console.log(obj)
  if (obj.event === "del") {
    layer.confirm("真的删除行么", function(index) {
      obj.del();
      layer.close(index);
    });
  } else if (obj.event === "edit") {
    layer.prompt(
      {
        formType: 2,
        value: data.email
      },
      function(value, index) {
        obj.update({
          email: value
        });
        layer.close(index);
      }
    );
  }
});

//监听行工具事件 Demo
// <table id="demo" lay-filter="test"></table>
// 这个bar_do 是lay-filter
layui.table.on("tool(bar_do)", function(obj) {
  var data = obj.data;
  //console.log(obj)
  if (obj.event === "lookdo") {
  } else if (obj.event === "editdo") {
  } else if (obj.event === "adddo") {
  }
});
```

### 监听单元格编辑

```js
<table class="layui-table" lay-data="{url:'/test/table/demo1.json', id:'test3'}" lay-filter="test3">
<th lay-data="{field:'sex', width:80, edit: 'text'}">性别</th>

<script>
layui.use('table', function(){
  var table = layui.table;

  //监听单元格编辑
  table.on('edit(test3)', function(obj){
    var value = obj.value //得到修改后的值
    ,data = obj.data //得到所在行所有键值
    ,field = obj.field; //得到字段
    layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
  });


});
</script>
```

### 开启头部工具栏

```js
//表格内参数
,toolbar: '#toolbarDemo'
//页面JS
<script type="text/html" id="toolbar_Demo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">
      获取选中行数据
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">
      获取选中数目
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">
      验证是否全选
    </button>
  </div>
</script>
```

### 开启头部工具栏 2

```js
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">
      获取选中行数据
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">
      获取选中数目
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">
      验证是否全选
    </button>
  </div>
</script>
```

### 监听头部工具栏事件

- [table 数据表格文档 - layui](https://www.layui.com/doc/modules/table.html#ontoolbar)

```js
原始容器
<table id="demo" lay-filter="test"></table>

工具栏模板：
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
    <button class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
    <button class="layui-btn layui-btn-sm" lay-event="update">编辑</button>
  </div>
</script>

<script;>
//JS 调用：
table.render({
  elem: '#demo'
  ,toolbar: '#toolbarDemo'
  //,…… //其他参数
});

//监听事件
table.on('toolbar(test)', function(obj){
  var checkStatus = table.checkStatus(obj.config.id);
  switch(obj.event){
    case 'add':
      layer.msg('添加');
    break;
    case 'delete':
      layer.msg('删除');
    break;
    case 'update':
      layer.msg('编辑');
    break;
  };
});
</script>
```

### 监听工具条

```js
//监听工具条
table.on("tool(test)", function(obj) {
  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
  var data = obj.data; //获得当前行数据
  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
  var tr = obj.tr; //获得当前行 tr 的DOM对象

  if (layEvent === "detail") {
    //查看
    //do somehing
  } else if (layEvent === "del") {
    //删除
    layer.confirm("真的删除行么", function(index) {
      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
      layer.close(index);
      //向服务端发送删除指令
    });
  } else if (layEvent === "edit") {
    //编辑
    //do something

    //同步更新缓存对应的值
    obj.update({
      username: "123",
      title: "xxx"
    });
  }
});
```

### 头部工具栏与行工具栏定义标识

- 同是 toolbar 标签

```js
toolbar: "#toolbar_sitesconfigs",
```

- 头部工具栏定义

```js
toolbar: "#toolbar_xxxx",
```

```js
<script type="text/html" id="toolbar_sites">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="siteitem_add">
      新建网站
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="sites_refresh">
      刷新站群
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="siteitem_batchbuilding">
      ① 批量建站
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="siteitem_batchbuilding">
      ② 批量部署配置
    </button>
    <button class="layui-btn layui-btn-sm" lay-event="siteitem_batchdelete">
      批量删除站点
    </button>
  </div>
</script>
```

```js
layui.table.on("toolbar(sites)", function(obj) {
  var data = obj.data;
  if (obj.event === "sites_refresh") {
    tableIns.sites.reload({});
  } else if (obj.event === "siteitem_add") {
    layer.alert("接口已弃用!请移步批量建站!", { icon: 6 });
    // siteadd();
  } else if (obj.event === "siteitem_batchbuilding") {
    open_sites_batchbuilding(obj);
  } else if (obj.event === "siteitem_batchdelete") {
    // layer.alert(JSON.stringify(datasites));
  }
});
```

- 行工具栏定义

```js
toolbar: "#bar_XXX",
```

```js
<script type="text/html" id="bar_sitesconfigs">
  <a class="layui-btn layui-btn-xs" lay-event="siteitem_view">
    查看与修改配置
  </a>
  <a class="layui-btn layui-btn-xs" lay-event="siteitem_delete">
    删除
  </a>
</script>
```

```js
layui.table.on("tool(sitesconfigsclassnames)", function(obj) {
  var data = obj.data;
  // console.log(obj);
  tmpvalues.siteconfigclassname = obj.data.classname;
  if (obj.event === "showsites_forsiteconfigsclassname") {
    tableIns.sitesconfigs.reload({
      url:
        "/Module/Consol/api.aspx?Action=getsitesconfigs" +
        "&classname=" +
        tmpvalues.siteconfigclassname,
      page: {
        curr: 1
      }
    });
  } else if (obj.event === "siteitem_stop") {
  } else if (obj.event === "siteitem_start") {
  }
});
```

### 赋值数据刷新表格方法与代码片段

```js
function siteconfigsresourcesinit() {
  if (tmpvalues.issiteconfigsresourcesinit == true) {
    tableIns.sconf_sitenameitems.reload({
      data: tmpvalues.siteconfigsresources.sitenameitems
    });
    tableIns.sconf_classnameitems.reload({
      data: tmpvalues.siteconfigsresources.classnameitems
    });
    tableIns.sconf_keywordnameitems.reload({
      data: tmpvalues.siteconfigsresources.keywordnameitems
    });
    tableIns.sconf_tplitems.reload({
      data: tmpvalues.siteconfigsresources.tplitems
    });
    tableIns.sconf_exts.reload({
      data: tmpvalues.siteconfigsresources.extitems
    });

    return;
  }

  tmpvalues.issiteconfigsresourcesinit = true;

  tableIns.sconf_tplitems = layui.table.render({
    .........................后面写代码.......
```

## 开启复选框 获取选中行数据

```js
var checkStatus = layui.table.checkStatus("sites"),
  datasites = checkStatus.data;
```
