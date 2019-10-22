# js 的静态类

- [js 的静态类](https://blog.csdn.net/github_26672553/article/details/51280231)
- [Javascript 静态类的实现 - 心有余白 - 博客园](https://www.cnblogs.com/wenbo/archive/2012/04/06/2434137.html)

## 常用

### 1. Demo 演示

```c#
var StaticClass = function(){};
StaticClass.name = "StaticName";
StaticClass.Sum = function(value1,value2){
    return value1 + value 2;
};

alert(StaticClass.name);      //[StaticName]
alert(StaticClass.Sum(1,3));  //[4]
```
