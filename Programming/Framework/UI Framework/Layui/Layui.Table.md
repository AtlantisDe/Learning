# 数据表格

- [table 数据表格文档 - Layui](https://www.layui.com/doc/modules/table.html)

## 0. Table-api

### 1. Get data

```c#
layui.table.cache;
layui.table.cache.linkitems;
layui.table.cache.Sites
layui.$.extend(layui.table.cache["test"][0], demo_row_updatedate);
layui.table.cache["webcrawlerconfigs"];

layui.table.checkStatus("webcrawlerconfigs").data;

demo_row_tr = layui.$(obj.elem).parents("tr");
demo_row_tr[0].dataset.index;
demo_row_tr[0].dataset.index;

//表格id
//表格id
// var layId = layui.$(obj.elem).parents('.layui-table-view').attr('lay-id');
var layId = layui.$(obj.elem).parents(".layui-table-view").attr("lay-id");

//监听行单击事件
table.on("row(layui_table)", function (obj) {
  var rowIndex = obj.tr[0].dataset.index; //行索引
  // console.log(obj.data) //得到当前行数据
  console.log("行单击->索引：", rowIndex);
});

//表格id
var layId = layui.$(obj.elem).parents(".layui-table-view").attr("lay-id");

//单元格数据对象
var data = {
  sex: obj.elem.checked,
};
//行索引
var rowIndex = layui.$(obj.elem).parents("tr")[0].dataset.index;
```

### 2. 获取选中值

```c#
layui.table.checkStatus("linkitems").data;
```

### 3. 数据表格能添加请求头吗

- [数据表格能添加请求头吗？ - Fly 社区](https://fly.layui.com/jie/26666/)

### 3. 更新表格单元格数据口,更新单元格的内容

- [layui 更新表格单元格数据口,更新单元格的内容 - 与 f - 博客园](https://www.cnblogs.com/fps2tao/p/9467092.html)

```c#
//监听工具条
table.on("tool(edit)", function (obj) {
  var data = obj.data;
  if (obj.event === "getinvitation") {
    //有个ajax更新,成功后回调函数写下面的更新
    //同步更新表格和缓存对应的值
    obj.update({
      is_signin_today: "1",
    });
  }
});
```

### 4. 表格单元格开关数据同步

```c#
function dataSynTablerowSwitch(obj) {
  layer.tips(this.value + " " + this.name + "：" + obj.elem.checked, obj.othis);
  var rowIndex = layui.$(obj.elem).parents("tr")[0].dataset.index;
  var layId = layui.$(obj.elem).parents(".layui-table-view").attr("lay-id");
  layui.$.extend(layui.table.cache[layId][rowIndex], {
    [obj.elem.name]: obj.elem.checked,
  });
}
```

### 5. 表格分页显示

```c#
TableIns.Sites.reload({ page: { curr: 1, limit: 1 } });

tableIns.smarttags.config.page.limit = 10;
tableIns.smarttags.reload({});
tableIns.smarttags.reload({ page: { curr: 1, limit: 50 } });
tableIns.sites.reload({ page: { curr: 1, limit: 50 } });
TableIns.Articles.reload({ page: { curr: 1 } });

tableIns.sites.reload({
  where: { value1: tmpvalues.Classname },
  page: { curr: 1 }
});
```

### 6. 常用数据刷新

```c#

parent.TableIns.WebConfigCategory.reload();
parent.TableIns.WebConfigs.reload();
parent.layer.close(parent.layer.getFrameIndex(window.name));
TableIns.BatchUpdateWebConfigItems.reload({data: BatchUpdateWebConfigTypeItems});
```

### 7. done - 数据渲染完的回调

- [table 数据表格文档 - Layui](https://www.layui.com/doc/modules/table.html#done)

```c#

 done: function(res, curr, count){},


table.render({ //其它参数在此省略
  done: function(res, curr, count){
    //如果是异步请求数据方式，res即为你接口返回的信息。
    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
    console.log(res);

    //得到当前页码
    console.log(curr);

    //得到数据总量
    console.log(count);
  }
});
```

## 1. 基础参数

```c#
// 头工具栏事件 或者 监听行工具事件 参数[均是表格 lay-filter]
var limits = [10,20,30,40,50,60,70,80,90]
limits: [150, 200, 300, 600, 1000],
limits: [1,10,20,30,40,50,60,70,80,90,100,150, 200, 300, 600, 1000],

limits:[1,10,20,30,40,50,60,70,80,90],
limits:[10,20,30,40,50,60,70,80,90],
totalRow: false,
limits: [10, 20, 100, 150, 200, 300],
page: true,
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

### 0. 设定列类型(cols.type)

```c#
radio
checkbox

type String 设定列类型。可选值有：
normal（常规列，无需设定）
checkbox （复选框列）
radio （单选框列，layui 2.4.0 新增）
numbers（序号列）
space（空列）
任意一个可选值
```

## 2. 刷新

```c#
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
    curr: 1,
  },
});
```

### 3. JQ 操作代码

```c#
layui.$("div[lay-id=LAY-table-206]");
layui.$("div[lay-id=sties]");
// demo
$("div[lay-id=sties]")
  .find('div[id^="div2"]')
  .find('p[id^="p2"]')
  .css("color", "red");

layui.$("div[lay-id=sties]").find('.layui-laypage-btn"]')[0].click();
// 正确语法
layui.$("div[lay-id=sites] .layui-laypage-btn").length;

layui.$("div[lay-id=sites] .layui-laypage-btn")[0];

layui.$("div[lay-id=sites]").length;

layui.$(
  "div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=Btn_Domainconfig_close]"
)[0];
layui
  .$(
    layui.$(
      "div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=Btn_Domainconfig_close]"
    )[0]
  )
  .addClass("layui-btn-disabled");
layui
  .$(
    layui.$(
      "div[lay-filter=Div_sitesbatchdeploy_form] button[lay-filter=Btn_Domainconfig_close]"
    )[0]
  )
  .removeClass("layui-btn-disabled");
```

## 4. 常用初始代码

### 1. 请求 URL 分页默认数据格式

```c#
layui.use("table", function () {
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
        { field: "wealth", width: 135, title: "财富", sort: true },
      ],
    ],
    page: true,
  });
});
```

### 2. 表格 cols

```c#
table.render({
  cols: [
    [
      //标题栏
      { field: "username", title: "联系人", width: 80, rowspan: 2 }, //rowspan即纵向跨越的单元格数
      { field: "amount", title: "金额", width: 80, rowspan: 2 },
      { align: "center", title: "地址", colspan: 3 }, //colspan即横跨的单元格数，这种情况下不用设置field和width
    ],
    [
      { field: "province", title: "省", width: 80 },
      { field: "city", title: "市", width: 120 },
      { field: "county", title: "详细", width: 300 },
    ],
  ],
});
```

### 3. 常用解析任意数据表格

```c#
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

### 4. 内存分页 常用解析 少量静态动态数据

```c#
<script>
function sitesbatchdeployForselect() {
  if (tmpvalues.issitesbatchdeployForselectinit == true) {
    tableIns.sitesbatchdeployForselect.reload({data: tmpvalues.tplitems });
    return;
  }

  if (tableIns.aitems != null) {
      tableIns.aitems.reload({});
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

### 5. 内存分页代码示例一

```c#
function fun_tplitems() {
  if (tableIns.tplitems != null) {
    tableIns.tplitems.reload({});
    return;
  }

  tableIns.tplitems = layui.table.render({
    elem: "#tpls",
    // url: "/Module/Consol/api.aspx?Action=sitesconfigsclassnames",
    // toolbar: "#toolbar_aitems",
    title: "沙箱调试",
    totalRow: false,
    cols: [
      [
        {
          field: "id",
          width: 66,
          title: "编号",
          sort: false,
          templet: function (d) {
            return d.LAY_TABLE_INDEX + 1;
          },
        },
        { field: "name", title: "英文标识", width: 160 },
        { field: "path", title: "模块地址", width: 100 },
        { field: "tags", title: "标签预览", width: 100 },
        // { field: "version", title: "版本号", width: 100 },
        { field: "beizhu", title: "备注", width: 100 },
        {
          fixed: "right",
          title: "操作",
          toolbar: "#bar_tpls",
          width: 500,
        },
      ],
    ],
    page: true,
    limit: 10,
    data: tmpvalues.aitems,
  });
}
```

## 5. barDemo 行工具按钮

```c#
<script type="text/html" id="bar_Demo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">
    编辑
  </a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
    删除
  </a>
</script>
```

## 6. Table event

### 1. 头工具栏事件 toolbar 或者 监听行工具事件 tool 参数[均是表格 lay-filter]

```c#
layui.table.on("tool(Demoitems)", function(obj) {
  // var data = obj.data;
  console.log(obj);
  if (obj.event === "111") {
  } else if (obj.event === "demoitem_delete") {
    layer.confirm("真的要删除吗?", function(index) {
      layer.close(index);
      fun_demoitem_delete(name, obj.data.Guid);
    });
  } else if (obj.event === "000") {
  }
});
```

```C#
<table class="layui-hide" id="test" lay-filter="test"></table>
```

```c#
//头工具栏事件
layui.table.on("toolbar(test)", function (obj) {
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
layui.table.on("tool(test)", function (obj) {
  var data = obj.data;
  //console.log(obj)
  if (obj.event === "del") {
    layer.confirm("真的删除行么", function (index) {
      obj.del();
      layer.close(index);
    });
  } else if (obj.event === "edit") {
    layer.prompt(
      {
        formType: 2,
        value: data.email,
      },
      function (value, index) {
        obj.update({
          email: value,
        });
        layer.close(index);
      }
    );
  }
});

//监听行工具事件 Demo
// <table id="demo" lay-filter="test"></table>
// 这个bar_do 是lay-filter
layui.table.on("tool(bar_do)", function (obj) {
  var data = obj.data;
  //console.log(obj)
  if (obj.event === "lookdo") {
  } else if (obj.event === "editdo") {
  } else if (obj.event === "adddo") {
  }
});
```

### 2. 监听单元格编辑

```c#
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

### 3. 开启头部工具栏

```c#
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

### 4. 开启头部工具栏 2

```c#
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

### 5. 监听头部工具栏事件

- [table 数据表格文档 - layui](https://www.layui.com/doc/modules/table.html#ontoolbar)

```c#
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

### 6. 监听工具条

```c#
//监听工具条
table.on("tool(test)", function (obj) {
  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
  var data = obj.data; //获得当前行数据
  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
  var tr = obj.tr; //获得当前行 tr 的DOM对象

  if (layEvent === "detail") {
    //查看
    //do somehing
  } else if (layEvent === "del") {
    //删除
    layer.confirm("真的删除行么", function (index) {
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
      title: "xxx",
    });
  }
});

//监听行工具事件
layui.table.on("tool(Googlesusers)", function(obj) {
  var data = obj.data;
  // console.log(data)
  if (obj.event === "lookusers") {
    getsiteweixinusers(data.path);
  } else if (obj.event === "editusers") {
    opensiteweixinusers(obj);
  } else if (obj.event === "cdnrefresh") {
    layer.alert("无法执行改操作!", { icon: 6 });
  } else if (obj.event === "cdnwechats") {
    layer.alert("哈喽!");
  }
});
```

### 7. 头部工具栏与行工具栏定义标识

- 同是 toolbar 标签

```c#
toolbar: "#toolbar_sitesconfigs",
```

- 头部工具栏定义

```c#
toolbar: "#toolbar_xxxx",
```

```c#
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

```c#
layui.table.on("toolbar(sites)", function (obj) {
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

```c#
toolbar: "#bar_XXX",
```

```c#
<script type="text/html" id="bar_sitesconfigs">
  <a class="layui-btn layui-btn-xs" lay-event="siteitem_view">
    查看与修改配置
  </a>
  <a class="layui-btn layui-btn-xs" lay-event="siteitem_delete">
    删除
  </a>
</script>
```

```c#
layui.table.on("tool(sitesconfigsclassnames)", function (obj) {
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
        curr: 1,
      },
    });
  } else if (obj.event === "siteitem_stop") {
  } else if (obj.event === "siteitem_start") {
  }
});
```

### 8. 赋值数据刷新表格方法与代码片段

```c#
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

### 9. Form 按钮事件监听

```c#
//Form按钮事件监听
layui.form.on("submit(btn_demo_1)", function(data) {
  layer.close(layer.index);
  layui.$.ajax({
    type: "POST",
    url: "/api.aspx?Action=getdemo",
    dataType: "json",
    data: "path=" + data.field.path + "&users=" + data.field.weixinusers,
    cache: false,
    async: false,
    success: function(data) {
      layer.alert(data.apimsg.message, { icon: 6 });
    }
  });

  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});

layui.form.on("submit(btn_demo_close)", function(data) {
  layer.close(layer.index);
  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
});
```

## 7. 开启复选框 获取选中行数据

```c#
 ,cols: [[
      {type:'checkbox'}
      ,{field:'id', width:80, title: 'ID', sort: true}
      ,{field:'username', width:80, title: '用户名'}
      ,{field:'sex', width:80, title: '性别', sort: true}
      ,{field:'city', width:80, title: '城市'}
      ,{field:'sign', title: '签名', minWidth: 100}
      ,{field:'experience', width:80, title: '积分', sort: true}
      ,{field:'score', width:80, title: '评分', sort: true}
      ,{field:'classify', width:80, title: '职业'}
      ,{field:'wealth', width:135, title: '财富', sort: true}
    ]]
```

```c#
var checkStatus = layui.table.checkStatus("sites"),
  datasites = checkStatus.data;

layui.table.checkStatus("apidatas").data;
```

```c#
layui.table.checkStatus("sites").data;
tableIns.sconf_tplitems.config.data[0].LAY_CHECKED = false;
```

### 2. 复选框 获取某列选中值

```c#
//只读取但一列 返回换行文本字符串
function API_apidatas_for_checkbox_getSinglecolumnText(column) {
  var datas = layui.table.checkStatus("apidatas").data;

  if (datas.length == 0) {
    console.log("无选中项!");
    return "";
  } else {
    var Texts = "";
    for (var i = 0; i < datas.length; i++) {
      Texts = Texts + datas[i][column] + (i < datas.length ? "\r\n" : "");
    }
    return Texts;
  }
}
```

### 2. layui 表格复选框自动选中

- 在返回的 json 中设置 LAY_CHECKED 为 true，页面上的 checkbox 就是选中状态了
- [layui 表格复选框自动选中](https://www.jianshu.com/p/f08e7827916b)

- 方法一

```c#
// 在返回的json中设置LAY_CHECKED为true，页面上的checkbox就是选中状态了

data":[
  {"name":"北京市","areaType":"省/直辖市","id":"110000","LAY_CHECKED":true},
  {"name":"市辖区","areaType":"地市","id":"110100","LAY_CHECKED":true},
  {"name":"县","areaType":"地市","id":"110200","LAY_CHECKED":false}
]
```

- 方法二

```c#
layui.use('table', function(){
    var $ = layui.$;
    var table = layui.table;

    //在使用table之前加上下面这句就可以了
    table =  $.extend(table, {config: {checkName: 'checked'}});
    table.render({
        ...
    });
});
```

## 8. 综合 其它 百科

### 1. layui table 点击 tr 更改当前行颜色

- [layui table 点击 tr 更改当前行颜色 qq_39307991](https://blog.csdn.net/qq_39307991/article/details/100990840)

```c#
/**点击行变色 */
layui.table.on('row(Stocks)', function (obj) {
    layui.$(".layui-table-body tr ").attr({ "style": "background:#FFFFFF" });//其他tr恢复原样
    console.log(obj.tr.selector) //得到当前点击的tr
    layui.$(obj.tr.selector).attr({ "style": "background:#99ff99" });//改变当前tr颜色
});

```

## 9. Table html

```C#
<table class="layui-hide" id="demo"></table>
<table class="layui-hide" id="worksites" lay-filter="worksites"></table>
<table  class="layui-hide"  id="siteweixinusers"  lay-filter="siteweixinusers"></table>
```

### 1. 行内表单

- [Getting Title at 0:54](https://www.layui.com/demo/form.html)

### 2. 行内表单 时间选择器

```C#
<div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label">年选择器</label>
    <div class="layui-input-inline">
      <input type="text" class="layui-input" id="test2" placeholder="yyyy" />
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">年月选择器</label>
    <div class="layui-input-inline">
      <input type="text" class="layui-input" id="test3" placeholder="yyyy-MM" />
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">时间选择器</label>
    <div class="layui-input-inline">
      <input
        type="text"
        class="layui-input"
        id="test4"
        placeholder="HH:mm:ss"
      />
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">日期时间选择器</label>
    <div class="layui-input-inline">
      <input
        type="text"
        class="layui-input"
        id="test5"
        placeholder="yyyy-MM-dd HH:mm:ss"
      />
    </div>
  </div>
</div>
```
