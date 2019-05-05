# layui

- [JS 替换空格回车换行符](https://www.cnblogs.com/zxjyuan/archive/2011/02/11/1951378.html)
- [JavaScript replace() ����](http://www.w3school.com.cn/jsref/jsref_replace.asp)
- [JS replace()方法替换变量（可以对变量进行全文替换）](https://www.cnblogs.com/jasonlam/p/7070604.html)

## JS 替换全文

````js
onsole.log(aaa.replace(/\n/g,"哈哈哈"));
console.log(aaa.replace(/\"/g,"哈哈哈"));
``

## JS 替换空格回车换行符

```js
str = str.replace(/\r/g, "&nbsp;");
str = str.replace(/\n/g, "<br />");
str = str.replaceAll("  ", "");
````

## 替换所有的的空格、回车换行符

```js
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

```js
var str = "<>";
str = str.replace(/\'/g, "’"); //替换半角单引号为全角单引号
str = str.replace(/\"/g, "”"); //替换半角双引号为全角双引号
str = str.replace(/</g, "《").replace(/>/g, "》"); //
```

## JS 中去掉字符串中的双引号

```js
d = d.replace('"', "").replace('"', "");
d = d.replace(/\"/g, "");
```

## JS replace 要实现对变量全文替换必须用表达式

```js
// 把 a 替换成 b：
string.replace("a", "b");
// 以上只能替换第一个匹配的，要全文匹配应该用正则表达式：
string.replace(/a/g, "b");
// 正则加个参数 g ，表示全文匹配。
```
