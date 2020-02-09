# Js

- [Jquery 对当前日期的操作(格式化当前日期)](https://blog.csdn.net/qq_34313263/article/details/72654177)

## JS 延迟

```js
timecount = timecount + 500;
setTimeout(function() {
  console.log("en 英文翻译加载中");
  go_step_2(3);
}, timecount);
// demo

setTimeout(function() {
  console.log("en 英文翻译加载中");
  go_step_2(3);
}, 1000 * 5);



```

## 时间

```js
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
调用
var time1 = new Date().Format("yyyy-MM-dd");
var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
var nowTime=new Date();
nowTime.setMonth(nowTime.getMonth()-1);
alert(nowTime.Format("yyyy-MM-dd HH:mm:ss");)//上月当前时间
```

## Layui 时间

```js
layui.util.toDateString(new Date(), "yyyy-MM-dd HH:mm:ss");
layui.util.toDateString(new Date(), "yyyyMMdd");

layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss.ffff");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss.fff");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss:fff");
```
