# layui

- [layui - 经典模块化前端 UI 框架](https://www.layui.com/)
- [layui 数据表格 数据更新完成后数据刷新 - Objects - 博客园](https://www.cnblogs.com/objects/p/8358102.html)
- [快速上手 layer，新人必看](https://layer.layui.com/hello.html)

## 0. 常用

### 1. layui

```c#
layui.util.fixbar();
layui.form.render();//影响表单组件渲染
layui.element.init();

layui.util.fixbar();layui.form.render(); layui.element.init();

```

```C#
<script>
  layui.util.fixbar();
  layui.form.render();
  layui.element.init();
</script>
```

### 2. 信息框

```c#


```

### 3. 下拉框联动

```c#
layui.$('#Id_Lv1div1 .layui-form-select dl dd:nth-child(1)').trigger('click');
layui.$('#Id_Lv2div1 .layui-form-select dl dd:nth-child(1)').trigger('click');
layui.$('#Id_Lv3div1 .layui-form-select dl dd:nth-child(1)').trigger('click');

```

### 3. 隐藏显示样式 layui-hide

```c#
class="layui-hide"

```

### 4. DateTime

```c#
layui.util.toDateString(new Date(), "yyyy-MM-dd");
layui.util.toDateString(layui.util.toDateString(1611158400 * 1000), "yyyy-MM-dd");


```

### 5. 穿梭框组件

```c#
// 显示搜索框  数据源格式解析

    layui.transfer.render({
        elem: '#test1',
        data: StocksMain.Items,
        parseData: function (res) {
            return {
                "value": res.Value
                , "title": res.Name
                , "disabled": ""
                , "checked": ""
            }
        },
        title: ['可选择的分类', '已选中分类'],
        showSearch: true,
        height: 710

    });

     
// 赋值初始值需要存储的是Value数组
var currentDateItemList=['id','123','name','名字'];
var newRowOptions = currentDateItemList.map((item,index) =>{
          return item.id
})



```

### 6. 栅格系统与后台布局

- [Layui 栅格系统与后台框架布局](https://www.layui.com/doc/element/layout.html)

```c#
<div class="layui-fluid">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-md4">
            1/3
        </div>
        <div class="layui-col-md4">
            1/3
        </div>
        <div class="layui-col-md4">
            1/3
        </div>
    </div>
</div>

```

## 1. extend

- [layui 第三方组件平台](https://fly.layui.com/extend/)

### 1. LayUI 扩展

- [synchronized/treetable-lay](https://gitee.com/whvse/treetable-lay)
- [扩展 layui 的 table 模块的 reload 功能](http://jianyun.org/archives/1121.html)

### 2. tableSelect 下拉表格选择器

- [tableSelect 下拉表格选择器 tableSelect - layui 第三方组件平台](https://fly.layui.com/extend/tableSelect/)
