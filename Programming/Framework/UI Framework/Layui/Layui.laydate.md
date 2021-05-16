# laydate

```c#
// 请注意：如果你的页面已经使用了 layui，我们强烈推荐你直接采用 layui 内置的 layDate 模块，请勿再重复引用独立版的 laydate.js
```

## 0. official

- [layDate - JS 日期与时间组件/插件官方演示与讲解](https://www.layui.com/laydate/)

## 1. 示例

### 1. 常用

```c#

// layui时间控件闪退的问题
// 解决方案: 1. trigger: 'click' 2. 删除 lay-key="2" (在HTML代码中)


// 自带版本
/**网站推送日志类 按日期查询 */
layui.laydate.render({
    elem: '#TaskQueueSelectTime'
    , done: function (value, date, endDate) {
        TmpValues.TaskQueueYymmdd = layui.util.toDateString(new Date(value), "yyyyMMdd");
        FunTaskQueueCategory();
        FunTaskQueues("正常用户");
    }
});

layui.laydate.render({ elem: '#WebVisitLogSelectTime', value: layui.util.toDateString(new Date(), 'yyyy-MM-dd'), format: 'yyyy-MM-dd', isInitValue: true });
layui.laydate.render({ elem: '#WebsitePushLogSelectTime', value: layui.util.toDateString(new Date(), 'yyyy-MM-dd'), format: 'yyyy-MM-dd', isInitValue: true });
layui.laydate.render({ elem: '#TaskQueueSelectTime', value: layui.util.toDateString(new Date(), 'yyyy-MM-dd'), format: 'yyyy-MM-dd', isInitValue: true });




layui.laydate.render({ elem: '#OCDiffDateRange', trigger: 'click', range: true });
layui.laydate.render({ elem: '#StockMAsDateRange', trigger: 'click', range: true });

layui.laydate.render({ elem: '#OCDiffDateRange', trigger: 'click', zIndex: 99999999, range: true });
layui.laydate.render({ elem: '#StockMAsDateRange', trigger: 'click', zIndex: 99999999, range: true });



// isInitValue - 初始值填充
layui.util.toDateString(new Date(), "yyyy-MM-dd");

laydate.render({ elem: '#OCDiffDateRange', range: true });


laydate.render({elem:'#test',value:layui.util.toDateString(new Date(), "yyyy-MM-dd"),isInitValue: false});

laydate.render({ elem: '#WebVisitSelectTime', format: 'yyyy年MM月dd日', isInitValue: true });
laydate.render({ elem: '#WebVisitSelectTime', value: layui.util.toDateString(new Date(), 'yyyy-MM-dd HH:mm:ss'), isInitValue: false });

// 格式错误
laydate.render({ elem: '#WebVisitSelectTime', value: layui.util.toDateString(new Date(), 'yyyy年MM月dd日'), format: 'yyyy年MM月dd日', isInitValue: true });

// 正确
laydate.render({ elem: '#WebVisitLogSelectTime', value: layui.util.toDateString(new Date(), 'yyyy-MM-dd'), format: 'yyyy-MM-dd', isInitValue: true });
laydate.render({ elem: '#WebsitePushLogSelectTime', value: layui.util.toDateString(new Date(), 'yyyy-MM-dd'), format: 'yyyy-MM-dd', isInitValue: true });
laydate.render({ elem: '#TaskQueueSelectTime', value: layui.util.toDateString(new Date(), 'yyyy-MM-dd'), format: 'yyyy-MM-dd', isInitValue: true });

laydate.render({
  elem: '#test'
  ,value: '2017-09-10'
  ,isInitValue: false //是否允许填充初始值，默认为 true
});


// "20200912"

layui.util.toDateString(new Date("2020-09-12"), "yyyyMMdd");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss");

layui.util.toDateString(new Date(), "yyyy-MM-dd");

TmpValues.WebVisitLogYymmdd = layui.util.toDateString(new Date(), "yyyyMMdd");


laydate.render({elem: '#expiretime',type: 'datetime'});
laydate.render({elem: '#WebVisitSelectTime',type: 'datetime'});
//自定义格式
laydate.render({elem: '#test11',format: 'yyyy年MM月dd日'});
laydate.render({elem: '#WebVisitSelectTime',format: 'yyyy年MM月dd日'});


<div style="display: inline;height: 40px">
    <input type="text" id="WebVisitSelectTime" style="height: 31px;width: 300px;">
</div>

 <div class="layui-inline">
    <label class="layui-form-label" style="width: 168px;">过期时间</label>
    <div class="layui-input-inline" style="width: 280px;">
        <input name="Expiretime" type="text" class="layui-input"
            id="expiretime" placeholder="yyyy-MM-dd HH:mm:ss">
    </div>
</div>
```

### 1. 控件选择完毕后的回调

- [日期和时间组件文档 - Layui](https://www.layui.com/doc/modules/laydate.html#ondone)

```c#
laydate.render({
  elem: '#test'
  ,done: function(value, date, endDate){
    console.log(value); //得到日期生成的值，如：2017-08-18
    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
    console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
  }
});
```
