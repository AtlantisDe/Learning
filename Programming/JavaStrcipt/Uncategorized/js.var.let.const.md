# js.var.let.const

- [JavaScript let 和 const | 菜鸟教程](https://www.runoob.com/js/js-let-const.html)

## 1. 常用

```c#
// let 不可重复
// var 可重复定义,会覆盖前面一次的定义


var SiteSimpleStatistics = {
TotalRequests: 0,
PageRequests: 0,
ImageRequests: 0,
};
```

## 2. 变量作用域

### 1. 全局变量

```c#

var carName = "Volvo";

// 这里可以使用 carName 变量

function myFunction() {
    // 这里也可以使用 carName 变量
}

```

### 2. 局部变量

```c#

// 这里不能使用 carName 变量

function myFunction() {
    var carName = "Volvo";
    // 这里可以使用 carName 变量
}

// 这里不能使用 carName 变量
```

### 3. 重新定义变量

```c#

// 使用 var 关键字重新声明变量可能会带来问题。

// 在块中重新声明变量也会重新声明块外的变量：

var x = 10;
// 这里输出 x 为 10
{
    var x = 2;
    // 这里输出 x 为 2
}
// 这里输出 x 为 2
```

### 3. let 关键字就可以解决这个问题，因为它只在 let 命令所在的代码块 {} 内有效

```c#
var x = 10;
// 这里输出 x 为 10
{
    let x = 2;
    // 这里输出 x 为 2
}
// 这里输出 x 为 10
```

### 4. 还有很多自行查阅官方文档
