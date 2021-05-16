# forEach

- [js 脚本中 forEach()循环. each()循环及普通 for 循环 - Mr.Li[0] - 博客园](https://www.cnblogs.com/MrliBlog/p/11018232.html)

## 常用

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
