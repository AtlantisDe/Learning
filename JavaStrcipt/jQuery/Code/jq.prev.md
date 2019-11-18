# 同级元素

## jq 获取前一个对象,后一个对象(同级);前后插入一个同级元素

- [jq 获取前一个对象,后一个对象(同级);前后插入一个同级元素](https://blog.csdn.net/Bruce_Zhang0828/article/details/80357313)

```js
var prevObj = $(jq对象).prev();同级的前一个对象

var nextObj = $(jq对象).next();同级的后一个对象

$(jq对象).after("<html></html>");后边插入同级元素

$("jq对象").before("<html></html>")前边插入同级元素
```
