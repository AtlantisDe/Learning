# layui

- [求求你们，把这个掐掉把，我真的太难了 - Fly 社区](https://fly.layui.com/jie/56578/)

## layui 代码

```js
templet: function (d) {return taskitemStates(d.runtype);},
templet: function (d) {return layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");},
,templet: function (d) {return d.progress==100?"已刷新完成":"正在等待刷新中"}
, templet: function (d) { return d.deployed == 0 ? '<font color="#FF0000">未部署</font>' : '<font color="#00ff00">已部署</font>' }

<script type="text/html" id="xuhao">
    {{d.LAY_TABLE_INDEX+1}}
</script>
{title: '序号',templet: '#xuhao'}
```

### 时间模板

```js
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss");
templet: function (d) {return layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");},
templet: function (d) {return layui.util.toDateString(d.updatetime, "yyyy-MM-dd HH:mm:ss");},

```
