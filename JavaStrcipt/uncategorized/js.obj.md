# js obj

## 测试

### 1. 对象内是区分大小写的

```js
var myobj={};
undefined
myobj.a="xiao aa";
"xiao aa"
myobj.A="da aa";
"da aa"
myobj
{a: "xiao aa", A: "da aa"}A: "da aa"a: "xiao aa"__proto__: Object


JSON.stringify(myobj);
"{"a":"xiao aa","A":"da aa"}"

```
