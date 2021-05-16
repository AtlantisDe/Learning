# layui

- [JS 替换空格回车换行符](https://www.cnblogs.com/zxjyuan/archive/2011/02/11/1951378.html)
- [JavaScript replace() ����](http://www.w3school.com.cn/jsref/jsref_replace.asp)
- [JS replace()方法替换变量（可以对变量进行全文替换）](https://www.cnblogs.com/jasonlam/p/7070604.html)

## JS 替换全文

````c#
tmpvalues.json_sconf_Seritexts = tmpvalues.json_sconf_Seritexts.replace(
    new RegExp("\\+", "g"),
    "%2B"
  );

onsole.log(aaa.replace(/\n/g,"哈哈哈"));
console.log(aaa.replace(/\"/g,"哈哈哈"));
``

## JS 替换空格回车换行符

```c#
str = str.replace(/\r/g, "&nbsp;");
str = str.replace(/\n/g, "<br />");
str = str.replaceAll("  ", "");
````

## 替换所有的的空格、回车换行符

```c#
//原始字符串
var string = "欢迎访问!\r\nhangge.com    做最好的开发者知识平台";

//替换所有的换行符
string = string.replace(/\r\n/g, "<br>");
string = string.replace(/\n/g, "<br>");

//替换所有的空格（中文空格、英文空格都会被替换）
string = string.replace(/\s/g, "&nbsp;");

//输出转换后的字符串
console.log(string);
```

## 常用替换“单引号”、“双引号”、“尖括号”

```c#
var str = "<>";
str = str.replace(/\'/g, "’"); //替换半角单引号为全角单引号
str = str.replace(/\"/g, "”"); //替换半角双引号为全角双引号
str = str.replace(/</g, "《").replace(/>/g, "》"); //
```

## JS 中去掉字符串中的双引号

```c#
d = d.replace('"', "").replace('"', "");
d = d.replace(/\"/g, "");
```

## JS replace 要实现对变量全文替换必须用表达式

- [JS replace()方法替换变量（可以对变量进行全文替换） - 落忆无痕 - 博客园](https://www.cnblogs.com/jasonlam/p/7070604.html)
- [Js、 replace 全部内容替换、替换全部匹配内容、替换第一个 - qq_40138785 的博客 - CSDN 博客](https://blog.csdn.net/qq_40138785/article/details/81457849)
- [js replace 全部替换的方法 - DragonDean - 博客园](https://www.cnblogs.com/dragondean/p/javascript-replaceall.html)

```c#
// 把 a 替换成 b：
string.replace("a", "b");
// 以上只能替换第一个匹配的，要全文匹配应该用正则表达式：
string.replace(/a/g, "b");
// 正则加个参数 g ，表示全文匹配。
string.replace(new RegExp(key, "g"), "b");
// 这里，利用 JS 的 RegExp 对象，将 g 参数单拿了出来，同时，正则的内容可以用变量来代替了！！！！
// 干的漂亮！！！！
// 又简单，又实用！
```

### js 中正则匹配问号出错：Invalid regular expression Nothing to repeat

- 需要两个反斜杠\\?才可以
- [【已解决】js 中正则匹配问号出错：Invalid regular expression Nothing to repeat &#8211; 在路上](https://www.crifan.com/js_regex_match_error_invalid_regular_expression_nothing_to_repeat/)

```c#
tmpvalues.json_sconf_Seritexts.replace(new RegExp("\\+", "g"), "%2B");
```

### js 实体转化

- [js 实体转化 - Soler_lia 的博客 - CSDN 博客](https://blog.csdn.net/soler_lia/article/details/80323501)

```c#
function convert(str) {
  return str
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&apos;");
}
```

```c#
function convert(str) {
  var entitys = {
    "&": "&amp;",
    "<": "&lt;",
    ">": "&gt;",
    '"': "&quot;",
    "'": "&apos;"
  };
  var regexp = new RegExp("[" + Object.keys(entitys).join("") + "]", "g");
  return str.replace(regexp, function(matched) {
    return entitys[matched];
  });
}
```
