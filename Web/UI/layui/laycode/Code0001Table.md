# 表格

## 基础参数

```js
,page: true
page: true,
,toolbar: '#toolbarDemo'
toolbar: '#toolbarDemo',
```

## 开启头部工具栏

```js
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>
```

## 代码

```js
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,url:'/demo/table/user/'
    ,cols: [[
      {field:'id', width:80, title: 'ID', sort: true}
      ,{field:'username', width:80, title: '用户名'}
      ,{field:'sex', width:80, title: '性别', sort: true}
      ,{field:'city', width:80, title: '城市'}
      ,{field:'sign', title: '签名', minWidth: 150}
      ,{field:'experience', width:80, title: '积分', sort: true}
      ,{field:'score', width:80, title: '评分', sort: true}
      ,{field:'classify', width:80, title: '职业'}
      ,{field:'wealth', width:135, title: '财富', sort: true}
    ]]
    ,page: true
  });
});

table.render({
  cols:  [[ //标题栏
    {field: 'username', title: '联系人', width: 80, rowspan: 2} //rowspan即纵向跨越的单元格数
    ,{field: 'amount', title: '金额', width: 80, rowspan: 2}
    ,{align: 'center', title: '地址', colspan: 3} //colspan即横跨的单元格数，这种情况下不用设置field和width
  ], [
    {field: 'province', title: '省', width: 80}
    ,{field: 'city', title: '市', width: 120}
    ,{field: 'county', title: '详细', width: 300}
  ]]
});


```