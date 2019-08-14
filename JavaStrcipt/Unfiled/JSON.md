# JSON

- [JSON.stringify() | 菜鸟教程](http://www.runoob.com/json/json-stringify.html)
- [一个 jquery-ajax post 例子 ajax 登陆 - duanxz - 博客园](https://www.cnblogs.com/duanxz/p/3165246.html)

## 代码

```js
JSON.parse(res);
JSON.stringify(config);
```

```js
JSON.parse()
JSON.parse(text[, reviver])
// text:必需， 一个有效的 JSON 字符串。
// reviver: 可选，一个转换结果的函数， 将为对象的每个成员调用此函数。
ar obj = JSON.parse('{ "name":"runoob", "alexa":10000, "site":"www.runoob.com" }');

JSON.stringify(value[, replacer[, space]])

var myJSON = JSON.stringify(obj);
tmpvalues.wsjson = JSON.parse(str);

```

## JSON 注释

- [Json 文件如何加注释 - OSCHINA](https://www.oschina.net/question/163912_26244?sort=time)

```c#
// 可以在开头插入, 或追加在结尾, json就是JavaScript的语法, 和JS完全一样的

// 例子一

//注释

/*注释, 注意注释必须用换行隔开, 就是JS的语法, 不然一行都被注释掉了*/

// {a:1,b:2,c:[3,4,5]}

// 追加在最后也是一样的, 但是不能加在中间, 和你也JS代码语法一样的

// 最后, JSON和javascript有区别吗? 没有, JSON是js语法的一个子集, 你在你返回的JSON前面加段JS代码, 照样能执行, 比如说alert(123);

// JS中{}就代表一个对象, []就代表一个数组, JSON就是直接使用这种数据格式而已

// 你在JS里直接写var a={a:1,b:2,c:[3,4,5]};或者var a=eval('('+'{a:1,b:2,c:[3,4,5]}'+')');

// a就是这个对象了, 你可以alert(a.b),会弹出2
```

## 常用代码

### 系列化转为字符串

```js
tmpvalues.sitesbatchDelete = JSON.stringify(datasites);

sconf_sitenameitems: JSON.stringify(
  tmpvalues.checkStatus_sconf_sitenameitems.data
);
```
