# Table-api

## Code

### Data

#### 1. Get data

```js
layui.table.cache;
layui.table.cache.linkitems;
layui.$.extend(layui.table.cache["test"][0], demo_row_updatedate);
layui.table.cache["webcrawlerconfigs"];

layui.table.checkStatus("webcrawlerconfigs").data;

demo_row_tr = layui.$(obj.elem).parents("tr");
demo_row_tr[0].dataset.index;
demo_row_tr[0].dataset.index;

//表格id
//表格id
// var layId = layui.$(obj.elem).parents('.layui-table-view').attr('lay-id');
var layId = layui
  .$(obj.elem)
  .parents(".layui-table-view")
  .attr("lay-id");

//监听行单击事件
table.on("row(layui_table)", function(obj) {
  var rowIndex = obj.tr[0].dataset.index; //行索引
  // console.log(obj.data) //得到当前行数据
  console.log("行单击->索引：", rowIndex);
});

//表格id
var layId = layui
  .$(obj.elem)
  .parents(".layui-table-view")
  .attr("lay-id");

//单元格数据对象
var data = {
  sex: obj.elem.checked
};
//行索引
var rowIndex = layui.$(obj.elem).parents("tr")[0].dataset.index;
```

#### 2. 获取选中值

```js
layui.table.checkStatus("linkitems").data;
```

#### 3. 数据表格能添加请求头吗

- [数据表格能添加请求头吗？ - Fly 社区](https://fly.layui.com/jie/26666/)

#### 3. 更新表格单元格数据口,更新单元格的内容

- [layui 更新表格单元格数据口,更新单元格的内容 - 与 f - 博客园](https://www.cnblogs.com/fps2tao/p/9467092.html)

```js
//监听工具条
table.on("tool(edit)", function(obj) {
  var data = obj.data;
  if (obj.event === "getinvitation") {
    //有个ajax更新,成功后回调函数写下面的更新
    //同步更新表格和缓存对应的值
    obj.update({
      is_signin_today: "1"
    });
  }
});
```

#### 4. 表格单元格开关数据同步

```js
function dataSynTablerowSwitch(obj) {
  layer.tips(this.value + " " + this.name + "：" + obj.elem.checked, obj.othis);
  var rowIndex = layui.$(obj.elem).parents("tr")[0].dataset.index;
  var layId = layui
    .$(obj.elem)
    .parents(".layui-table-view")
    .attr("lay-id");
  layui.$.extend(layui.table.cache[layId][rowIndex], {
    [obj.elem.name]: obj.elem.checked
  });
}
```

#### 5. 表格分页显示

```js
tableIns.smarttags.config.page.limit = 10;
tableIns.smarttags.reload({});
tableIns.smarttags.reload({page:{curr:1,limit:50}});
```
