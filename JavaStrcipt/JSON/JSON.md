# JSON

- [JSON.stringify() | 菜鸟教程](http://www.runoob.com/json/json-stringify.html)
- [一个 jquery-ajax post 例子 ajax 登陆 - duanxz - 博客园](https://www.cnblogs.com/duanxz/p/3165246.html)

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

## 常用代码

### 系列化转为字符串

```js
tmpvalues.sitesbatchDelete = JSON.stringify(datasites);

sconf_sitenameitems: JSON.stringify(
  tmpvalues.checkStatus_sconf_sitenameitems.data
);
```
