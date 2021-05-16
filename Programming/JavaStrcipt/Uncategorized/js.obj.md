# js obj

## 测试

### 1. 对象内是区分大小写的

```c#
var myobj={};
// 对象名称对大小写敏感
myobj.a="xiao aa";
myobj.A="da aa";
// 显示
myobj
{a: "xiao aa", A: "da aa"}A: "da aa"a: "xiao aa"__proto__: Object

// 序化
JSON.stringify(myobj);
"{"a":"xiao aa","A":"da aa"}"

// 尝试存储
localStorage.setItem("myobj", JSON.stringify(myobj));
// 尝试读取
var myobjRead=JSON.parse(localStorage.getItem("myobj"));
```
