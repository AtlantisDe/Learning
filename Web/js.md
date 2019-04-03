
# JS

* [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)
* [Promise 在JavaScript的世界中，所有代码都是单线程执行的。](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014345008539155e93fc16046d4bb7854943814c4f9dc2000)
* [初探Promise](https://segmentfault.com/a/1190000007032448#articleHeader1)
* [jQuery 参考手册](http://www.w3school.com.cn/jquery/jquery_reference.asp)
* [JQuery中常用的 属性选择器](https://www.cnblogs.com/liang1/p/5223993.html)
* [jQuery API 中文文档](https://www.jquery123.com/)
* [jQuery 参考手册](http://jquery.cuishifeng.cn/index.html)
* [JS中int和string的转换](https://blog.csdn.net/huangmp/article/details/6678337)
* [js中取得变量绝对值的方法](https://www.jb51.net/article/59343.htm)
* [JS奇偶数判断例子](https://blog.csdn.net/u012111465/article/details/79184261)
* [JS实现数组去重（重复的元素只保留一个）](https://www.cnblogs.com/jiayuexuan/p/7527055.html)
* [JS向数组添加元素，插入数据](https://blog.csdn.net/woshidamimi0/article/details/81154670)
* [JavaScript数组，JSON对象实现动态添加、修改、删除功能示例](https://www.jb51.net/article/140898.htm)
* [js中删除数组元素的几种方法](https://www.cnblogs.com/littlemonk/p/5563783.html)
* [js 删除数组几种方法](http://www.cnblogs.com/qiantuwuliang/archive/2010/09/01/1814706.html)
* [js清空数组的方法](https://www.cnblogs.com/jichi/p/10516576.html)
* [Js判断数组中是否存在某个元素](https://www.cnblogs.com/minxl/p/10115040.html)
* [jQuery 判断页面元素是否存在的代码](https://www.cnblogs.com/jinshuo/p/7607427.html)
* [jquery中attr和prop的区别](https://www.cnblogs.com/zy88/p/7500375.html#3865519)
* [onload、load()、ready()事件和DOMContentLoaded、load的区别](https://www.jianshu.com/p/08803dd15472)
* [JS中 “is not defined” 如何判断defined，defined和undefined 的区别](https://www.sojson.com/blog/182.html)
* [layui数据表格时间戳转换为时间格式的方法](https://blog.csdn.net/qq_26173219/article/details/79709644)

## JS代码

```js
window.onload=function(){}
arr.length = 0;

parseInt("abc") // Returns NaN.
parseInt("12abc") // Returns 12.
parseInt("12") //Return 12.
Math.abs(-1);  //1
Math.abs(-2);  //2

myArray.push(44,55);
a.data.push(b);//数组最后加一条记录
a.data.push(c);
a.data.push(d);
a.data.unshift(d);//数组最前面加一条记录

alert( (num%2 ==0) ?"偶数":"奇数");  //判断是否能整除2

api.beijingTime(function(res) {alert(res);})
var sojson;
console.log(sojson == undefined);//true
console.log(sojson === undefined);//true;
console.log(typeof sojson == 'undefined');//true
console.log(typeof sojson ===  'undefined');//true
console.log(!sojson);//true
try{var x = sojson.demo;}catch(e){console.log(e.message);//sojson is undefined
}
for (var i=0;i<cars.length;i++)
{
document.write(cars[i] + "<br>");
}
```

## jQuery代码一

```js
$("#myDiv");
$(selector).html(content)
$(".myclass.otherclass")
layui.$('div[lay-filter=LAY-table-206]')

```

## jQuery代码二

```text
$('#id')　　id选择器
$('.class')　　css选择器,class类名
$('element')　　标签选择器，例如p,h1,div
$('*')　　全选择器,可选择所有的html标签(影响范围较大甚用)
$('sele1,sele2')　　用‘,'逗号隔开可以选择多个不同元素有相同效果的选择器
$('div p')　　层次选择器,常用的选择器,例如div下面的p标签
$('div>p')　与上一个层次选择器差不多,但是div下面有子元素,子元素下还有孙元素,该选择器只能选子元素
$('div+p')　  该选择器用得很少表示div相邻下一个选择器,(必须是相同层次元素并且紧挨的）
$('div~p') 在相同阶段的元素从div开始一直到该阶段尾部所有的p标签被选中,不包括往下元素的为p子元素
$('div:first')　　过滤选择器,:first用:与父级元素连接,选择的第一个div元素;
$('div:last')　　过滤选择器;:last方法与上一样不过是选择最后一个div元素;
$('li:eq(1)')　　该选择器也是过滤选择器;用‘:eq()'连接,括号内输入数字选择从0开始,0代表第一位;
$('li:contains("text")') 该选择器可选择如:li里面文字中所有text的所有元素包括li下的子元素带有text都被选中text可以是自己所需要的关键字;('text')需要加单或双引号,因为它是字符串而不是变量
$('li:has("p")') 该选择器与层次选择器效果差不多也是选择li以下的所有p标签可被继承;
$('div:hidden')　　:hidden该选择器可以选择一些display:none;隐藏的选择器
$('span:visible')　　 与:hidden恰恰相反将所有span标签都选中,但display:none的span属性不选中
$('li[title=book]')　　属性选择器,选中li里属性为title=book的元素;
$('li[title!=book]')　  与上一个相反选中li内title不为,不等于book的元素;
$('li[title*=k]')　　属性选择器,选择所有li内,全部title中带有k字的元素;
$('li:first-child')　　子元素过滤器;:first过滤器可以获取指定父元素的首个子元素,并不是一个集合.只是一个li下的首个子元素并不是所有的li下的子元素.而first-child获得每个父元素返回的首个子元素;
$('li:last-child')　　与上过滤选择器一样,last:child会获得每个父元素返回的最后一个子元素;
$('form :input')　　表单选择器所包含的有input,select,button,textarea,
$('form :text')　　 表单文本选择器,该选择器只包含<input type='text'>类型做选择
$('form :password')　表单密码选择器,同样也只包含input内 type='password'类型,
$('form :radio')　　单选按钮选择器,同样也只包含input内type =' radio'类型,26)　 $('form :checkbox') 复选框选择器,同样也只包含input内type='checkbox'类型
$('form :submit')　提交按钮选择器,包含input内type="submit"和button类型,
$('form :image')　　图像域选择器.只有input内的src才能生效。如在form内添加img src将不会受到影响
$('form :button')　　表单按钮选择器.包含input内type='button'与<button></button>有效
$('form :checked')　　选中状态选择器,带有选择框radio,checkbox都将被选中;
$('form :selected')　　下选框选中选择器,只能获取select下拉列表中全部处于选中状态的option选择器;

```

## Layui代码

```js
layui.$('div[lay-filter=LAY-table-206]')
layui.$('div[lay-id=LAY-table-206]')
layui.$(".layui-laypage-btn").click();
templet:function(d){return layui.util.toDateString(d.createTime*1000, "yyyy-MM-dd HH:mm:ss");},

```