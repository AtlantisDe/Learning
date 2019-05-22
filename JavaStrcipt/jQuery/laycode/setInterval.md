# setInterval

- Jquery 延迟函数
- [Jquery 延迟函数 - 浪客是剑心 - 博客园](https://www.cnblogs.com/simonjinx/p/3800595.html)
- [JS 实现几秒后跳转 | 菜鸟工具](https://c.runoob.com/codedemo/5448)

```text
定义和用法
setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式。
setInterval() 方法会不停地调用函数，直到 clearInterval() 被调用或窗口被关闭。由 setInterval() 返回的 ID 值可用作 clearInterval() 方法的参数。
提示： 1000 毫秒= 1 秒。
提示： 如果你只想执行一次可以使用 setTimeout() 方法。
```

## Wiki

- [Window setInterval() 方法 | 菜鸟教程](http://www.runoob.com/jsref/met-win-setinterval.html)

## 每三秒（3000 毫秒）弹出 "Hello"

```js
setInterval(function() {
  alert("Hello");
}, 3000);
```

```js
setInterval('alert("Hello");', 3000);
```

## 3 秒（3000 毫秒）后弹出 "Hello"

## 如果你只想执行一次可以使用 setTimeout() 方法

```js
setTimeout(function() {
  alert("Hello");
}, 3000);
```

## 语法

```js
setInterval(function() {}, [time]);
```

## 常用 JQ 延迟代码

```js
setInterval(function() {}, [time]);
```

## 定时执行和延迟执行

- [jQuery 的定时执行和延迟执行 - big2cat - 博客园](http://www.cnblogs.com/big2cat/p/9849515.html)

```js
setInterval(function() {}, [time]);
```
