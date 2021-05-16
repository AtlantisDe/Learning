# unset

- [PHPunset()用法详解](https://blog.csdn.net/qq_27988539/article/details/77921438)

## 常用

### 1. 注意事项

```c#
unset() 销毁指定的变量。注意在 PHP 3 中，unset() 将返回 TRUE（实际上是整型值 1），而在 PHP 4 中，unset() 不再是一个真正的函数：它现在是一个语句。这样就没有了返回值，试图获取 unset() 的返回值将导致解析错误。
```

```php
<?php
// 销毁单个变量
unset ($foo);

// 销毁单个数组元素
unset ($bar['quux']);

// 销毁一个以上的变量
unset ($foo1, $foo2, $foo3);
?>
```

### 2. 注意事项

```c#
unset() 在函数中的行为会依赖于想要销毁的变量的类型而有所不同。

如果在函数中 unset() 一个全局变量，则只是局部变量被销毁，而在调用环境中的变量将保持调用 unset() 之前一样的值。
```

```php
<?php
function destroy_foo() {
    global $foo;
    unset($foo);
}

$foo = 'bar';
destroy_foo();
echo $foo;
?>
```

### 3. 注意事项

```c#
如果在函数中 unset() 一个通过引用传递的变量，则只是局部变量被销毁，而在调用环境中的变量将保持调用 unset() 之前一样的值。
```

```php
<?php
function foo(&$bar) {
    unset($bar);
    $bar = "blah";
}

$bar = 'something';
echo "$bar\n";

foo($bar);
echo "$bar\n";
?>
```

### 4. 注意事项

```c#
如果在函数中 unset() 一个静态变量，则 unset() 将销毁此变量及其所有的引用。//我不太能理解这句话的意思，从结果上来看静态变量的值并没有被销毁
```

```php
<?php
function foo() {
    static $a;
    $a++;
    echo "$a\n";
    unset($a);
}

foo();
foo();
foo();
?>
上边的例子将输出：
1
2
3
```

### 5. 注意事项

```c#
如果您想在函数中 unset() 一个全局变量，可使用 $GLOBALS 数组来实现：
```

```php


<?php
function foo() {
    unset($GLOBALS['bar']);
}

$bar = "something";
foo();
?>
```
