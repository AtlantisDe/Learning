# layui

## layui 代码

```js
templet: function (d) {return taskitemStates(d.runtype);},
templet: function (d) {return layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");},

<script type="text/html" id="xuhao">
    {{d.LAY_TABLE_INDEX+1}}
</script>
{title: '序号',templet: '#xuhao'}
```
