# MVC

- [php 简单实现 MVC - 乔晓峰 - 博客园](https://www.cnblogs.com/foonsun/p/5788564.html)

## MVC Demo

## MVC 目录结构

```shell
/*
 ├─www                       # 网站根目录
 │  ├─controller             # 控制器目录
 │  │  ├─democontroller.php  # demo控制器
 │  ├─model                  # 模型目录
 │  │  ├─model.php           # model模型
 │  ├─view                   # 视图目录
 │  │  ├─index.php           # index视图
 │  ├─index.php              # 入口文件
 */
```

## 控制器 controller

- 在这个文件中仅仅定义了一个 DemoController 的类，且其只包含一个 index 方法，用于输出 hello world。

```php
// 将如下代码添加到controller/democontroller.php文件中。
// controller/democontroller.php
 class DemoController
 {
     public function index()
     {
     echo 'hello world';
     }
 }// End of the class DemoController
 // End of file democontroller.php
```

## index.php

- 将下面代码添加到入口文件 index.php 文件中。
- 在浏览器中使用上面的约定的 URL 进行访问，看到输出 hello world。当然如果你请求的 URL 不是那样，而是如下面所示也能得到同样的输出。

```php
//index.php
 require('controller/democontroller.php');
 $controller = new DemoController();
 $controller->index();
 // End of index.php
```

## 改进入口文件

- 同样在浏览器中使用上面的约定的 URL 进行访问，看到输出 hello world。代码中的注释已经说明了每一步的目的。当然可以通过改变 URL 参数中的 c 与 a 值来调用不同的 controller 及其方法，以输出不同的结果。

```php
//index.php
 // get runtime controller prefix
 $c_str = $_GET['c'];
 // the full name of controller
 $c_name = $c_str.'controller';
 // the path of controller
 $c_path = 'controller/'.$c_name.'.php';
 // get runtime action
 $method = $_GET['a'];
 // load controller file
 require($c_path);
 // instantiate controller
 $controller = new $c_name;
 // run the controller  method
 $controller->$method();
 // End of index.php
```

## 视图 View

- 前面只是使用了控制器 controller，同时在入口文件 index.php 中实现了动态调用不同的控制器。接着加入视图将显示分离。

```php
// view/index.php
 class Index {
     public function display($output) {
         // ob_start();
         echo $output;
     }
 }
 // End of index.php
```
