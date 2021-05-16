# js.Percent

-[js 将小数转换为百分数 JavaScript_OxygenChen-CSDN 博客](https://blog.csdn.net/cx15733896285/article/details/80913791)

## JS 将小数转换为百分数

```c#
function toPercent(point) {
  if (point == 0) {
    return 0;
  }
  var str = Number(point * 100).toFixed();
  str += "%";
  return str;
}


var a = 50000000000000;
var b = 11762190476226;
console.log(b * 1.0 / a);
```
