# layui

- [求求你们，把这个掐掉把，我真的太难了 - Fly 社区](https://fly.layui.com/jie/56578/)

## 1. layui 代码

```c#

<font color="#0000ff"></font>

<font color="#FFB800">Hello</font>

<font color="#FF0000"></font>

<font color=\"#FF0000\"></font>

<font color="#E437EC"></font>


<font color="#0000ff"></font><font color="#FF0000"></font>

{ title: '模板预览', width: 120, templet: '<div onclick="show_img(this)"><a><img src="/App/Console/TemplatePreview?Name={{d.Name}}" alt="{{d.Name}}" width="50px" height="50px"></a></div>' },

{ field: "Name", title: "机构名称", width: 418, sort: true, templet: function (d) { return '<div onclick="FunJgYyxxV2Items(\'' + d.Name + '\')"><a href="javascript:;">' + d.Name + '</a></div>'; } },

{ field: "Jylx", title: "交易类型", width: 100, sort: true, templet: function (d) { return d.Jylx == 0 ? '<font color="#FF0000">买</font>' : '<font color="#00ff00">卖</font>' } },


,templet: function (d) {return functiondemo(d.runtype);},
,templet: function (d) {return d.SinaSymbolItem.Name;},
,templet: function (d) {return layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");},
,templet: function (d) {return d.progress==100?"已刷新完成":"正在等待刷新中"}
,templet: function (d) { return d.deployed == 0 ? '<font color="#FF0000">未部署</font>' : '<font color="#00ff00">已部署</font>' }
,templet: function (d) {return '<font color="blue">'+d.id+'</font>';},
,templet: function (d) {return '<font color="red">'+d.id+'</font>';},
,templet: function (d) {return '<div><a href="{{d.Name}}" class="layui-table-link"><font color="red">'+d.Name+'</font>/a></div>';},
,templet: '<div><img src="{{ d.avatar }}" style="width:30px; height:30px;"></div>'},
,templet: '{{ d.avatar }}',

,{ field: "Name", title: "名称", width: 188, templet: '{{  }}'},

{ field: "DateTime", title: "日期", width: 120, templet: function (d) { return layui.util.toDateString(d.DateTime * 1000, "yyyy-MM-dd"); } }

{ field: "Name", title: "股票名称", width: 188, templet: function (d) { return d.SinaSymbolItem.Name; } },
{ field: "Symbol", title: "股票代码", width: 120, templet: function (d) { return d.SinaSymbolItem.Symbol; } },
{ field: "Code", title: "数字代码", width: 120, templet: function (d) { return d.SinaSymbolItem.Code; } },
{ field: "StockChangeType", title: "状态", width: 100, sort: true, templet: function (d) { return d.StockChangeType == 0 ? '<font color="#FF0000">涨</font>' : '<font color="#00ff00">跌</font>' } },
{ field: "CrossLineCount", title: "十字星", width: 100, sort: true, templet: function (d) { return '<font color="red">' + d.CrossLineCount + '</font>'; } },


{ field: "Url", title: "地址", width: 288, templet: function (d) { return '<div><a href="' + d.Url + '" class="layui-table-link"><font color="red">' + d.Url + '</font></a></div>'; } },


<script type="text/html" id="xuhao">
    {{d.LAY_TABLE_INDEX+1}}
</script>
{title: '序号',templet: '#xuhao'}
```

### 1. 时间模板

```c#
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss");
templet: function (d) {return layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm:ss");},
templet: function (d) {return layui.util.toDateString(d.updatetime, "yyyy-MM-dd HH:mm:ss");},

```

### 2. 表格行显示图片模板

- [layui 数据表格显示图片](https://www.jianshu.com/p/686f466f7078)
- [Layui 数据表格显示图片，鼠标滑过图片放大 Yuzsmc-CSDN 博客](https://blog.csdn.net/yuzsmc/article/details/81977768)
- [layui 表格图片放大 - 泥土里的绽放 - 博客园](https://www.cnblogs.com/cjjjj/p/10453517.html)

```C#
{field: 'avatar', title: 'avatar2', templet: '<div><img src="{{ d.avatar }}" style="width:30px; height:30px;"></div>'},

{ title: '模板预览', width: 120, templet: '<div onclick="show_img(this)"><a><img src="/App/Console/TemplatePreview?Name={{d.Name}}" alt="{{d.Name}}" width="50px" height="50px"></a></div>' },

{ title: '模板预览', width: 120, templet: function (d) { return '<div onclick="show_img(this)"><a><img src="/App/Console/TemplatePreview?Name=' + d.Name + '" alt="' + d.Name + '" width="50px" height="50px"></a></div>'; } },


/**显示大图片*/
function FunShowRowImg(t, title) {
    var t = $(t).find("img");
    //页面层
    layer.open({
        type: 1,
        title: title,
        skin: 'layui-layer-rim', //加上边框
        area: ['80%', '80%'], //宽高 t.width() t.height()
        shadeClose: true, //开启遮罩关闭
        end: function (index, layero) {
            return false;
        },
        content: '<div style="text-align:center"><img src="' + $(t).attr('src') + '" /></div>'
    });
}

```

### 3. 枚举类模板

```c#
{
    field: "WebsiteDriverEngine", title: "驱动引擎", width: 120,
    templet: function (d) {

        var guid = 99; var vue = "";
        if (d.Nodes.WebConfig) {
            guid = d.Nodes.WebConfig.WebsiteDriverEngine;
        }

        switch (guid) {
            case 10000:
                vue = '<font color="#8000ff">新闻聚合系统</font>';
                break;
            case 10001:
                vue = '<font color="#8000ff">泛引擎系统</font>';
                break;
            default:
                vue = '<font color="#FF0000">未部署</font>';
                break;
        }

        return vue;
    }
},
```

### 4. 单元格排列方式

```c#
// align String 单元格排列方式。可选值有：left（默认）、center（居中）、right（居右） center

{ field: "CategorysMin", title: "居中颜色", width: 166, sort: false, align: 'center', templet: function (d) { return '<font color="red">[' + d.CategorysMin + ']</font>'; } },
```

### 5. 类型模板

```c#
{ type: "checkbox" },
```

### 6. numbers（序号列）

```c#
{ type: "numbers" },
{ field: "Id", width: 66, title: "编号", sort: false, type: "numbers" },
{ field: "Id", width: 66, title: "编号", sort: false, templet: function (d) { return d.LAY_TABLE_INDEX + 1; } },
```
