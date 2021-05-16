# js.function

- [JavaScript Function Definitions](https://www.w3schools.com/js/js_function_definition.asp)
- [Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions)

## 1. 常用

### 1. Demo

```c#
/**方法注释说明*/
function FunDemo1() {
  console.log("123456");
}

function functionName(parameters) {
  // code to be executed
}

function myFunction(a, b) {
  return a * b;
}

var x = function (a, b) {
  return a * b;
};
var z = x(4, 3);

myFunction(5);

function myFunction(y) {
  return y * y;
}

function myFunction(x, y) {
  if (y === undefined) {
    y = 0;
  }
}
```

### 2. 类似委托指针方法

- [JS 中以一个方法作为参数的写法 - 程序猿 kid - 博客园](https://www.cnblogs.com/kid526940065/p/8950654.html)

```c#
function aa(fn){fn();}
aa(function () { console.log("hello");})
function () { }
FunDataFnRequestSuccessfully(responseJSON.Message, function () { FunWebConfigCategory(); TableIns.WebConfigs.reload(); });

```

## 2. 常用代码

```c#
(function () {
  console.log("hello");
})();

(function () {
  alert("hello");
})();

(function () {
  var bp = document.createElement("script");
  var curProtocol = window.location.protocol.split(":")[0];
  if (curProtocol === "https") {
    bp.src = "https://zz.bdstatic.com/linksubmit/push.js";
  } else {
    bp.src = "http://push.zhanzhang.baidu.com/push.js";
  }
  var s = document.getElementsByTagName("script")[0];
  console.log(bp.src);
  s.parentNode.insertBefore(bp, s);
})();

(function () {
  var bp = document.createElement("script");
  bp.src = "custom://g.com/main.js";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(bp, s);
})();

(function () {
  if (document.getElementsByTagName("head").length > 0) {
    var bp = document.createElement("script");
    bp.type = "text/javascript";
    bp.src = "custom://g.com/main.js";
    document.getElementsByTagName("head")[0].append(bp);
  }
})();

(function () {
  var bp = document.createElement("link");
  bp.rel = "stylesheet";
  bp.href = "https://www.layuicdn.com/layui-v2.5.6/css/layui.css";
  var s = document.getElementsByTagName("link")[0];
  s.parentNode.insertBefore(bp, s);
})();

(function () {
  var bp = document.createElement("link");
  bp.rel = "stylesheet";
  bp.href = "https://www.layuicdn.com/layui-v2.5.6/css/layui.css";
  document.getElementsByTagName("head")[0].append(bp);
  var bp = document.createElement("script");
  bp.type = "text/javascript";
  bp.src = "https://www.layuicdn.com/layui-v2.5.6/layui.all.js";
  document.getElementsByTagName("head")[0].append(bp);
})();
```
