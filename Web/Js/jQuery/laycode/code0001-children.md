# 取子元素

## 获取子元素的方法有 2 种方法

- [Jquery 如何获取子元素](https://blog.csdn.net/qq_34543438/article/details/73503884)

```js
// children()方法和find()
// children和find的区别：children只会查找直接子集，而find会跨越层级查找，一直找到没有为止。
$("ul").children("li");
$("ul").children("li").length;
```
