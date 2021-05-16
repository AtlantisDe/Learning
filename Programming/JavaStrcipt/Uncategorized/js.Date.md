# Js

- [Jquery 对当前日期的操作(格式化当前日期)](https://blog.csdn.net/qq_34313263/article/details/72654177)
- [js](https://zhidao.baidu.com/question/472692282.html)
- [Date](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Date)
- [JavaScript 时间与日期处理实战:你肯定被坑过](https://segmentfault.com/a/1190000007581722)
- [js 将时间日期对象转换为时间日期字符](https://www.softwhy.com/article-3736-1.html)
- [How to convert number to date in JavaScript](https://stackoverflow.com/questions/53975796/how-to-convert-number-to-date-in-javascript)
- [js 把字符串(yyyymmdd)转换成日期格式（yyyy-mm-dd） ruiguang21](https://blog.csdn.net/ruiguang21/article/details/79076781)

## 1. JavaScript 库--Day.js

- [分享一个轻量的处理时间和日期的 JavaScript 库--Day.js - DCloud 插件市场](https://ext.dcloud.net.cn/plugin?id=4195)

```c#

```

## 时间

- [Add days to JavaScript Date](https://stackoverflow.com/questions/563406/add-days-to-javascript-date)

```c#
var r="20112233".replace(/^(\d{4})(\d{2})(\d{2})$/, "$1-$2-$3")
console.log(r)

var dateString = '19930701';
var pattern = /(\d{4})(\d{2})(\d{2})/;
var formatedDate = dateString.replace(pattern, '$1-$2-$3');
console.log(formatedDate);


var date = new Date(1546108200 * 1000);
console.log(date.toUTCString())

// "20200912"
layui.util.toDateString(new Date("2020-09-12"), "yyyyMMdd");

layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss");



var dt1 = new Date();
var dt2 = new Date("2010-08-01");

var startTime = new Date(Date.parse(dt1));
var endTime = new Date(Date.parse(dt2));

if (startTime > endTime)
{
  console.log("dt1 大");
} else {
  console.log("dt1 小");
}

if (new Date() > new Date("2010-08-01")) {
  console.log("第一个值 大");
} else {
  console.log("第一个值 小");
}



var str = "2010-08-01";

// 转换日期格式7a686964616fe58685e5aeb931333366306463
str = str.replace(/-/g, '/'); // "2010/08/01";
// 创建日期对象
var date = new Date(str);
// 加一天

date.setDate(date.getDate() + 1);

function addDays(date, days) {
  var result = new Date(date);
  result.setDate(result.getDate() + days);
  return result;
}

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

```c#
layui.util.toDateString(new Date(), "yyyy-MM-dd HH:mm:ss");
layui.util.toDateString(new Date(), "yyyyMMdd");

layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss.ffff");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss.fff");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss:fff");
```

## JS 延迟

```c#
timecount = timecount + 500;
setTimeout(function () {
  console.log("en 英文翻译加载中");
  go_step_2(3);
}, timecount);
// demo

setTimeout(function () {
  console.log("en 英文翻译加载中");
  go_step_2(3);
}, 1000 * 5);
```

## js 获取当前页面所在服务器的时间

- [js 获取当前页面所在服务器的时间 - 什么嘉 - 博客园](https://www.cnblogs.com/smjia/p/4466678.html)
- [Javascript 获取服务器时间 - wangmeijian - 博客园](https://www.cnblogs.com/wangmeijian/p/4442830.html)
- [js 获取当前时间&amp;js 页面时钟](https://www.bbsmax.com/A/kPzO8lE7Jx/)

```c#
function getSeverDateTime() {
  var xhr = window.ActiveXObject
    ? new ActiveXObject("Microsoft.XMLHTTP")
    : new XMLHttpRequest();
  xhr.open("HEAD", window.location.href, false);
  xhr.send();
  var d = new Date(xhr.getResponseHeader("Date"));
  return d;
}

var dt1 = getSeverDateTime();

function getSeverDateTime() {
  var xhr = window.ActiveXObject
    ? new ActiveXObject("Microsoft.XMLHTTP")
    : new XMLHttpRequest();
  xhr.open("HEAD", "https://www.baidu.com/", false);
  xhr.send();
  var d = new Date(xhr.getResponseHeader("Date"));
  return d;
}
```

## js 获取当前时间并格式化

```c#
var dates = new Date();
var years = dates.getFullYear();
var months = dates.getMonth() + 1;
var days = dates.getDate();
var hours = dates.getHours();
var mins = dates.getMinutes();
var secs = dates.getSeconds();
//document.write(years+"-"+months+"-"+days+" "+hours+":"+mins+":"+secs);

var message_date =
  years + "-" + months + "-" + days + " " + hours + ":" + mins + ":" + secs;
```

## js 时间比较大小，时间加减

- [js 时间比较大小，时间加减 - xue11hua - 博客园](https://www.cnblogs.com/aSnow/p/9144473.html)

```c#
// 第一种：时间类比较
startTime = new Date(Date.parse(starttime));
endTime = new Date(Date.parse(endTime));
//进行比较
startTime > endTime;

// 第二种： 时间戳比较
startTime = Date.parse(starttime);
endTime = Date.parse(endTime);
//进行比较
startTime > endTime;

// 将日期格式转换成时间戳：

var date = new Date();
var time1 = date.getTime();
var time2 = date.valueOf();
var time3 = Date.parse(Date());
console.log(time1); //1528258266412
console.log(time2); //1528258366197
console.log(time3); //1528257868000

// 时间加减

time = new Date();
time =
  time.getFullYear() +
  "/" +
  parseInt(time.getMonth() + 1) +
  "/" +
  time.getDate() +
  " " +
  (time.getHours() + 2) +
  ":" +
  time.getMinutes() +
  ":" +
  time.getSeconds(); //给小时加2
```
