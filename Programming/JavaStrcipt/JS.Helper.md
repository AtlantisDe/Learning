# JS.Helper

```c#

```

## 0. Installation

```c#
2e4 20000
```

## 0. Packages

```c#
html2canvas
```

### 1. 取中间文本 GetStringMid

```c#

GetStringMid(Tmp1,"SetDomain\":",",")


/**
 * 已知前后文 取中间文本
 * @param str 全文
 * @param start 前文
 * @param end 后文
 * @returns 中间文本 || null
 */
function GetStringMid(str, start, end) {
  let res = str.match(new RegExp(`${start}(.*?)${end}`))
  return res ? res[1] : "";
}


/**
 * 已知前后文 取中间文本
 * @param str 全文
 * @param start 前文
 * @param end 后文
 * @returns 中间文本 || null
 */
function GetStringMid(str, start, end) {
  let res = str.match(new RegExp(`${start}(.*?)${end}`))
  return res ? res[1] : null
}

```

### 2. for forEach each

```c#
// 1. js中普通for循环

var array = [5, 4, 3, 2, 1];

for (var i = 0; i < array.length; i++) {
  console.log(array[i]);
}

// 2. js的forEach()循环

var array = [55, 44, 33, 22, 11];
array.forEach(function (element, index) {
  console.log(element);
  console.log(index);
});

// 3. jQuery中的each()循环:转换成jQuery对象的方法
// 4. jQuery中的each()循环:转换成jQuery对象的方法
var array = [55, 44, 33, 22, 11];
$.each(array, function (index, element) {
  console.log(element);
  console.log(index);
});
```

### 3. querySelector 常用

```c#
document.querySelector("#Id").innerText = responseJSON.Data.Count;


// 选择一个元素
var test = document.querySelector("a[target]");
var test = document.querySelector('li[attrs="demo"]');
var test = document.querySelector('img[imgId="demo"]');
var test = document.querySelector('select[name="demo"]');

var test = document.querySelectorAll(
  'input[value][type="checkbox"]:not([value=""])'
);
var test = document.querySelectorAll('li[attrs="demo"]');
var test = document.querySelector('li[attrs="demo"]');
var DivForm = document.querySelector('div[lay-filter="Div_Demo_Form"]');
DivForm.querySelectorAll('input[type="checkbox"]');
document.querySelector(".treasure_box");
var test = document.querySelectorAll('input[name="username"]');
document.querySelectorAll('input[name="username"]')[0].value="aaa";
document.querySelectorAll('input[name="email"]')[0].value="aaa";

document.querySelectorAll('.name.domain-name').forEach(function (element, index) {
  console.log(element.innerText);
});

// 选择Div下面的一个select筛选Name元素
document.querySelector('div[lay-filter="Div_WebConfig_Form"]').querySelector('select[name="SentenceSplitType"]');
// 标题
document.querySelector("head > title").text = "你好世界"
// 内部Html  <div id="DE"></div>
document.querySelector("#DE").innerHTML = responseJSON.Data.Html;

```

### 4. jQuery 常用

- [How do I get the text value of a selected option? | jQuery Learning Center](https://learn.jquery.com/using-jquery-core/faq/how-do-i-get-the-text-value-of-a-selected-option/)
- [Get selected Text and Value of DropDownList using jQuery](http://www.jqueryfaqs.com/Articles/Get-selected-Text-and-Value-of-DropDownList-using-jQuery.aspx)
- [$.post() 和 $.get() 如何同步请求\_小白一个-CSDN 博客](https://blog.csdn.net/sunnyzyq/article/details/78730894)

```c#
// 表单元素 下拉框  select 获取实时的显示文本
$('#WebsitePage404ExecuteMethod option:selected').text()
// 等价于
layui.$("#WebsitePage404ExecuteMethod").find("option:selected").text();

$("#myselect" ).val();
$("#myselect option:selected" ).text();

var selectedText = $("#ddlFruits").find("option:selected").text();
var selectedValue = $("#ddlFruits").val();
alert("Selected Text: " + selectedText + " Value: " + selectedValue);

var selectedText = $("#mySelect option:selected").html();

// 开关类型获取值直接为真假 注意 Layui 上面的渲染获取失败 永远都是true
<input type="checkbox" name="IsAutoCreateContent" value="true" lay-skin="switch" lay-text="开启|关闭">

// 正确获取值方法
layui.$(test).is(':checked');
layui.$(test).context.value

$(test).val()

// 由于$.post() 和 $.get() 默认是 异步请求，如果需要同步请求，则可以进行如下使用：
// 在$.post()前把ajax设置为同步：$.ajaxSettings.async = false;
// 在$.post()后把ajax改回为异步：$.ajaxSettings.async = true;
// 如：
$.ajaxSettings.async = false;
$.post("/finance/getLastTimeCard", data, function(result) {
// 请求处理
},"json");
$.ajaxSettings.async = true;


// 如想用同步方法可以选择ajax,请跳转ajax.md查看

/**提交数据 POST 异步版本*/
layui.$.post("/api/DeployWebsites", { "SiteGuidsText": GuidsText, "WebConfigGuid": webConfig.Guid }, function (responseJSON) {
    if (responseJSON.ResultCode == 0) {

        FunDataFnRequestSuccessfully(responseJSON.Message, function () { parent.TableIns.SiteCategory.reload(); parent.TableIns.Sites.reload(); parent.layer.close(parent.layer.getFrameIndex(window.name));});

    } else {
        FunDataRequestFailed(responseJSON.Message);
    }
}).fail(function () {
    FunNetworkfailure();
});

```

### 5. JSON 常用

```c#
JSON.parse(res);
JSON.stringify(config);
```

### 6. document 常用

- [jquery 的 ready() 与 window.onload()的区别 - derezzed - 博客园](https://www.cnblogs.com/derezzed/articles/8599416.html)

```c#
// 1.执行时间
window.onload必须等到bai页面内包括图片的所有元素加载完毕后才能执行。
$(document).ready()是DOM结构绘制完毕后就执行，不必等到加载完毕。
// 2.编写个数不同
window.onload不能同时编写多个，如果有多个window.onload方法，只会执行一个
$(document).ready()可以同时编写多个，并且都可以得到执行
// 3.简化写法
window.onload没有简化写法


$(document).ready(function(){})可以简写成$(function(){});

$(document).ready(function () {

});
```

### 7. JavaScript 判断对象中是否有某属性

- [JavaScript 判断对象中是否有某属性 - Shapeying - 博客园](https://www.cnblogs.com/shapeY/p/9180908.html)

```c#
test.hasOwnProperty('name')        //true   自身属性
test.hasOwnProperty('age')           //false  不存在
test.hasOwnProperty('toString')    //false  原型链上属性

if (test.hasOwnProperty('name') == false) {continue;}
```

### 8. JavaScript split()

- [JavaScript split()](https://www.w3school.com.cn/js/jsref_split.asp)

```c#
// 两次分割先以行分割,再以制表符分割
var arrLines = str.split("\r\n");
for (var i = 0; i < arrLines.length; i++) {
    console.log(arrLines[i]);
    var item = arrLines[i];
    var arr = item.split("\t");
    if (arr.length >= 2)
    {
        console.log(arr[0]);
        console.log(arr[1]);
    }
}


// 例子 1 在本例中，我们将按照不同的方式来分割字符串：

var str="How are you doing today?"

document.write(str.split(" ") + "<br />")
document.write(str.split("") + "<br />")
document.write(str.split(" ",3))

// 输出：
How,are,you,doing,today?
H,o,w, ,a,r,e, ,y,o,u, ,d,o,i,n,g, ,t,o,d,a,y,?
How,are,you


// 例子 2 在本例中，我们将分割结构更为复杂的字符串：
"2:3:4:5".split(":") //将返回["2", "3", "4", "5"]
"|a|b|c".split("|") -+//将返回["", "a", "b", "c"]

```

### 9. 2e4

- [javascript – 代码中的’2e4’是什么意思 - 程序园](http://www.voidcn.com/article/p-tviztszy-bup.html)

```c#
2e4 这意味着2 * 10 ^ 4
// 并在你的控制台2e4尝试它输出将是20000

```

### 10. substr

- [JavaScript substr()](https://www.w3school.com.cn/js/jsref_substr.asp)

```c#
var str="Hello world!"
document.write(str.substr(3))

// 输出：
lo world!

```

### 11. Number

- [JavaScript Number() 函数](https://www.w3school.com.cn/jsref/jsref_number.asp)

```c#
// 语法
Number(object)

// 实例
var test1= new Boolean(true);
var test2= new Boolean(false);
var test3= new Date();
var test4= new String("999");
var test5= new String("999 888");

// 输出：
1
0
1256657776588
999
NaN
```

### 12. 转换成以万为单位的数

```c#
n = 10000;
n = Math.round((n /10000) * 100) / 100;
n = n + "万";


/**转换成以万为单位的数 */
function FunDoubleToThousandStr(n) {
    var w = Math.round((n / 10000) * 100) / 100;
    return (w + "万");
}

```

### 11. double

```c#
parseFloat("1234blue"); //returns 1234.0
parseFloat("0xA"); //returns NaN
parseFloat("22.5"); //returns 22.5
parseFloat("22.34.5"); //returns 22.34
parseFloat("0908"); //returns 908
parseFloat("blue"); //returns NaN


//INT判断
if (parseInt("abc")>0){console.log('yes')}else{console.log('no');}
if (parseInt("abc9999")>0){console.log('yes')}else{console.log('no');}
if (parseInt("6666")>0){console.log('yes')}else{console.log('no');}
if (parseInt("6666.23")>0){console.log('yes')}else{console.log('no');}
// Float
if (parseFloat("abc")>0){console.log('yes')}else{console.log('no');}
if (parseFloat("abc9999")>0){console.log('yes')}else{console.log('no');}
if (parseFloat("6666")>0){console.log('yes')}else{console.log('no');}
if (parseFloat("6666.23")>0){console.log('yes')}else{console.log('no');}
```

### 12. trycatch

```c#
try {
  var x = sojson.demo;
} catch (e) {
  console.log(e.message); //sojson is undefined
}

(window.console && console.log(m)) || alert(m);
```

### 13. DateTime

```c#
// Layui 时间
layui.util.toDateString(new Date(), "yyyy-MM-dd HH:mm:ss");
layui.util.toDateString(new Date(), "yyyyMMdd");
layui.util.toDateString(new Date(), "yyyy-MM-dd");
layui.util.toDateString(new Date().setMonth(new Date().getMonth()-1), "yyyy-MM-dd");


layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss.ffff");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss.fff");
layui.util.toDateString(d.evtdatetime, "yyyy-MM-dd HH:mm:ss:fff");


// 1.获取今天的0时0分0秒（常用于开始日期的获取）
var startDate= new Date(new Date().toLocaleDateString()); //Tue May 15 2018 00:00:00 GMT+0800 (中国标准时间)

// 2.获取一个月前的日期
var lastM =new Date(new Date().setMonth(new Date().getMonth()-1));//Sun Apr 15 2018 09:18:08 GMT+0800 (中国标准时间)

// 3.获取一个月前的0时0分0秒
var lastM_start =new Date(new Date(new Date().toLocaleDateString()).setMonth(new Date().getMonth()-1));
//Sun Apr 15 2018 00:00:00 GMT+0800 (中国标准时间)


// 4.获取前一天的日期
var yesterday = new Date(new Date().setDate(new Date().getDate()-1));//Mon May 14 2018 09:26:39 GMT+0800 (中国标准时间)

// 5.获取今天的23时59分59秒
var endDate = new Date(new Date(new Date().toLocaleDateString()).getTime()+24*60*60*1000-1);
//Tue May 15 2018 23:59:59 GMT+0800 (中国标准时间)


// 6.获取昨天的23时59分59秒
var yes_endDate = new Date(new Date(new Date(
new Date().setDate(new Date().getDate()-1)).toLocaleDateString()).getTime()+24*60*60*1000-1);
//Mon May 14 2018 23:59:59 GMT+0800 (中国标准时间)


```

### 14. JS 三目运算符

```c#
var max = a>b?a:b;


// 实例：根据学生成绩判定ABCD四个等级

var result = (sc<0 || sc>100) ?("分数无效"):

sc>=90?("A"):

sc>=80?("B"):

sc>=60?("C"):("D");

// 注意： 计算时需考虑优先级问题，加"()'避免结果出错！

return d.Bq1 == null ? "" : d.Bq1
```

### 15. 随机

```c#
// 整数随机数(5到15)之间
var random = parseInt(Math.random() * (15 - 5) + 5);
console.log(random);

// 随机字符串
var items = ["saww","dc","aa"];
var randomItem = items[Math.floor(Math.random() * items.length)];

```

### 16. js 把数组对象的某个属性的值提取出来组成新的数组

```c#

// 假如我想保留数组中对象的id属性，其他属性统统删除
var currentDateItemList=['id','123','name','名字'];
var newcurrentDateItemList = currentDateItemList.map((item,index) =>{
            return Object.assign({},{'id':item.id})
});


var currentDateItemList=['id','123','name','名字'];
var newRowOptions = currentDateItemList.map((item,index) =>{
          return item.id
})


var items = [{"CaiPinCode":"001","CaiPinName":"海鲜","ID":"08d90fab-4c2d-40a3-81d3-083805748a78"},{"CaiPinCode":"002","CaiPinName":"凉菜","ID":"08d90fab-524e-4adf-8ac7-7ad7b2ddf9ad"}]
var newItems = items.map((item,index) =>{
            return item.CaiPinName
});
//  ["海鲜", "凉菜"]


var newcurrentDateItemList = StockCategory3sItemsSelect.map((item,index) =>{
            return Object.assign({},{'title':item.title,'value':item.value})
});
```

### 17. $.post

```c#
// 如想用同步方法可以选择ajax,请跳转ajax.md查看

/**提交数据 POST 异步版本*/
layui.$.post("/api/Login", { "User": UserName, "Password": Password }, function (responseJSON) {
    if (responseJSON.ResultCode == 0) {

        FunDataFnRequestSuccessfully(responseJSON.Message, function () { parent.TableIns.SiteCategory.reload(); parent.TableIns.Sites.reload(); parent.layer.close(parent.layer.getFrameIndex(window.name));});

    } else {
        FunDataRequestFailed(responseJSON.Message);
    }
}).fail(function (responseJSON) {

      console.log(responseJSON);
      console.log(responseJSON.responseText);
});




/**提交数据 POST 异步版本*/
layui.$.post("/api/DeployWebsites", { "SiteGuidsText": GuidsText, "WebConfigGuid": webConfig.Guid }, function (responseJSON) {
    if (responseJSON.ResultCode == 0) {

        FunDataFnRequestSuccessfully(responseJSON.Message, function () { parent.TableIns.SiteCategory.reload(); parent.TableIns.Sites.reload(); parent.layer.close(parent.layer.getFrameIndex(window.name));});

    } else {
        FunDataRequestFailed(responseJSON.Message);
    }
}).fail(function () {
    FunNetworkfailure();
});


```
