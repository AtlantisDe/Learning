# setTimeout

- 定义和用法
- setTimeout() 方法用于在指定的毫秒数后调用函数或计算表达式。
- 提示： 1000 毫秒= 1 秒。
- 提示： 如果你只想重复执行可以使用 setInterval() 方法。
- 提示： 使用 clearTimeout() 方法来阻止函数的执行。

## 代码

- [Window setTimeout() 方法 | 菜鸟教程](https://www.runoob.com/jsref/met-win-settimeout.html)

### 多少时间后执行 代码示例 1

```c#
setTimeout(function () {}, 200);

setTimeout(function () {
  alert("Hello");
}, 3000);
```

### 使用 clearTimeout() 来阻止函数的执行

```c#
var myVar;

function myFunction() {
  myVar = setTimeout(function () {
    alert("Hello");
  }, 3000);
}

function myStopFunction() {
  clearTimeout(myVar);
}
```
